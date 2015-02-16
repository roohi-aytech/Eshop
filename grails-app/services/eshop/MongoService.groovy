package eshop

import eshop.mongo.MongoProduct

class MongoService {

    def priceService
    def mongo
    def grailsApplication

    def storeProduct(Product product) {
        storeProductInternal(product, 0)
    }

    def clear() {
        def db
        if(grailsApplication.config.eShop.instance=='felfel')
            db = mongo.getDB("FelFel")
        else
            db = mongo.getDB("EShop")
        db.dropDatabase()
        return 100

//        def list = MongoProduct.findAll()
//        def count = list.size()
//        list.each { mongoProduct ->
//            mongoProduct.delete(flush: true)
//        }
//        count
    }

    private def storeProductInternal(Product prod, int cnt) {
        synchronized (prod) {

            //delete products if exists
            def mongoProducts = MongoProduct.findAllByBaseProductId(prod.id)

            if (mongoProducts) {
                mongoProducts.each {
                    it.delete(flush: true)
                }
            }

            //if prod is deleted skip save
            if (prod?.deleted) {
                prod.isSynchronized = true
                prod.save()
                return
            }

            def productTypeId = prod?.productTypes?.count {
                it
            } > 0 ? prod?.productTypes?.toArray()?.first()?.id : 0.toLong()

            def productTypeList = collectProductTypes(prod)

            def customerReviews = CustomerReview.findAllByProduct prod
            def rate = CustomerReview.findAllByProduct(prod).count { it } == 0 ? 0 : ((double)customerReviews.sum(0, {
                it.rate
            }) / customerReviews.count { it })

            def totalResult = true
            //iterate prod types
            def productModels = ProductModel.findAllByProduct(prod)
            productModels.each { productModel ->

                def mongoProduct = new MongoProduct(baseProductId: prod.id, modelId: productModel.id)

                //prod based
                prod.properties.each {
                    if (it.value instanceof String)
                        mongoProduct[it.key] = it.value
                }
                mongoProduct['displayInList'] = prod.isVisible || prod.isVisible == null
                mongoProduct['brand'] = [id: prod?.brand?.id, name: prod?.brand?.name]
                mongoProduct['type'] = [id: prod?.type?.id, name: prod?.type?.title]
                mongoProduct['visitCount'] = prod?.visitCount ?: 0
                mongoProduct['saleCount'] = prod?.saleCount
                mongoProduct['customerRate'] = rate

                //prod types
                mongoProduct['productTypes'] = productTypeList.collect {
                    [id: it.id, name: it.name, parentId: it?.parentId]
                }

                //attributes
                prod.attributes.findAll {
                    it?.attributeType?.showPositions?.contains("filter") && !it?.attributeType?.deleted
                }.each {
                    if (it.value)
                        if (it.value?.group)
                            mongoProduct["a${it.attributeType.id}"] = it.value?.group?.value
                        else
                            mongoProduct["a${it.attributeType.id}"] = it.value?.value
                    else if (it.attributeType.defaultValue)
                        mongoProduct["a${it.attributeType.id}"] = it.attributeType?.defaultValue?.value
                }

                //attribute categories
                def attributeCategories = AttributeCategory.findAllByIdInList(prod.attributes.findAll {
                    it?.attributeType?.category?.showPositions?.contains("filter") && !it.attributeType?.category?.deleted
                }.collect { it.attributeType.category.id })
                attributeCategories.each {
                    def attributes = Attribute.findAllByProductAndAttributeTypeInListAndValueIsNotNull(prod, AttributeType.findAllByCategory(it))
                    mongoProduct["ac${it.id}"] = attributes.collect {
                        [id: it.attributeType.id, name: it.attributeType.name, valueId: it.value?.id, value: it.value?.value]
                    }
                }

                //model based
                def priceData = priceService.calcProductModelPrice(productModel.id)
                mongoProduct['price'] = priceData.showVal
                def oldPriceData = priceService.calcProductModelOldPrice(productModel.id)
                mongoProduct['priceChange'] = (oldPriceData.showVal ?: 0) - (priceData.showVal ?: 0)
                mongoProduct['priceChangeDate'] = priceData.lastUpdate?.time ?: 0

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

                //variations
                productModel.variationValues.each {
                    mongoProduct["v${it?.variationGroup?.id}"] = [[id: it.id, name: it.value]]
                }

                //sort order
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
                        gt('saleCount', prod?.saleCount)
                        and {
                            eq('saleCount', prod?.saleCount)
                            gt('visitCount', prod?.visitCount)
                        }
                    }
                } + 10 * ProductModel.createCriteria().count{
                    lt('id', productModel?.id)
                    product{
                        eq('id', productModel?.product?.id)
                    }
                }

                //save object
                try {
                    if (!mongoProduct.save(flush: true))
                        totalResult = false
                } catch (e) {
                    e.printStackTrace()
                    if (cnt < 5)
                        storeProductInternal(prod, cnt + 1)
                }
            }


            if (totalResult) {
                prod.isSynchronized = true
                prod.save()
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
