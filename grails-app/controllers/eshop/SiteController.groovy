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
        def filterProductTypes
        if(productType)
            filterProductTypes= ProductType.findAllByParentProduct(productType)
        else
            filterProductTypes=ProductType.findAllByParentProductIsNull()

//        Brand.findAll("from Brand as b where exists (from Product as p )")

        [productTypes: productTypes, filterProductTypes: filterProductTypes]
    }

    def product() {
        def productTypes = ProductType.findAllByParentProductIsNull()
        def product = Product.get(params.id)
        [productTypes: productTypes, product: product]
    }

    def image(){
        redirect(controller: "image",params:params)
    }
}
