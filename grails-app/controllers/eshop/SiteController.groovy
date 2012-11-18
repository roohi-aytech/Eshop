package eshop

import grails.converters.JSON

class SiteController {
    def browseService
    def olapService

    def index2() {
        def rootProductTypes = ProductType.findAllByParentProductIsNull()
        [rootProductTypes: rootProductTypes]
    }

    def sidebar() {
        def subProductTypes = olapService.productTypes(params)
        def brands = olapService.brands(params)
        def breadCrumb = browseService.breadCrumb(params)
        def resp = [subProductTypes: subProductTypes, brands: brands, breadCrumb: breadCrumb, browsingProductTypeId: params.browsingProductTypeId, browsingBrandId: params.browsingBrandId]

        render resp as JSON
    }

    def index() {
        def productTypes = ProductType.findAllByParentProductIsNull()
		def newProducts = Product.findAll()
        [productTypes: productTypes, newProducts: newProducts]
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
