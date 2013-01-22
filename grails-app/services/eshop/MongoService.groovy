package eshop

import eshop.mongo.MongoProduct

class MongoService {

    def storeProduct(Product product) {
        def mongoProduct = MongoProduct.findByBaseProductId(product.id)
        if (!mongoProduct) {
            mongoProduct = new MongoProduct(baseProductId: product.id)
        }

        product.properties.each {
            if (it.value instanceof String)
                mongoProduct[it.key] = it.value
        }
        mongoProduct['brand'] = [id: product?.brand?.id, name: product?.brand?.name]
        def productTypes = collectProductTypes(product)
        mongoProduct['productTypes'] = productTypes.collect {[id: it.id, name: it.name, parentId: it?.parentId]}
        //mongoProduct['productTypeIds'] = productTypes.collect {it.id}

        product.attributes.findAll {it.attributeType.showPositions.contains("filter")}.each {
            if (it.attributeValue)
                mongoProduct["a${it.attributeType.id}"] = it.attributeValue
            else if (it.attributeType.defaultValue)
                mongoProduct["a${it.attributeType.id}"] = it.attributeType.defaultValue
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
