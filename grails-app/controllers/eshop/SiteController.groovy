package eshop

import eshop.discout.Discount
import grails.converters.JSON
import groovy.sql.Sql
import eshop.mongo.MongoProduct
import org.compass.core.engine.SearchEngineQueryParseException

import javax.servlet.http.Cookie

class SiteController {

    static defaultAction = "index"

    def browseService
    def priceService
    def searchableService
    def dataSource
    def springSecurityService
    def trackingService
    def messageService
    def mongoService
    def mailService
    def simpleCaptchaService
    def imageService

    def findProducts(params) {

    }

    def findFilters(params) {

    }

    def browse() {
        def productType = params.productType ? ProductType.findBySeoFriendlyName(params.productType) ?: ProductType.findBySeoFriendlyAlternativeName(params.productType) ?: ProductType.findByName(params.productType) : null
        if (!productType || productType.deleted) {
            flash.message = message(code: "productType.not.found")
            redirect(action: "index")
        }

        trackingService.trackExplore(productType)

        def model = [productType: productType]

        model.commonLink = createLink(uri: '/browse')

        def productTypeChain = []
        def productTypeNavigator = productType
        while (productTypeNavigator) {
            productTypeChain << productTypeNavigator
            productTypeNavigator = productTypeNavigator.parentProduct
        }
        productTypeChain = productTypeChain.reverse()

        model.breadCrumb = []

        productTypeChain.each {
            model.breadCrumb << [name: it.name, href: "${model.commonLink}/${it.urlName}/"]
        }

        model.subProductTypeLinks = []
        def base = "${model.commonLink}/"

        productType.children.findAll { !it.deleted }.each {
            model.subProductTypeLinks << [name: it.name, href: base + it.urlName, id: it.id]
        }

        ProductType.createCriteria().listDistinct {
            godFathers {
                eq('id', productType.id)
                ne('deleted', true)
            }
        }.each {
            model.subProductTypeLinks << [name: it.name, href: base + it.urlName, id: it.id]
        }

        model.articles = JournalArticle.findAllByBaseProduct productType

        model.productTypeTypeLinks = []
        if (productType.children.isEmpty()) {
            productType.types.each {
                model.productTypeTypeLinks << [name: it.title, href: createLink(action: "filter", params: [f: "p${productType.id},t${it.id}"]), id: it.id]
            }
        }

        model.rootProductTypes = ProductType.findAllByParentProductIsNull()
        model.filters = browseService.findProductTypeFilters(model.productType, params.page ?: 0)

        model.slides = Slide.createCriteria().list {
            productTypes {
                eq('id', productType.id)
            }
        }
        model.pageContext = [:]
        model.pageContext["productTypes.id"] = [productType.id]

        model.title = productType.pageTitle ?: productType.name
        model.description = productType.description
        model.keywords = productType.keywords

        model.productTypeId = productType?.id
        model.productTypeName = productType?.name

        model
    }

