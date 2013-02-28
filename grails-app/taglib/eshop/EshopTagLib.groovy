package eshop

import rapidgrails.TaglibHelper

class EshopTagLib {
    static namespace = "eshop"

    def renderProductAttributes = {attrs, body ->
        Product product = attrs.product
        request.setAttribute("product", product)
        HashSet definedProductTypes=new HashSet()
        request.setAttribute("definedProductTypes",definedProductTypes)
        product.productTypes?.sort {it.name}?.each {
            request.setAttribute("productType", it)
            out << renderProductTypeAttributes()
            request.removeAttribute("productType")
        }
        request.removeAttribute("product")
    }

    def renderProductTypeAttributes = {attrs, body ->
        ProductType productType = request.getAttribute("productType") ?: attrs.productType

        if(request.getAttribute("definedProductTypes").contains(productType))
            return
        request.getAttribute("definedProductTypes").add(productType)

        //out << "${productType.name}"
        out << "<fieldset class='form'>"
        out << "<legend>${productType.name}</legend>"

        def attributeTypes = AttributeType.findAllByProductTypeAndCategoryIsNull(productType)
        attributeTypes?.sort {it.sortIndex}?.each {
            request.setAttribute("attribute", it)
            out << renderAttribute()
            request.removeAttribute("attribute")
        }

        def categories = AttributeCategory.findAllByProductTypeAndParentCategoryIsNull(productType)
        categories?.sort {it.sortIndex}.each {
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
    def renderAttributeCategory = {attrs, body ->
        AttributeCategory attributeCategory = request.getAttribute("attributeCategory") ?: attrs.attributeCategory

        out << "<fieldset class='form'>"
        out << "<legend>${attributeCategory?.name}</legend>"

        def attributeTypes = AttributeType.findAllByCategory(attributeCategory)
        attributeTypes?.sort {it.sortIndex}?.each {
            request.setAttribute("attribute", it)
            out << renderAttribute()
            request.removeAttribute("attribute")
        }

        def attributeCategories = AttributeCategory.findAllByParentCategory(attributeCategory)
        attributeCategories.sort {it.name}.each {
            request.setAttribute("attributeCategory", it)
            out << renderAttributeCategory()
            request.removeAttribute("attributeCategory")
        }

        out << "</legend>"
        out << "</fieldset>"

    }
    def renderAttribute = {attrs, body ->
        AttributeType attributeType = request.getAttribute("attribute")
        Product product = request.getAttribute("product")
        def attribute = product.attributes.find { it.attributeType.id == attributeType.id }
        def attributeValue = attribute?.value
        if (!attributeValue && attributeType.defaultValue)
            attributeValue = attributeType.defaultValue
        out << render(template: "attr", model: [attributeType: attributeType, product: product, attribute: attribute, attributeValue: attributeValue]);
    }

    def filterStart = {attrs, body ->
        def f = "p${attrs.productType.id},${attrs.attribute}|${attrs.value}"
        def link = g.createLink(controller: "site", action: "filter", params: [f : f])
        out << "<a href='${link}'>${attrs.value}</a>"
    }

    def filterStartBrand = {attrs, body ->
        def f = "p${attrs.productType.id},b${attrs.brandId}"
        def link = g.createLink(controller: "site", action: "filter", params: [f : f])
        out << "<a href='${link}'>${attrs.brandName}</a>"
    }

    def filterAddProductType = {attrs, body ->
        def f = "${attrs.f},p${attrs.id}"
        def link = g.createLink(controller: "site", action: "filter", params: [f : f])
        out << "<a href='${link}'>${attrs.name}</a>"
    }

    def filterAddBrand = {attrs, body ->
        def remove = TaglibHelper.getBooleanAttribute(attrs, "remove", false)
        def f
        if (remove)
            f = attrs.f.replace(",b${attrs.id}", "")
        else
            f = "${attrs.f},b${attrs.id}"
        def link = g.createLink(controller: "site", action: "filter", params: [f : f])
        out << "<a href='${link}'>${attrs.name}</a>"
    }

    def filterAddAttribute = {attrs, body ->
        def remove = TaglibHelper.getBooleanAttribute(attrs, "remove", false)
        def f
        if (remove) {
            f = attrs.f.replace(",${attrs.id}|${attrs.value},", ",")
            f = f.replaceFirst(/,/ + attrs.id + /\|/ + attrs.value + /$/, "")
        } else
            f = "${attrs.f},${attrs.id}|${attrs.value}"
        def link = g.createLink(controller: "site", action: "filter", params: [f : f])
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
}
