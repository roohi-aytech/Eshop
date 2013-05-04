package eshop

import rapidgrails.TaglibHelper

class EshopTagLib {
    static namespace = "eshop"

    def renderProductAttributes = { attrs, body ->
        Product product = attrs.product
        request.setAttribute("product", product)
        HashSet definedProductTypes = new HashSet()
        request.setAttribute("definedProductTypes", definedProductTypes)
        product.productTypes?.sort { it.name }?.each {
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

        def attributeTypes = AttributeType.findAllByProductTypeAndCategoryIsNull(productType)
        attributeTypes?.sort { it.sortIndex }?.each {
            request.setAttribute("attribute", it)
            out << renderAttribute()
            request.removeAttribute("attribute")
        }

        def categories = AttributeCategory.findAllByProductTypeAndParentCategoryIsNull(productType)
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

        out << "<fieldset class='form'>"
        out << "<legend>${attributeCategory?.name}</legend>"

        def attributeTypes = AttributeType.findAllByCategory(attributeCategory)
        attributeTypes?.sort { it.sortIndex }?.each {
            request.setAttribute("attribute", it)
            out << renderAttribute()
            request.removeAttribute("attribute")
        }

        def attributeCategories = AttributeCategory.findAllByParentCategory(attributeCategory)
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
        def link = g.createLink(controller: "site", action: "filter", params: [f: f])
        out << "<a href='${link}'>${attrs.value}</a>"
    }

    def filterStartBrand = { attrs, body ->
        def f = attrs.productType?.id ? "p${attrs.productType.id},b${attrs.brandId}" : "b${attrs.brandId}"
        def link = g.createLink(controller: "site", action: "filter", params: [f: f])
        def brand = Brand.get(attrs.brandId)
        if (attrs.type == 'icon')
            out << "<a class='brand-filter' href='${link}'><img alt='${attrs.brandName}' src='${createLink(controller: 'image', params: [id: attrs.brandId, type: 'brand'])}'/><span class='tick'></span><span class='tick-grey'></span></a>"
        else
            out << "<a href='${link}'><span>${attrs.brandName}</span></a>"
    }

    def filterAddProductType = { attrs, body ->
        def f = "${attrs.f},p${attrs.id}"
        def link = g.createLink(controller: "site", action: "filter", params: [f: f])
        out << "<a href='${link}'>${attrs.name}</a>"
    }

    def filterAddBrand = { attrs, body ->
        def remove = TaglibHelper.getBooleanAttribute(attrs, "remove", false)
        def f
        if (remove) {
            def fItems = attrs.f.split(',')//.replace(",b${attrs.id}", "").replace("b${attrs.id},", "").replace("b${attrs.id}", "")
            fItems = fItems.findAll { it != "b${attrs.id}" }
//            fItems.each{
//                if(it.replace('b', '') == attrs.id.toString())
//                    it = ''
//            }
            f = fItems.join(',')//.replace(',,', ',')
        } else
            f = "${attrs.f},b${attrs.id}"
        def link = (f == '' ? g.createLink(controller: 'site') : g.createLink(controller: "site", action: "filter", params: [f: f]))
        if (attrs.type == 'icon')
            out << "<a class='brand-filter' href='${link}'><img alt='${attrs.name}' src='${createLink(controller: 'image', params: [id: attrs.id, type: 'brand'])}'/><span class='tick'></span><span class='tick-grey'></span></a>"
        else
            out << "<a href='${link}'>${attrs.name}</span></a>"
    }

    def filterAddAttribute = { attrs, body ->
        def remove = TaglibHelper.getBooleanAttribute(attrs, "remove", false)
        def f
        if (remove) {
            f = attrs.f.replace(",${attrs.id}|${attrs.value},", ",")
            f = f.replaceFirst(/,/ + attrs.id + /\|/ + attrs.value + /$/, "")
        } else
            f = "${attrs.f},${attrs.id}|${attrs.value}"
        def link = g.createLink(controller: "site", action: "filter", params: [f: f])
        out << "<a href='${link}'>${attrs.value}</a>"
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
        def product = Product.get attrs.prodcutId
        def defaultPrice = Price.findAllByProductAndDefaultPrice product, true
        if (defaultPrice)
            out << """
                <a class="btn btn-primary btn-buy addToBasket" defaultPriceId="${defaultPrice.id}" ng-click="addToBasket(${attrs.prodcutId}, '${attrs.productTitle}', '${attrs.productPrice}', \$(this).attr('defaultPriceId')"><span>${g.message(code: "add-to-basket")}</span></a>
                """
        else
            out << g.message(code: 'product.price.notExists')
    }

    def addToWishList = { attrs, body ->
        out << """
        <a class="btn btn-wish" ng-click="addToWishList(${attrs.prodcutId}, '${attrs.productTitle}', '${attrs.productPrice}')"><span>${g.message(code: "add-to-wishList")}</span></a>
        """
    }

    def addToCompareList = { attrs, body ->
        out << """
        <a class="btn btn-compare" ng-click="addToCompareList(${attrs.prodcutId}, '${attrs.productTitle}', '${attrs.productPrice}')"><span>${g.message(code: "add-to-compareList")}</span></a>
        """
    }

    def basketItem = { attrs, body ->
        out << "${attrs.id} ${attrs.name} ${attrs.count} salam farzin :D"
    }
}
