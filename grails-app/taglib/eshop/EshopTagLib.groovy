package eshop

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
        attributeTypes?.sort {it.name}?.each {
            request.setAttribute("attribute", it)
            out << renderAttribute()
            request.removeAttribute("attribute")
        }

        def categories = AttributeCategory.findAllByProductTypeAndParentCategoryIsNull(productType)
        categories?.sort {it.name}.each {
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
        attributeTypes?.sort {it.name}?.each {
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
        def attributeValue = attribute?.attributeValue
        if (!attributeValue && attributeType.defaultValue)
            attributeValue = attributeType.defaultValue
        attributeValue=attributeValue?.replace("\r","").replace("\n","\\n")
        out << render(template: "attr", model: [attributeType: attributeType, product: product, attribute: attribute, attributeValue: attributeValue]);
    }
}
