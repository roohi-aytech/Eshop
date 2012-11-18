package eshop

import grails.converters.JSON

class SiteController {
    def browseService

    def index2() {
        def rootProductTypes = ProductType.findAllByParentProductIsNull()
        [rootProductTypes: rootProductTypes]
    }

    def sidebar() {
        def productType = ProductType.findById(params.id)
        def subProductTypes = productType.children.collect {[id: it.id, name: it.name]}
        def resp = [subProductTypes: subProductTypes]

        def allSubProducts = browseService.getAllSubProductTypes(productType)
        def allSubProductIds = allSubProducts.collect {it.id}
        def brandCritiera = Product.withCriteria {
            createAlias("productTypes", "productType")
            'in'("productType.id", allSubProductIds)
        }
        render resp as JSON
    }

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
