package eshop

class SiteController {

    def index() {
        def productTypes = ProductType.findAllByParentProductIsNull()
        [productTypes: productTypes]
    }

    def category() {
        def productTypes = ProductType.findAllByParentProductIsNull()

        def productType = ProductType.get(params.id)
        def filterProductTypes = ProductType.findAllByParentProduct(productType)

        Brand.findAll("from Brand as b where exists (from Product as p where p.)")
        [productTypes: productTypes, filterProductTypes: filterProductTypes]
    }
}
