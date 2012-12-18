package eshop

import grails.converters.JSON
import groovy.sql.Sql

class SiteController {
    def browseService
    def priceService
//    def olapService
    def dataSource

    def findProducts(params) {

    }

    def findFilters(params) {

    }

    def browse() {
        def x = browseService.brands(params)

        def rootProductTypes = ProductType.findAllByParentProductIsNull()

        def pageParams = [:]
        //def products = browseService.findProducts(params)
        //def filters = browseService.findFilters(params)
        def subProductTypes = []
        if (params.productTypeId) {
            subProductTypes = ProductType.findByParentProduct(ProductType.findById(params.productTypeId))
            pageParams["productTypeId"] = params.productTypeId
        }

        [rootProductTypes: rootProductTypes, subProductTypes: subProductTypes, pageParams: pageParams]
    }

    def index2() {
        def rootProductTypes = ProductType.findAllByParentProductIsNull()
        [rootProductTypes: rootProductTypes]
    }

    def sidebar() {
        def subProductTypes = []//olapService.productTypes(params)
        def brands = browseService.brands(params)//olapService.brands(params)
        def breadCrumb = browseService.breadCrumb(params)
        def resp = [subProductTypes: subProductTypes, brands: brands, breadCrumb: breadCrumb, browsingProductTypeId: params.browsingProductTypeId, browsingBrandId: params.browsingBrandId]

        render resp as JSON
    }

    def products() {
//        def list = ProductClosure.createCriteria().listDistinct {
//            if ((params.browsingProductTypeId as Long) > 0)
//                eq("productType", ProductType.get(params.browsingProductTypeId))
//            if ((params.browsingBrandId as Long) > 0)
//                eq("brand", Brand.get(params.browsingBrandId))
//        }
//        list*.product.each {
//            def model = [product: it]
//            model << priceService.calcProductPrice(it.id)
//            render(template: "product_search", model: model)
//        }
    }

    def index() {
        redirect(action: "index2")
//        def productTypes = ProductType.findAllByParentProductIsNull()
//        def newProducts = Product.findAll()
//        [productTypes: productTypes, newProducts: newProducts]
    }

    def category() {
        def productTypes = ProductType.findAllByParentProductIsNull()

        def productType = ProductType.get(params.id)
        def filterProductTypes
        if (productType)
            filterProductTypes = ProductType.findAllByParentProduct(productType)
        else
            filterProductTypes = ProductType.findAllByParentProductIsNull()

//        Brand.findAll("from Brand as b where exists (from Product as p )")

        [productTypes: productTypes, filterProductTypes: filterProductTypes]
    }

    def product() {
        def productTypes = ProductType.findAllByParentProductIsNull()
        def product = Product.get(params.id)
        def model = [productTypes: productTypes, product: product]
        model << priceService.calcProductPrice(product?.id)
        model
    }

    def image() {
        redirect(controller: "image", params: params)
    }

    def searchRow() {

    }

    def productAbstract() {
        def productId = 3
        def product = Product.get(productId)
        def model = [product: product]
        model << priceService.calcProductPrice(productId)

        render(template: "product_search", model: model)
    }

    def flushChanges() {
        def sql = new Sql(dataSource)
        sql.execute("CALL `populate_product_closure`()")
        render "OK"
    }
}
