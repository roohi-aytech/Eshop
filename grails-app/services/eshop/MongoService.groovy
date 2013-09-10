package eshop

import eshop.mongo.MongoProduct

class MongoService {

    def priceService

    def storeProduct(Product product) {
        storeProductInternal(product, 0)
    }

    private def storeProductInternal(Product product, int cnt) {
        synchronized (product) {
            def mongoProducts = MongoProduct.findAllByBaseProductId(product.id)

            if (mongoProducts) {
                mongoProducts.each {it.delete(flush: true)}
            }
            if (product?.deleted)
                return

            def mongoProduct = new MongoProduct(baseProductId: product.id)

            product.properties.each {
                if (it.value instanceof String)
                    mongoProduct[it.key] = it.value
            }
            mongoProduct['displayInList'] = product.isVisible || product.isVisible == null
            def priceData = priceService.calcProductPrice(product.id)
            mongoProduct['price'] = priceData.showVal
            mongoProduct['brand'] = [id: product?.brand?.id, name: product?.brand?.name]
            mongoProduct['type'] = [id: product?.type?.id, name: product?.type?.title]
            mongoProduct['visitCount'] = product?.visitCount ?: 0
            mongoProduct['saleCount'] = product?.saleCount
            switch (priceData.status) {
                case 'exists':
                    mongoProduct['status'] = 0
                    break
                case 'inquiry-required':
                    mongoProduct['status'] = 1
                    break
                case 'coming-soon':
                    mongoProduct['status'] = 2
                    break
                case 'not-exists':
                    mongoProduct['status'] = 3
                    break
            }
            def productTypeId = product?.productTypes?.count { it } > 0 ? product?.productTypes?.toArray()?.first()?.id : 0.toLong()
            mongoProduct['sortOrder'] = Product.createCriteria().count {
                eq('deleted', false)
                or {
                    eq('isVisible', true)
                    isNull('isVisible')
                }
                productTypes {
                    eq('id', productTypeId)
                }
                or {
                    gt('saleCount', product?.saleCount)
                    and {
                        eq('saleCount', product?.saleCount)
                        gt('visitCount', product?.visitCount)
                    }
                }
            }
            def productTypes = collectProductTypes(product)
            mongoProduct['productTypes'] = productTypes.collect { [id: it.id, name: it.name, parentId: it?.parentId] }

            product.attributes.findAll { it?.attributeType?.showPositions?.contains("filter") && !it?.attributeType?.deleted }.each {
                if (it.value)
                    if (it.value?.group)
                        mongoProduct["a${it.attributeType.id}"] = it.value?.group?.value
                    else
                        mongoProduct["a${it.attributeType.id}"] = it.value?.value
                else if (it.attributeType.defaultValue)
                    mongoProduct["a${it.attributeType.id}"] = it.attributeType.defaultValue
            }

            def attributeCategories = AttributeCategory.findAllByIdInList(product.attributes.findAll { it?.attributeType?.category?.showPositions?.contains("filter") && !it.attributeType?.category?.deleted }.collect { it.attributeType.category.id })
            attributeCategories.each {
                def attributes = Attribute.findAllByProductAndAttributeTypeInListAndValueIsNotNull(product, AttributeType.findAllByCategory(it))
                mongoProduct["ac${it.id}"] = attributes.collect { [id: it.attributeType.id, name: it.attributeType.name, valueId: it.value?.id, value: it.value?.value] }
            }

            product.variations
//                .findAll {it?.variationGroup?.showInFilter}
                    .each {
                if (it.variationValues.count {it} > 0)
                    mongoProduct["v${it.variationGroup?.id}"] = it.variationValues.collect {[id: it.id, name: it.value]}
            }
            try {
                mongoProduct.save(flush: true)
                product.isSynchronized = true
                product.save()
            } catch (e) {
                e.printStackTrace()
                if (cnt < 5)
                    storeProductInternal(product, cnt + 1)
            }
        }
    }

    private def collectProductTypes(Product product) {
        def res = []
        product.productTypes.findAll { !it?.deleted }.each {
            res.addAll(collectProductTypes(it, new HashSet()))
        }
        return res
    }

    private def collectProductTypes(ProductType productType, Set visited) {
        if (visited.contains(productType))
            return []
        visited.add(productType)
        def res = [[name: productType?.name, id: productType?.id, parentId: productType?.parentProduct?.id]]

        if (productType.parentProduct)
            res.addAll(collectProductTypes(productType.parentProduct, visited))

        productType.godFathers.each {
            res.addAll(collectProductTypes(ProductType.get(it.id), visited))
        }

        return res
    }
}
