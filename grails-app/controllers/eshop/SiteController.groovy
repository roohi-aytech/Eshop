package eshop

import eshop.discout.Discount
import grails.converters.JSON
import groovy.sql.Sql
import eshop.mongo.MongoProduct

import javax.servlet.http.Cookie

class SiteController {
    def browseService
    def priceService
//    def olapService
    def dataSource
    def springSecurityService

    def findProducts(params) {

    }

    def findFilters(params) {

    }

    def browse() {
        def productType = params.productType ? ProductType.findByName(params.productType) : null
        if (!productType) {
            flash.message = message(code: "productType.not.found")
            redirect(action: "index")
        }

        def model = [productType: productType]

        model.commonLink = createLink(action: "browse")

        def productTypeChain = []
        def productTypeNavigator = productType
        while (productTypeNavigator) {
            productTypeChain << productTypeNavigator
            productTypeNavigator = productTypeNavigator.parentProduct
        }
        productTypeChain = productTypeChain.reverse()

        model.breadCrumb = []

        productTypeChain.each {
            model.breadCrumb << [name: it.name, href: "${model.commonLink}/${it.name}/"]
        }

        model.subProductTypeLinks = []
        def base = "${model.commonLink}/"

        productType.children.each {
            model.subProductTypeLinks << [name: it.name, href: base + it.name, id: it.id]
        }

        model.productTypeTypeLinks = []
        if(productType.children.isEmpty())
        {
            productType.types.each{
                model.productTypeTypeLinks << [name: it.title, href: createLink(action: "filter", params:[f: "p${productType.id},t${it.id}"]), id: it.id]
            }
        }

        model.rootProductTypes = ProductType.findAllByParentProductIsNull()
        model.filters = browseService.findProductTypeFilters(model.productType, params.page ?: 0)

        model.slides = Slide.createCriteria().list {
            productTypes {
                eq('id', productType.id)
            }
        }
//        model.discounts = Discount.findAllByFromDateLessThanEqualsAndToDateGreaterThanEqualsAndRemainCountGreaterThan new Date(), new Date(), 0

        model.pageContext = [:]
        model.pageContext["productTypes.id"] = [productType.id]

        def pageDetails = PageDetails.findByProductType(productType)
        if (pageDetails)
            model.title = pageDetails?.title?.replace('$BRAND$', '')
        else
            model.title = productType.name
        model.description = pageDetails?.description?.replace('$BRAND$', '')
        model.keywords = pageDetails?.keywords?.replace('$BRAND$', '')

        model
    }

    def filter() {
        def model = [:]
        model.filters = browseService.findFilteredPageFilters(params.f, params.page ?: 0)
        model.commonLink = createLink(controller: "site").replace("/index", "")

        model.rootProductTypes = ProductType.findAllByParentProductIsNull()
        model.slides = Slide.findAll()

        def brand
        if (model.filters["selecteds"]["b"])
            brand = Brand.createCriteria().list {
                'in'('id', model.filters["selecteds"]["b"])
            }.collect { it.name }.join(', ')
        if (!brand)
            brand = ''

        def productType = ProductType.get(params.f?.split(',')?.find{it.startsWith('p')}?.replace('p', '')?.toLong())
        model.productTypeTypeLinks = []
        if(productType && productType.children.isEmpty() && !params.f?.split(',')?.find{it.startsWith('t')})
        {
            productType.types.each{
                model.productTypeTypeLinks << [name: it.title, href: createLink(action: "filter", params:[f: "${params.f},t${it.id}"]), id: it.id]
            }
        }

        def pageDetails = params.f?.contains('p')?PageDetails.findByProductType(ProductType.get(params.f.split(',').find {it.contains('p')}.replace('p', '').toLong())):null
        if (pageDetails)
            model.title = pageDetails?.title?.replace('$BRAND$', brand)
        model.description = pageDetails?.description?.replace('$BRAND$', brand)
        model.keywords = pageDetails?.keywords?.replace('$BRAND$', brand)

        model
    }

