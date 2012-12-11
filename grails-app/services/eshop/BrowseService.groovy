package eshop

class BrowseService {
    def mongo
    def db
    def products

    def getProducts(){
        if(!products){
            db=mongo.getDB("EShop")
            products=db.mongoProducts
        }
        return products
    }
    def brands(){
        products.aggregate(
                []
        )
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
