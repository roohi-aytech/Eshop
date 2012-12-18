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

    def brands(params) {
        def products = getProducts()
        def rs = products.aggregate(
                //[$unwind: '$productTypes'],
                [$match: ['productTypes.id': 47]],
                //[$group: [_id: '$brand', brandCount: [$sum: 1]]],
                [$group: [_id: '$سیستم', systemCount: [$sum: 1]]]
        ).results()
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
