package eshop

class BrowseService {
    def mongo
    def db
    def products

    def getProducts() {
        if (!products) {
            db = mongo.getDB("EShop")
            products = db.getCollection("mongoProduct")
        }
        return products
    }

    def search(params) {
        def page = (params.page as Integer) ?: 0
        def pageSize = 20
        def start = page * pageSize

        def match = [:]
        def productTypeId
        def brandId
        if ((params.brandId as Integer) > -1) {
            brandId = params.brandId as Integer
            match['brand.id'] = brandId
        }

        if ((params.productTypeId as Integer) > -1) {
            productTypeId = params.productTypeId as Integer
            match['productTypes.id'] = productTypeId
        }

        match += params.findAll {key, val -> key.startsWith("ATT")}


        def products = getProducts()
        def brands = products.aggregate(
                [$match: match],
                [$group: [_id: '$brand.id', count: [$sum: 1]]],
                [$sort: [count: -1]]
        ).results().collect {it._id}
        def productTypes = products.aggregate(
                [$match: match],
                [$unwind: '$productTypes'],
                [$match: ['productTypes.parentId': productTypeId]],
                [$group: [_id: '$productTypes.id', count: [$sum: 1]]],
                [$sort: [count: -1]]
        ).results().collect {it._id}
        def productIds = products.aggregate(
                [$match: match],
                [$skip: start],
                [$limit: pageSize]
        ).results().collect {it.baseProductId}
        def totalPages = (products.aggregate(
                [$match: match],
                [$group: [_id: null, count: [$sum: 1]]]
        ).results().collect {it.count}.find() ?: 0) / pageSize
        def attrs = [:]
        def attrGroups = [:]
        if (productTypeId) {
            def pt = ProductType.get(productTypeId)
            def attrNames = AttributeType.findAllByProductType(pt).asList().findAll {it.showPositions.contains("filter")}.collect {it.name}
            attrNames.each {attr ->
                def attrValues = products.aggregate(
                        [$match: match],
                        [$group: [_id: '$' + attr, count: [$sum: 1]]],
                        [$match: [count: [$gt: 0], _id: [$ne: null]]],
                        [$sort: [count: -1]]
                ).results().collect {it._id}
                attrs[attr] = attrValues
            }

            def attrGroupNames = AttributeCategory.findAllByProductType(pt).asList().findAll {it.showPositions.contains("filter")}.collect {it.name}
            attrGroupNames.each {attrGroup ->
                def attrValues = products.aggregate(
                        [$match: match],
                        [$unwind: '$' + attrGroup],
                        [$group: [_id: '$' + attrGroup, count: [$sum: 1]]],
                        [$match: [count: [$gt: 0], _id: [$ne: null]]],
                        [$sort: [count: -1]]
                ).results().collect {it._id}
                attrGroups[attrGroup] = attrValues
            }

        }
        [productTypes: productTypes, brands: brands,
                productIds: productIds, attrs: attrs, attrGroups: attrGroups, totalPages: totalPages]
    }

    def breadCrumb(params) {
        def productType = ProductType.get(params.browsingProductTypeId)
        def result = []
        while (productType?.parentProduct != null) {
            result << [id: productType.id, name: productType.name]
            productType = productType.parentProduct
        }
        result.reverse()
    }

    def getAllSubProductTypes(ProductType productType) {
        BrowseHelper.getAllSubProductTypes(productType)
    }
}