    def filter1() {
        def x = browseService.search(params)
        def rootProductTypes = ProductType.findAllByParentProductIsNull()

        params.remove("page")
        def pageParams = params

        def subProductTypes = x.productTypes.collect { ProductType.get(it) }
        def brands = x.brands.collect { Brand.get(it) }
        def products = x.productIds.collect { Product.get(it) }
        def totalPages = x.totalPages
        def attrs = x.attrs
        def attrgroups = x.attrGroups
        def page = (params.page as Integer) ?: 0
        [rootProductTypes: rootProductTypes, subProductTypes: subProductTypes,
                brands: brands, products: products,
                attrs: attrs, attrGroups: attrgroups,
                totalPages: totalPages, page: page,
                pageParams: pageParams]
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

    def messageService

    def index() {
        if (springSecurityService.loggedIn && !(springSecurityService.currentUser instanceof Customer)) {
            redirect(uri: '/admin')
            return
        }

        if (session.forwardUri) {
            def url = session.forwardUri
            session.forwardUri = null
            url = url.replace(request.contextPath, "")
            redirect url: url
            return
        }

        //product type
        def productType = [
                children: ProductType.findAllByParentProductIsNull()
        ]

        def model = [productType: productType]

        model.commonLink = createLink(action: "browse")

//        def productTypeChain = []
//        def productTypeNavigator = productType
//        while (productTypeNavigator) {
//            productTypeChain << productTypeNavigator
//            productTypeNavigator = productTypeNavigator.parentProduct
//        }
//        productTypeChain = productTypeChain.reverse()

        model.breadCrumb = []

//        productTypeChain.each {
//            model.breadCrumb << [name: it.name, href: "${model.commonLink}/${it.name}/"]
//        }

        model.subProductTypeLinks = []
        def base = "${model.commonLink}/"

        productType.children.each {
            model.subProductTypeLinks << [name: it.name, href: base + it.name, id: it.id]
        }

        model.rootProductTypes = ProductType.findAllByParentProductIsNull()

        model.filters = browseService.findProductTypeFilters(null, params.page ?: 0)

        //seo
//        model.pageContext = [:]
//        model.pageContext["productTypes.id"] = [0]
//
//        def pageDetails = PageDetails.findByProductType(productType)
//        if (pageDetails)
//            model.title = pageDetails?.title?.replace('$BRAND$', '')
//        else
//            model.title = productType.name
//        model.description = pageDetails?.description?.replace('$BRAND$', '')
//        model.keywords = pageDetails?.keywords?.replace('$BRAND$', '')

        //slides
        model.slides = Slide.findAll()
        model.specialSaleSlides= SpecialSaleSlide.findAllByStartDateLessThanEqualsAndFinishDateGreaterThanEqualsAndRemainingCountGreaterThan(new Date(), new Date(), 0)

        model
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
        def productTypeList = ProductType.findAllByParentProductIsNull()
        def product = Product.get(params.id)
        def model = [productTypes: productTypeList, product: product]
        model << priceService.calcProductPrice(product?.id)

        model.commonLink = createLink(action: "browse")

        def productTypeChain = []
        def productTypeNavigator = product.productTypes.toArray()[0]
        while (productTypeNavigator) {
            productTypeChain << productTypeNavigator
            productTypeNavigator = productTypeNavigator.parentProduct
        }
        productTypeChain = productTypeChain.reverse()

        model.breadCrumb = []

        productTypeChain.each {
            model.breadCrumb << [name: it.name, href: "${model.commonLink}/${it.name}/", id: it.id]
        }

        model.rootProductTypes = ProductType.findAllByParentProductIsNull()

        model.mostVisitedProducts = Product.createCriteria().list([max: 20, sort: "visitCount", order: "desc"]) {
            productTypes {
                eq('id', model.breadCrumb.last().id)
            }
        }

        //attributes
        model.rootAttributeCategories = AttributeCategory.findAllByProductTypeAndParentCategoryIsNull(product.productTypes.toArray().first()).toList()
                .collect { [item: it] }
//                .collect { [id: it.id, name: it.name, categories: [], attributes: []] }


        model.rootAttributeCategories.each {
            category ->
                fillAttibuteCategoryChildren(product, category)
        }

        //update product visit count
        if (!product.visitCount)
            product.visitCount = 0;
        product.visitCount++;
        product.save()

        //update last visited products
        def lastVisitedProducts
        synchronized (this.getClass()) {
            lastVisitedProducts = session.getAttribute('lastVisitedProducts')
            if (!lastVisitedProducts) {
                lastVisitedProducts = []
                String lastVisitedProductsStr = cookie(name: 'lastVisitedProducts')
                if (lastVisitedProductsStr)
                    lastVisitedProducts = lastVisitedProductsStr.split(",").toList()
            }
            if (!lastVisitedProducts.contains(params.id))
                lastVisitedProducts.add(params.id)
            session.setAttribute('lastVisitedProducts', lastVisitedProducts)
        }

        if (lastVisitedProducts) {
            Cookie cookie = new Cookie("lastVisitedProducts", lastVisitedProducts.join(","))
            cookie.maxAge = 100
            response.addCookie(cookie)
        }

        model
    }

    def productCard(){
        def product = Product.get(params.productId)

        def models = ProductModel.findAllByProduct(product)
        def productModel
        models.each{
            def model = it
            Boolean selected = true
            product.variations.each {variation ->
                def modelVariationId = model.variationValues.find{it.variationGroup.id == variation.variationGroup.id}?.id.toLong()
                def selectedVariationId = params."variation${variation.id}".toLong()
                if(modelVariationId != selectedVariationId)
                    selected = false

            }

            if(model.guarantee.id.toLong()!= params.guarantee.toLong())
                selected = false

            if(selected)
                productModel = model
        }

        render(template: 'product/card', model: [product:product, productModel:productModel])
    }

    def productImage() {
        def product = Product.get(params.id)

        render(template: "productImages", model: [product: product, selectedImage: product.images.find{it.id.toString() == params.img.toString()}])
    }

    def fillAttibuteCategoryChildren(Product product, parentCategory) {

        parentCategory.attributes = product.attributes.findAll {
            attr ->
                attr?.attributeType?.category?.id == parentCategory.item.id
        }

        parentCategory.childCategories = AttributeCategory.findAllByParentCategory(parentCategory.item).collect { [item: it] }
        parentCategory.childCategories.each { childCategory ->
            fillAttibuteCategoryChildren(product, childCategory)
        }
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