    def filter() {
        def model = [:]
        model.filters = browseService.findFilteredPageFilters(params.f, params.page ?: 0)
        model.commonLink = createLink(uri: '/')

        model.rootProductTypes = ProductType.findAllByParentProductIsNull()
        model.slides = Slide.findAll()

        def brandList = new ArrayList<Brand>()
        def brand
        if (model.filters["selecteds"]["b"])
            brandList.addAll(Brand.createCriteria().list {
                'in'('id', model.filters["selecteds"]["b"])
            })
        brand = brandList.collect { it.name }.join(', ')
        if (!brand)
            brand = ''

        def productType = ProductType.get(params.f?.split(',').reverse()?.find { it.startsWith('p') }?.replace('p', '')?.toLong())
        model.productTypeTypeLinks = []
        if (productType && productType.children.isEmpty() && !params.f?.split(',')?.find { it.startsWith('t') }) {
            productType.types.each {
                model.productTypeTypeLinks << [name: it.title, href: createLink(action: "filter", params: [f: "${params.f},t${it.id}"]), id: it.id]
            }
        }

        trackingService.trackExplore(productType, brandList)

        if (productType) {
            if (brand != '') {
                //brand and productType def pageDetails
                def pageDetails = PageDetails.findByProductType(productType)
                if (pageDetails) {
                    model.title = pageDetails?.title?.replace('$BRAND$', brand)
                    model.description = pageDetails?.description?.replace('$BRAND$', brand)
                    model.keywords = pageDetails?.keywords?.replace('$BRAND$', brand)
                } else {
                    model.title = productType?.toString()
                    if (brand && brand != "")
                        model.title = (model.title ? model.title + " - " : "") + brand

                }
            } else {
                //productType only
                model.title = productType.pageTitle ?: productType.name
                model.description = productType.description
                model.keywords = productType.keywords
            }

            model.articles = JournalArticle.findAllByBaseProduct productType

        } else if (brand != '') {
            //brand only
            if (brandList.count { it } == 1) {
                model.title = brandList.first()?.pageTitle ?: brandList.first()?.name
                model.description = brandList.first()?.description
                model.keywords = brandList.first()?.keywords
            } else {
                model.title = brand
            }
        } else {
            //no filter
            model.title = message(code: 'site.mainPage.title')
            model.description = message(code: 'site.mainPage.description')
            model.keywords = message(code: 'site.mainPage.keywords')
        }

        model.productTypeId = productType?.id
        model.productTypeName = productType?.name

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

    def index() {
//        if (springSecurityService.loggedIn && !(springSecurityService.currentUser instanceof Customer)) {
//            redirect(uri: '/admin')
//            return
//        }

        if (session.forwardUri) {

            trackingService.trackSignIn()

            def url = session.forwardUri
            session.forwardUri = null
            url = url.replace(request.contextPath, "")
            redirect url: url
            return
        }

        trackingService.trackExplore()

        //product type
        def productType = [
                children: ProductType.findAllByParentProductIsNull()
        ]

        def model = [productType: productType]

        model.commonLink = createLink(uri: '/browse').replace('/site', '')

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
            model.subProductTypeLinks << [name: it.name, href: base + it.urlName, id: it.id]
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
        model.specialSaleSlides = SpecialSaleSlide.findAllByStartDateLessThanEqualsAndFinishDateGreaterThanEqualsAndRemainingCountGreaterThan(new Date(), new Date(), 0)

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

        trackingService.trackProductVisit(product)

        def model = [productTypes: productTypeList, product: product]
        model.price = priceService.calcProductPrice(product?.id)

        def customerReviews = CustomerReview.findAllByProduct product
        model.rate = customerReviews.count { it } == 0 ? 0 : Math.round(customerReviews.sum(0, { it.rate }) / customerReviews.count { it })

        model.commonLink = createLink(uri: '/browse')

        def productTypeChain = []
        def productTypeNavigator = product.productTypes.toArray()[0]
        while (productTypeNavigator) {
            productTypeChain << productTypeNavigator
            productTypeNavigator = productTypeNavigator.parentProduct
        }
        productTypeChain = productTypeChain.reverse()

        model.breadCrumb = []

        productTypeChain.each {
            model.breadCrumb << [name: it.name, href: "${model.commonLink}/${it.urlName}/", id: it.id]
        }

        model.rootProductTypes = ProductType.findAllByParentProductIsNull()

        model.mostVisitedProducts = Product.createCriteria().listDistinct {
            productTypes {
                eq('id', model.breadCrumb.last().id)
            }
            maxResults(20)
            order("visitCount", "desc")
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
        mongoService.storeProduct(product)

        //fill zoomable property of images
        imageService.getImageSize(product.mainImage, product)
        product.mainImage.dynamicProperties.zoomable = product.mainImage.dynamicProperties.width >= 700 || product.mainImage.dynamicProperties.height >= 700
        product?.images?.findAll { it?.id != product?.mainImage?.id }?.each {
            imageService.getImageSize(it, product)
            it.dynamicProperties.zoomable = it.dynamicProperties.width >= 700 || it.dynamicProperties.height >= 700
        }

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

        def modelNames = [product.name]
        product.models.each { if (!modelNames.contains(it.name)) modelNames << it.name }
        def title = product.toString().replace(product.name, modelNames.join(','))
        model.title = title
        model.description = message(code: 'site.product.page.description', args: [title])

        model
    }

    def productCard() {
        def product = Product.get(params.productId)

        def models = ProductModel.findAllByProduct(product)
        def productModel
        models.each {
            def model = it
            Boolean selected = true
            product.variations.each { variation ->
                def modelVariationId = model.variationValues.find { it.variationGroup.id == variation.variationGroup.id }?.id?.toLong()
                def selectedVariationId = params."variation${variation.id}" ? params."variation${variation.id}" == '' ? null : params."variation${variation.id}".toLong() : null
                if (modelVariationId != selectedVariationId)
                    selected = false
            }

            if (model.guarantee.id.toLong() != params.guarantee.toLong())
                selected = false

            if (selected)
                productModel = model
        }

        render(template: 'product/card', model: [product: product, productModel: productModel])
    }

    def productImage() {
        def product = Product.get(params.id)

        render(template: "productImages", model: [product: product, selectedImage: params.img ? product.images.find { it.id.toString() == params.img.toString() } : product.mainImage])
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

    def search() {


        def model = [:]
        def productIdList = []
        if (params.phrase)
            productIdList = searchableService.search(params.phrase, [reload: false, max: 1000])

        model.filters = browseService.findSearchPageFilters(productIdList.results.collect { it.id }, params.f, params.page ?: 0)
        model.commonLink = createLink(uri: '/')

        model.rootProductTypes = ProductType.findAllByParentProductIsNull()
        model.slides = Slide.findAll()

        def brandList = new ArrayList<Brand>()
        def brand
        if (model.filters["selecteds"]["b"])
            brandList.addAll(Brand.createCriteria().list {
                'in'('id', model.filters["selecteds"]["b"])
            })
        brand = brandList.collect { it.name }.join(', ')
        if (!brand)
            brand = ''

        def productType = ProductType.get(params.f?.split(',').reverse()?.find { it.startsWith('p') }?.replace('p', '')?.toLong())
        model.productTypeTypeLinks = []
        if (productType && productType.children.isEmpty() && !params.f?.split(',')?.find { it.startsWith('t') }) {
            productType.types.each {
                model.productTypeTypeLinks << [name: it.title, href: createLink(action: "search", params: params + [f: "${params.f},t${it.id}"]), id: it.id]
            }
        }

        trackingService.trackSearch(productType, brandList, params.phrase)

        def pageDetails
        if (productType && brand != '')
            pageDetails = PageDetails.findByProductType(productType)
        if (pageDetails)
            model.title = pageDetails?.title?.replace('$BRAND$', brand)
        else {
            model.title = (productType ? productType.toString() + " - " : "") + params.phrase
            if (brand && brand != '')
                model.title = (model.title ? model.title + " - " : "") + brand + params.phrase
        }
        model.description = pageDetails?.description?.replace('$BRAND$', brand)
        model.keywords = pageDetails?.keywords?.replace('$BRAND$', brand)

        model.productTypeId = productType?.id
        model.productTypeName = productType?.name

        render(view: 'search', model: model)
    }

    def getAllChildProductTypes(ProductType productType) {

        def result = [productType]

        productType.children.each {
            result += getAllChildProductTypes(it)
        }

        result
    }

    def contactUs() {
        render view: '/site/statics/contact_us'
    }

    def termsAndConditions() {
        render view: '/site/statics/rights_and_laws'
    }

    def sendMail() {

        if (!simpleCaptchaService.validateCaptcha(params.captcha)) {

            flash.message = message(code: 'contactUs.email.invalidCaptcha')
            redirect(uri: '/contactUs')
            return
        }

        mailService.sendMail {
            to params.department
            subject "${message(code: 'contactUs.email.subject')}"
            html(view: "/messageTemplates/mail/contactUs",
                    model: [
                            firstName: params.firstName,
                            lastName: params.lastName,
                            email: params.email,
                            phone: params.phone,
                            body: params.body
                    ])
        }

        flash.message = message(code: 'contactUs.email.successMessage')
        redirect(uri: '/contactUs')
    }

    def article() {
        def model = [:]

        model.article = JournalArticle.get(params.id)

        model.productType = model.article.baseProduct as ProductType
        model.articles = JournalArticle.findAllByBaseProduct model.productType

        model.commonLink = createLink(uri: '/browse')

        def productTypeChain = []
        def productTypeNavigator = model.productType
        while (productTypeNavigator) {
            productTypeChain << productTypeNavigator
            productTypeNavigator = productTypeNavigator.parentProduct
        }
        productTypeChain = productTypeChain.reverse()

        model.breadCrumb = []

        productTypeChain.each {
            model.breadCrumb << [name: it.name, href: "${model.commonLink}/${it.urlName}/"]
        }

        model.subProductTypeLinks = []
        def base = "${model.commonLink}/"

        model.productType.children.findAll { !it.deleted }.each {
            model.subProductTypeLinks << [name: it.name, href: base + it.urlName, id: it.id]
        }

        model
    }
}
