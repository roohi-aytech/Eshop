package eshop

import eshop.mongo.MongoProduct

class MongoService {

    def priceService

    def storeProduct(Product product) {

        def mongoProduct = MongoProduct.findByBaseProductId(product.id)

        if (mongoProduct) {
            mongoProduct.delete(flush: true)
        }
        if (product?.deleted)
            return

        mongoProduct = new MongoProduct(baseProductId: product.id)

        product.properties.each {
            if (it.value instanceof String)
                mongoProduct[it.key] = it.value
        }
        mongoProduct['isVisible'] = product.isVisible || product.isVisible == null
        mongoProduct['price'] = priceService.calcProductPrice(product.id).showVal
        mongoProduct['brand'] = [id: product?.brand?.id, name: product?.brand?.name]
        mongoProduct['type'] = [id: product?.type?.id, name: product?.type?.title]
        mongoProduct['visitCount'] = product?.visitCount?:0
        mongoProduct['saleCount'] = product?.models?.count { it } == 0 ? 0 : Order.createCriteria().count {
            'eq'('status', OrderHelper.STATUS_DELIVERED)
            items {
                'in'('productModel', ProductModel.findAllByProduct(product))
            }
        }
        def productTypes = collectProductTypes(product)
        mongoProduct['productTypes'] = productTypes.collect { [id: it.id, name: it.name, parentId: it?.parentId] }

        product.attributes.findAll { it?.attributeType?.showPositions?.contains("filter") && !it?.attributeType?.deleted }.each {
            if (it.value)
                mongoProduct["a${it.attributeType.id}"] = it.value?.value
            else if (it.attributeType.defaultValue)
                mongoProduct["a${it.attributeType.id}"] = it.attributeType.defaultValue
        }

        def attributeCategories = AttributeCategory.findAllByIdInList(product.attributes.findAll { it?.attributeType?.category?.showPositions?.contains("filter") && !it.attributeType?.category?.deleted }.collect { it.attributeType.category.id })
        attributeCategories.each {
            def attributes = Attribute.findAllByProductAndAttributeTypeInListAndValueIsNotNull(product, AttributeType.findAllByCategory(it))
            mongoProduct["ac${it.id}"] = attributes.collect { [id: it.attributeType.id, name: it.attributeType.name, valueId: it.value?.id, value: it.value?.value] }
        }

        mongoProduct.save(flush: true)
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
