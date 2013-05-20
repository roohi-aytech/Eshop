package eshop

import eshop.mongo.MongoProduct

class MongoService {

    def priceService

    def storeProduct(Product product) {
        def mongoProduct = MongoProduct.findByBaseProductId(product.id)
        if (!mongoProduct) {
            mongoProduct = new MongoProduct(baseProductId: product.id)
        }

        product.properties.each {
            if (it.value instanceof String)
                mongoProduct[it.key] = it.value
        }
        mongoProduct['price'] = priceService.calcProductPrice(product.id).showVal
        mongoProduct['brand'] = [id: product?.brand?.id, name: product?.brand?.name]
        mongoProduct['type'] = [id: product?.type?.id, name: product?.type?.title]
        def productTypes = collectProductTypes(product)
        mongoProduct['productTypes'] = productTypes.collect {[id: it.id, name: it.name, parentId: it?.parentId]}

        product.attributes.findAll {it.attributeType.showPositions.contains("filter")}.each {
            if (it.value)
                mongoProduct["a${it.attributeType.id}"] = it.value?.value
            else if (it.attributeType.defaultValue)
                mongoProduct["a${it.attributeType.id}"] = it.attributeType.defaultValue
        }

        def attributeCategories = AttributeCategory.findAllByIdInList(product.attributes.findAll{it.attributeType?.category?.showPositions?.contains("filter")}.collect{it.attributeType.category.id})
        attributeCategories.each {
            def attributes = Attribute.findAllByProductAndAttributeTypeInListAndValueIsNotNull(product, AttributeType.findAllByCategory(it))
            mongoProduct["ac${it.id}"] = attributes.collect{[id: it.attributeType.id, name:it.attributeType.name, valueId:it.value?.id, value:it.value?.value]}
        }

        mongoProduct.save(flush: true)
    }

    private def collectProductTypes(Product product) {
        def res = []
        product.productTypes.each {
            res.addAll(collectProductTypes(it))
        }
        return res
    }

    private def collectProductTypes(ProductType productType) {
        def res = [[name: productType?.name, id: productType?.id,parentId: productType?.parentProduct?.id]]

        if (productType.parentProduct)
            res.addAll(collectProductTypes(productType.parentProduct))

        return res
    }
}
