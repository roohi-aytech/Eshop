package eshop

class SiteController {

    def index() {
        def productTypes = ProductType.findAllByParentProductIsNull()
		def newProducts = Product.findAll()
        [productTypes: productTypes,newProducts:newProducts]
		
    }

    def category() {
        def productTypes = ProductType.findAllByParentProductIsNull()

        def productType = ProductType.get(params.id)
        def filterProductTypes = ProductType.findAllByParentProduct(productType)

        Brand.findAll("from Brand as b where exists (from Product as p )")
        [productTypes: productTypes, filterProductTypes: filterProductTypes]
    }

    def product() {
        def product = Product.get(params.id)
        [product: product]
    }

    def image(){
        if (params.id){
            def product=Product.get(params.id)
            if(product.images && product.images.size()>0){
                response.contentType = 'image/png'
                response.outputStream << product.images.find().fileContent
                response.outputStream.flush()

            }


        }
    }
}
