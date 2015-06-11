package eshop

import eshop.goldaan.SpecialProducts
import groovy.xml.MarkupBuilder
import org.codehaus.groovy.grails.web.util.WebUtils
import org.springframework.web.servlet.LocaleResolver
import org.springframework.web.servlet.support.RequestContextUtils
import rapidgrails.TaglibHelper

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class EshopTagLib {
    static namespace = "eshop"

    def priceService
    def browseService
    def messageSource

    def renderProductAttributes = { attrs, body ->
        Product product = attrs.product
        request.setAttribute("product", product)
        HashSet definedProductTypes = new HashSet()
        request.setAttribute("definedProductTypes", definedProductTypes)
        product.productTypes?.findAll { !it.deleted }?.sort { it.name }?.each {
            request.setAttribute("productType", it)
            out << renderProductTypeAttributes()
            request.removeAttribute("productType")
        }
        request.removeAttribute("product")
    }

    def renderProductTypeAttributes = { attrs, body ->
        ProductType productType = request.getAttribute("productType") ?: attrs.productType

        if (request.getAttribute("definedProductTypes").contains(productType))
            return
        request.getAttribute("definedProductTypes").add(productType)

        //out << "${productType.name}"
        out << "<fieldset class='form'>"
        out << "<legend>${productType.name}</legend>"

        def attributeTypes = AttributeType.findAllByProductTypeAndCategoryIsNullAndDeleted(productType, false)
        attributeTypes?.sort { it.sortIndex }?.each {
            request.setAttribute("attribute", it)
            out << renderAttribute()
            request.removeAttribute("attribute")
        }

        def categories = AttributeCategory.findAllByProductTypeAndParentCategoryIsNullAndDeleted(productType, false)
        categories?.sort { it.sortIndex }.each {
            request.setAttribute("attributeCategory", it)
            out << renderAttributeCategory()
            request.removeAttribute("attributeCategory")
        }
        out << "</legend>"
        out << "</fieldset>"

        if (productType.parentProduct) {
            request.setAttribute("productType", productType.parentProduct)
            out << renderProductTypeAttributes()
            request.removeAttribute("productType")
        }
    }
    def renderAttributeCategory = { attrs, body ->
        AttributeCategory attributeCategory = request.getAttribute("attributeCategory") ?: attrs.attributeCategory
        if (attributeCategory.deleted)
            return

        out << "<fieldset class='form'>"
        out << "<legend>${attributeCategory?.name}</legend>"

        def attributeTypes = AttributeType.findAllByCategoryAndDeleted(attributeCategory, false)
        attributeTypes?.sort { it.sortIndex }?.each {
            request.setAttribute("attribute", it)
            out << renderAttribute()
            request.removeAttribute("attribute")
        }

        def attributeCategories = AttributeCategory.findAllByParentCategoryAndDeleted(attributeCategory, false)
        attributeCategories.sort { it.name }.each {
            request.setAttribute("attributeCategory", it)
            out << renderAttributeCategory()
            request.removeAttribute("attributeCategory")
        }

        out << "</legend>"
        out << "</fieldset>"

    }
    def renderAttribute = { attrs, body ->
        AttributeType attributeType = request.getAttribute("attribute")
        Product product = request.getAttribute("product")
        def attribute = product.attributes.find { it.attributeType.id == attributeType.id }
        def attributeValue = attribute?.value
        if (!attributeValue && attributeType.defaultValue)
            attributeValue = attributeType.defaultValue
        out << render(template: "attr", model: [attributeType: attributeType, product: product, attribute: attribute, attributeValue: attributeValue]);
    }

    def filterStart = { attrs, body ->
        def f = "p${attrs.productType.id},${attrs.attribute}|${attrs.value}"
        def link = g.createLink(controller: 'site', action: "filter", params: [f: f, o: attrs.attribute])
        out << "<a href='${link}' data-ajax='${grailsApplication.config.ajaxFilter}'>${attrs.value} ${attrs.showCount ? "<span class='count'>(${attrs.count})</span>" : ''}</a>"
    }

    def filterStartMobile = { attrs, body ->
        def f = "p${attrs.productType.id},${attrs.attribute}|${attrs.value}"
        def link = g.createLink(controller: 'site', action: "filter", params: [f: f, o: attrs.attribute])
        def id = UUID.randomUUID().toString()
        out << """
            <input type="checkbox" id="chk-${id}" class="customCheckbox filterCheckbox" value="${
            attrs.value
        }" data-url="${link}">
            <label for="chk-${id}"><span></span>${attrs.value} <span class='count'>(${attrs.count})</span></label>
"""
    }

    def filterStartBrand = { attrs, body ->
        def f = attrs.productType?.id ? "p${attrs.productType.id},b${attrs.brandId}" : "b${attrs.brandId}"
        def link = g.createLink(controller: 'site', action: "filter", params: [f: f, o: 'b'])
        def brand = Brand.get(attrs.brandId)
        if (attrs.type == 'icon')
            out << "<a class='brand-filter' href='${link}' data-ajax='${grailsApplication.config.ajaxFilter}'><img class='lazy ${attrs.class}' data-src='${createLink(controller: 'image', params: [id: attrs.brandId, type: 'brand'])}'/><span class='tick'></span><span class='tick-grey'></span><span class='hovertip'>${attrs.brandName}</span></a>"
        else
            out << "<a href='${link}' data-ajax='${grailsApplication.config.ajaxFilter}'>${attrs.brandName} ${attrs.showCount ? "<span class='count'>(${attrs.count})</span>" : ''}</a>"
    }

    def filterStartBrandMobile = { attrs, body ->
        def f = attrs.productType?.id ? "p${attrs.productType.id},b${attrs.brandId}" : "b${attrs.brandId}"
        def link = g.createLink(controller: 'site', action: "filter", params: [f: f, o: 'b'])
        out << """
            <input type="checkbox" id="chk-brandsname-${attrs.brandId}" class="customCheckbox filterCheckbox" value="${
            attrs.brandName
        }"
                data-url="${link}">
            <label for="chk-brandsname-${attrs.brandId}"><span></span>${attrs.brandName} <span class='count'>(${
            attrs.count
        })</span></label>

"""
    }

    def filterStartVariation = { attrs, body ->
        def f = "p${attrs.productType.id},v${attrs.variation}|${attrs.value}"
        def link = g.createLink(controller: 'site', action: "filter", params: [f: f, o: 'v' + attrs.variation])
        out << "<a href='${link}' data-ajax='${grailsApplication.config.ajaxFilter}'>${attrs.value} ${attrs.showCount ? "<span class='count'>(${attrs.count})</span>" : ''}</a>"
    }

    def filterStartVariationMobile = { attrs, body ->
        def f = "p${attrs.productType.id},v${attrs.variation}|${attrs.value}"
        def link = g.createLink(controller: 'site', action: "filter", params: [f: f, o: 'v' + attrs.variation])

        def id = UUID.randomUUID().toString()
        out << """
            <input type="checkbox" id="chk-${id}" class="customCheckbox" value="${attrs.value}" data-url="${link}"/>
            <label for="chk-${id}"><span></span>${attrs.value} <span class='count'>(${attrs.count})</span></label>
"""

        out << "<a href='${link}' data-ajax='${grailsApplication.config.ajaxFilter}'>${attrs.value} ${attrs.showCount ? "<span class='count'>(${attrs.count})</span>" : ''}</a>"
    }

    def filterAddProductType = { attrs, body ->
        def f = "${attrs.f},p${attrs.id}"
        def link = g.createLink(controller: 'site', action: params.action, params: params + [f: f])
        out << "<a href='${link}'>${attrs.name} ${attrs.showCount ? "<span class='count'>(${attrs.count})</span>" : ''}</a>"
    }

    def filterAddBrand = { attrs, body ->
        def remove = TaglibHelper.getBooleanAttribute(attrs, "remove", false)
        def f
        if (remove) {
            def fItems = attrs.f.split(',')
            fItems = fItems.findAll { it != "b${attrs.id}" }
            f = fItems.join(',')
        } else
            f = "${attrs.f},b${attrs.id}"
        def link = (f == '' ? g.createLink(uri: '/') : g.createLink(action: params.action, params: params + [f: f, o: 'b']))
        if (attrs.type == 'icon')
            out << "<a class='brand-filter' href='${link}' data-ajax='${grailsApplication.config.ajaxFilter}'><img alt='${attrs.name}' class='${attrs.class}' src='${createLink(controller: 'image', params: [id: attrs.id, type: 'brand'])}'/><span class='tick'></span><span class='tick-grey'></span><span class='hovertip'>${attrs.name}</span></a>"
        else
            out << "<a href='${link}' data-ajax='${grailsApplication.config.ajaxFilter}'>${attrs.name} ${attrs.showCount ? "<span class='count'>(${attrs.count})</span)" : ''}</span></a>"
    }

    def filterAddBrandMobile = { attrs, body ->
        def remove = TaglibHelper.getBooleanAttribute(attrs, "remove", false)
        def f
        if (remove) {
            def fItems = attrs.f.split(',')
            fItems = fItems.findAll { it != "b${attrs.id}" }
            f = fItems.join(',')
        } else
            f = "${attrs.f},b${attrs.id}"
        def link = (f == '' ? g.createLink(uri: '/') : g.createLink(action: params.action, params: params + [f: f, o: 'b']))

        out << """
            <input type="checkbox" id="chk-brandsname-${attrs.id}" class="customCheckbox filterCheckbox" value="${
            attrs.name
        }"
                data-url="${link}" ${remove ? 'checked="checked"' : ''}>
            <label for="chk-brandsname-${attrs.id}"><span></span>${attrs.name} <span class='count'>(${attrs.count})</span></label>

"""
    }

    def filterAddVariation = { attrs, body ->
        def remove = TaglibHelper.getBooleanAttribute(attrs, "remove", false)
        def f
        if (remove) {
            f = attrs.f.replace(",v${attrs.id}|${attrs.value}", "")
            f = f.replaceFirst(/,/ + attrs.id + /\|/ + attrs.value + /$/, "")
        } else
            f = "${attrs.f},${attrs.id}|${attrs.value}"
        def link = g.createLink(action: params.action, params: params + [f: f, o: attrs.id])
        out << "<a href='${link}' data-ajax='${grailsApplication.config.ajaxFilter}'>${attrs.value} ${attrs.showCount ? "<span class='count'>(${attrs.count})</span>" : ''}</a>"
    }

    def filterAddVariationMobile = { attrs, body ->
        def remove = TaglibHelper.getBooleanAttribute(attrs, "remove", false)
        def f
        if (remove) {
            f = attrs.f.replace(",v${attrs.id}|${attrs.value}", "")
            f = f.replaceFirst(/,/ + attrs.id + /\|/ + attrs.value + /$/, "")
        } else
            f = "${attrs.f},${attrs.id}|${attrs.value}"
        def link = g.createLink(action: params.action, params: params + [f: f, o: attrs.id])

        out << """
            <input type="checkbox" id="chk-brandsname-${attrs.id}" class="customCheckbox filterCheckbox" value="${
            attrs.value
        }"
                data-url="${link}" ${remove ? 'checked="checked"' : ''}>
            <label for="chk-brandsname-${attrs.id}"><span></span>${attrs.name} <span class='count'>(${attrs.count})</span></label>
"""

    }

    def filterAddAttribute = { attrs, body ->
        def remove = TaglibHelper.getBooleanAttribute(attrs, "remove", false)
        def f
        if (remove) {
            f = attrs.f.replace(",${attrs.id}|${attrs.value},", ",")
            f = f.replaceFirst(/,/ + attrs.id + /\|/ + attrs.value + /$/, "")
        } else
            f = "${attrs.f},${attrs.id}|${attrs.value}"
        def link = g.createLink(action: params.action, params: params + [f: f, o: attrs.id])
        out << "<a href='${link}' data-ajax='${grailsApplication.config.ajaxFilter}'>${attrs.value} ${attrs.showCount ? "<span class='count'>(${attrs.count})</span>" : ''}</a>"
    }

    def filterAddAttributeMobile = { attrs, body ->
        def remove = TaglibHelper.getBooleanAttribute(attrs, "remove", false)
        def f
        if (remove) {
            f = attrs.f.replace(",${attrs.id}|${attrs.value},", ",")
            f = f.replaceFirst(/,/ + attrs.id + /\|/ + attrs.value + /$/, "")
        } else
            f = "${attrs.f},${attrs.id}|${attrs.value}"
        def link = g.createLink(action: params.action, params: params + [f: f, o: attrs.id])

        out << """
            <input type="checkbox" id="chk-brandsname-${attrs.id}" class="customCheckbox filterCheckbox" value="${
            attrs.value
        }"
                data-url="${link}" ${remove ? 'checked="checked"' : ''}>
            <label for="chk-brandsname-${attrs.id}"><span></span>${attrs.value} <span class='count'>(${attrs.count})</span></label>
"""
    }

    def filter = { attrs, body ->
        def pageContext = [:] + attrs.pageContext
        def add = attrs.add
        add.each { key, value ->
            if (pageContext.containsKey(key)) {
                pageContext[key] << value
                pageContext[key].flatten()
            } else {
                pageContext[key] = [value].flatten()
            }
        }
        def queryParams = []
        pageContext.each { key, value ->
            queryParams << "${key}=${value.join("|")}"
        }
        def queryString = queryParams.join(",")

        def link = g.createLink(controller: "site", action: "filter", params: [ct: queryString])
        out << "<a href='${link}'>"
        out << body()
        out << "</a>"
    }

    def addToBasket = { attrs, body ->
        def product
        def defaultModel

        if (attrs.prodcutModelId) {
            defaultModel = ProductModel.get(attrs.prodcutModelId)
            product = defaultModel.product
        } else {
            product = Product.get(attrs.prodcutId)
            defaultModel = ProductModel.findByProductAndIsDefaultModel(product, true)
            if (defaultModel?.prices?.count { it } == 0)
                defaultModel = ProductModel.findAllByProduct(product).find { it?.prices?.count { it } > 0 }
        }

        if (!defaultModel || defaultModel.status != 'exists') {
            defaultModel = ProductModel.findByProductAndStatus(product, 'exists')
        }

        if (defaultModel) {
            if (defaultModel.status == 'exists') {
                def price = priceService.calcProductModelPrice(defaultModel.id)?.showVal?.toInteger()
                if (price) {
                    if (attrs.image)
                        out << """
                            <a href="javascript://" type="basket" original-title="${
                            message(code: attrs.useLongText ? "add-to-basket.long" : "add-to-basket")
                        }" class="has-tipsy ${attrs.class}" ${
                            attrs.angular == "false" ? "on" : "ng-"
                        }click="addToBasket(${
                            defaultModel.id
                        }, '${defaultModel.toBasketItemString().encodeAsHTML()}', '${price}', [], 1, '', ${
                            attrs.prodcutId
                        }, '${attrs.animate}');"><img src='${resource(dir: 'images/menu', file: 'basket_new.png')}' /></a>
                            """
                    else
                        out << """
                            <a href="javascript://" class="btn-buy addToBasket ${attrs.class}" ${
                            attrs.angular == "false" ? "on" : "ng-"
                        }click="addToBasket(${defaultModel.id}, '${
                            defaultModel.toBasketItemString().encodeAsHTML()
                        }', '${price}', [], 1, '', ${attrs.prodcutId}, '${attrs.animate}');"><span>${
                            g.message(code: attrs.useLongText ? "add-to-basket.long" : "add-to-basket")
                        }</span></a>
                            """
                } else if (!attrs.buttonOnly) {
                    out << (attrs.image ? '' : g.message(code: 'product.price.inquiryRequired'))
                }
            } else if (!attrs.buttonOnly && defaultModel.status == 'not-exists') {
                out << (attrs.image ? '' : g.message(code: 'product.price.notExists'))
            } else if (!attrs.buttonOnly && defaultModel.status == 'inquiry-required') {
                out << (attrs.image ? '' : g.message(code: 'product.price.inquiryRequired'))
            } else if (!attrs.buttonOnly && defaultModel.status == 'coming-soon') {
                out << (attrs.image ? '' : g.message(code: 'product.price.comingSoon'))
            }
        } else
            out << (attrs.image ? '' : attrs.buttonOnly ? '' : g.message(code: 'product.price.inquiryRequired'))
    }

    def addToWishList = { attrs, body ->
        def product = Product.get attrs.prodcutId
        def defaultModel = ProductModel.findByProductAndIsDefaultModel(product, true)
        if (defaultModel?.prices?.count { it } == 0)
            defaultModel = ProductModel.findAllByProduct(product).find { it?.prices?.count { it } > 0 }
        def price = defaultModel ? priceService.calcProductModelPrice(defaultModel.id)?.showVal?.toInteger() : ''

        if (attrs.image)
            out << """
            <a type="wish" original-title="${
                message(code: attrs.useLongText ? "add-to-wishList.long" : "add-to-wishList")
            }" class="has-tipsy" ng-click="addToWishList(${attrs.prodcutId}, '${product.toString()}', '${
                price
            }')"><img src='${resource(dir: 'images/menu', file: 'favorites_new.png')}' /></a>
            """
        else
            out << """
                <a class="btn-wish" ng-click="addToWishList(${attrs.prodcutId}, '${product.toString()}', '${
                price
            }')"><span>${g.message(code: attrs.useLongText ? "add-to-wishList.long" : "add-to-wishList")}</span></a>
                """
    }

    def specifications = { attrs, body ->
        def url = "${createLink(uri: '/product/' + attrs.prodcutId)}"
        if (attrs.productModelId) {
            def productModel = ProductModel.get(attrs.productModelId)
            url = "${createLink(uri: '/product/' + productModel?.product?.id)}?model=${productModel?.id}"
        }
        out << """
                <a class="btn-spec" href="${url}" ><span>${
            g.message(code: "specifications")
        }</span></a>
                """
    }

    def addToCompareList = { attrs, body ->
        try {
            def product = Product.get attrs.prodcutId
            def defaultModel = ProductModel.findByProductAndIsDefaultModel(product, true)
            if (defaultModel?.prices?.count { it } == 0)
                defaultModel = ProductModel.findAllByProduct(product).find { it?.prices?.count { it } > 0 }
            def price = defaultModel ? priceService.calcProductModelPrice(defaultModel.id)?.showVal?.toInteger() : ''

            if (attrs.image)
                out << """
                <a type="compare" original-title="${
                    message(code: attrs.useLongText ? "add-to-compareList.long" : "add-to-compareList")
                }" class="has-tipsy" ng-click="addToCompareList(${attrs.prodcutId}, '${product.toString()}', '${
                    price
                }')"><img src='${resource(dir: 'images/menu', file: 'compare_new.png')}' /></a>
                """
            else
                out << """
                <a class="btn-compare" ng-click="addToCompareList(${attrs.prodcutId}, '${product.toString()}', '${
                    price
                }')"><span>${g.message(code: attrs.useLongText ? "add-to-compareList.long" : "add-to-compareList")}</span></a>
                """
        }catch (x){}
    }

    def basketItem = { attrs, body ->
        out << "${attrs.id} ${attrs.name} ${attrs.count} salam farzin :D"
    }

    def productTypeTopBrands = { attrs, body ->
        def brandList = browseService.brandList(attrs.productTypeId as Long)
        out << "<ul>"
        def counter = 0
        brandList.each { brand ->
            if (counter++ < (attrs.max as Integer))
                out << """
        <li><a href="${createLink(uri: '/filter?f=p' + attrs.productTypeId + ',b' + brand._id.id)}">${brand._id.name}</a>
                                            </li>
"""
        }
        out << "</ul>"
    }

    def productTypeMinPrice = { attrs, body ->
        out << formatNumber(number: browseService.minPrice(attrs.productTypeId as Long), type: 'number')
    }

    def selectedProductsList = { attrs, body ->
        def productType = ProductType.get(attrs.productTypeId.toLong())
        ProductType.findAllByParentProductAndDeleted(productType, false).each {
            if (session.mobile)
                out << selectedProductsForMobile(productTypeId: it.id)
            else
                out << selectedProducts(productTypeId: it.id)
        }
    }

    def selectedProducts = { attrs, body ->
        def productType = ProductType.get(attrs.productTypeId.toLong())
        def products = browseService.findProductTypeSampleProducts(productType, 4)
        if (products && products?.productIds && products?.productIds?.size() > 0) {
            out << """<div class="category_heading">
                    <h2>${productType}</h2>
                    <div class="right_text">
                        <a href="${createLink(uri: "/browse/${productType.seoFriendlyName}")}">${
                message(code: 'category.view.all', args: [productType.name])
            } &gt;</a>
                    </div>
                  </div>"""
            out << """<div class="row">"""
            def counter = 0
            products.productIds.each {
                def productModel = ProductModel.get(it.modelId)
                if (productModel) {
                    counter++
                    out << render(template: "/site/${grailsApplication.config.eShop.instance}/templates/productThumbnail", model: [product: productModel?.product, productModel: productModel, class: counter == 4 ? 'last' : ''])
                }
            }
            out << "</div>"
        }
    }

    def selectedProductsForMobile = { attrs, body ->
        def productType = ProductType.get(attrs.productTypeId.toLong())
        def products = browseService.findProductTypeSampleProducts(productType, 3)
        if (products && products?.productIds && products?.productIds?.size() > 0) {
            out << """
                <div class="selected_items_wrapper clearfix">
                    <div class="p_heading m_bottom15">
                        <h2><span class="red">${message(code: 'select')}</span> ${productType}</h2>
                        <a class="p_seemore" href="${createLink(uri: "/browse/${productType.seoFriendlyName}")}">
                            ${message(code: 'category.view.all', args: [productType.name])}
                        </a>
                        <div class="clearfix"></div>
                    </div>
                    <div class="items_list_wrapper">
                    <ul>
"""
            def counter = 0
            products.productIds.each {
                def productModel = ProductModel.get(it.modelId)
                if (productModel) {
                    counter++
                    out << """
                        <li>
                            <a href="${
                        createLink(uri: "/product/${productModel?.product?.id}?model=${productModel?.id}")
                    }">
                                <img alt="" src="${
                        grailsApplication.config.eShop.instance == 'goldaan' ? resource(dir: '/images/goldaan', file: 'loadinfo.net.gif') : resource(dir: '/images/felfel', file: 'loading1.gif')
                    }" data-src="${
                        createLink(controller: 'image', params: [id: productModel?.id, wh: '300x300', type: 'productModel'])
                    }" class="lazy" style="display: inline-block;" id="lazy-${productModel?.id}"/>
                                <h2 class="p_product_name">${productModel}</h2>
                                <span class="p_product_cost">"""
                    out << thumbnailPrice(productModelId: productModel.id, hideLastUpdate: true)
                    out <<
                            """</span>
                            </a>
                        </li>
"""
                }
            }
            out << """
                    </ul>
                </div>
            </div>
            """
        }
    }

    def mostSoldProductTypes = { attrs, body ->
        def productTypes = OrderItem.createCriteria().list({
            eq('deleted', false)
            projections {
                count('id', 'orderCount')
                productModel {
                    product {
                        productTypes {
                            groupProperty('id')
                        }
                    }
                }
            }
            order('orderCount', 'desc')
        }, max: 12)

        if (!productTypes || productTypes.size() == 0)
            productTypes = ProductType.createCriteria().list({
                projections {
                    property('id')
                }
            }, max: 12)

        out << render(template: '/site/common/productTypeRowList', model: [productTypes: productTypes, rowSize: 3, itemTitle: message(code: 'bestSelelrs.title')])
    }

    def mostVisitedProductTypes = { attrs, body ->
        def productTypes = Product.createCriteria().list({
            or {
                isNull('deleted')
                eq('deleted', false)
            }
            projections {
                sum('visitCount', 'visitCount')
                productTypes {
                    groupProperty('id')
                }
            }
            order('visitCount', 'desc')
        }, max: 16)

        out << render(template: '/site/common/productTypeRowList', model: [productTypes: productTypes, rowSize: 4, itemTitle: message(code: 'mostVisiteds.title')])
    }

    def mostVisitedProductTypeList = { attrs, body ->
        Integer columns = attrs.columns as Integer
        Integer rows = attrs.rows as Integer
        def productTypes = Product.createCriteria().list({
            or {
                isNull('deleted')
                eq('deleted', false)
            }
            projections {
                sum('visitCount', 'visitCount')
                productTypes {
                    groupProperty('id')
                }
            }
            order('visitCount', 'desc')
        }, max: rows * columns)

        columns.times { column ->
            out << "<ul>"
            rows.times { row ->
                def productType = ProductType.get(productTypes[column * rows + row] as Long)
                if (productType)
                    out << """
                <li>
                    <a title="${productType.name}" href="${createLink(uri: "/browse/${productType.seoFriendlyName}")}">
                        ${productType.name}
                    </a>
                </li>
                """
            }
            out << "</ul>"
        }
    }

    def topBrands = { attrs, body ->
        def brands = Product.createCriteria().list({
            projections {
                count('id', 'productCount')
                brand {
                    property('id')
                    groupProperty('id')
                }
            }
            order('productCount', 'desc')
        }, max: 11)

        out << render(template: '/site/common/brandList', model: [brands: brands])
    }

    def topBrandsList = { attrs, body ->
        Integer columns = attrs.columns as Integer
        Integer rows = attrs.rows as Integer
        def brands = Product.createCriteria().list({
            projections {
                count('id', 'productCount')
                brand {
                    property('id')
                    groupProperty('id')
                }
            }
            order('productCount', 'desc')
        }, max: rows * columns)

        2.times { column ->
            out << "<ul>"
            14.times { row ->
                def brand = Brand.get(brands[column * rows + row] as Long)
                if (brand)
                    out << """
                <li>
                    ${eshop.filterStartBrand(brandId: brand?.id, brandName: brand?.name)}
                </li>
                """
            }
            out << "</ul>"
        }
    }

    def synchronizeProduct = { attrs, body ->
        def product
        if (attrs.productId)
            product = Product.get(attrs.productId.id)
        if (attrs.modelId)
            product = ProductModel.get(attrs.modelId)?.product
        if (product) {
            product.isSynchronized = false
            def result = product.save() ? true : false
            out << """
            <span style="display: none">
                product id : ${attrs.productId}
                <br/>
                synchronization result: ${result}
            </span>
"""
        }
    }
    def resolveLocale = { attrs, body ->
        def grailsWebRequest = WebUtils.retrieveGrailsWebRequest()
        def request = grailsWebRequest.request
        def response = grailsWebRequest.response
        def localeResolver = RequestContextUtils.getLocaleResolver(request)
        if (localeResolver == null) {
            localeResolver = new LocaleResolver() {
                Locale locale

                Locale resolveLocale(HttpServletRequest req) {
                    return locale
                }

                void setLocale(HttpServletRequest req, HttpServletResponse httpServletRequest, Locale loc) {
                    locale = loc
                }
            }
            request.setAttribute("org.springframework.web.servlet.DispatcherServlet.LOCALE_RESOLVER", localeResolver)
        }
        localeResolver.setLocale(request, response, attrs.locale)
    }
    def randomProduct = { attrs, body ->
        Product.createCriteria().listDistinct {
            models {
                eq('status', 'exists')
            }
            or {
                isNull('isVisible')
                eq('isVisible', true)
                eq('deleted', false)
            }
            maxResults(20)
            sqlRestriction " 1=1 order by rand()"
        }.each {
            g.set(var: 'product', value: it)
            out << body()
        }
    }
    def productTypeLink = { attrs, body ->
        def markup = new MarkupBuilder(out)
        def pt = ProductType.get(attrs.id)
        if (pt) {
            markup.a(href: createLink(controller: 'site', action: 'browse', params: [productType: pt.seoFriendlyName])) {
                mkp.yieldUnescaped(body())
            }
        }
    }
    def glSpecialOfferLink = { attrs, body ->
        def markup = new MarkupBuilder(out)
        def p = eshop.goldaan.SpecialProducts.findAllByType('specialOffer').find().product
        if (!p) {
            def c = Product.countByDeleted(false)
            def c1 = (int) (Math.random() * c)
            p = Product.findAllByDeleted(false, [max: 1, offset: c1]).find()
        }
        if (p) {
            markup.a(href: createLink(controller: 'site', action: 'product', id: p.id)) {
                mkp.yieldUnescaped(body())
            }
        }
    }
    def glFirstPageProducts = { attrs, body ->
        def pt = ProductType.get(attrs.productTypeId)
        def fpps = SpecialProducts.executeQuery("select sp.product from SpecialProducts sp join sp.product.productTypes pts where sp.type=:type and pts=:pt", [type: 'firstPageProducts', pt: pt])
        def ops = []
        if (fpps.size() < 6) {
            ops = OrderItem.executeQuery("select oi.productModel.product from OrderItem  oi join oi.productModel.product.productTypes pts where pts=:pt and oi.order.status=:status and oi.productModel.product not in :ots group by oi.productModel.product order by count(*) desc",
                    [pt: pt, status: 'delivered',ots:fpps?:Product.findAllByDeleted(true,[max:1])], [max: 6 - fpps.size()])
        }
        (fpps + ops).each {
            g.set(var: 'product', value: it)
            out << body()
        }

    }
}
