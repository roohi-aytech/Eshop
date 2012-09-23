package eshop

class EshopTagLib {
    static namespace = "eshop"

    def renderProductAttributes = {attrs, body ->
        Product product = attrs.product
        request.setAttribute("product", product)
        product.productTypes.each {
            request.setAttribute("productType", it)
            out << renderProductTypeAttributes()
            request.removeAttribute("productType")
        }
        request.removeAttribute("product")
    }

    def renderProductTypeAttributes = {attrs, body ->
        ProductType productType = request.getAttribute("productType") ?: attrs.productType

        //out << "${productType.name}"
        out << "<fieldset class='form'>"
        out << "<legend>${productType.name}</legend>"

        productType.attributeTypes.each {
            request.setAttribute("attribute", it)
            out << renderAttribute()
            request.removeAttribute("attribute")
        }
        out << "</legend>"
        out << "</fieldset>"

        if (productType.parentProduct)
        {
            request.setAttribute("productType", productType.parentProduct)
            out << renderProductTypeAttributes()
            request.removeAttribute("productType")
        }
    }

    def renderAttribute = {attrs, body->
        AttributeType attributeType = request.getAttribute("attribute")
        Product product = request.getAttribute("product")
        def attribute = product.attributes.find { it.attributeType.id == attributeType.id }

        out << "<div class='fieldcontain'>"
        out << "<label for='at_${attributeType.id}'>"
        out << attributeType.name
        out << "</label>"
        def attributeValue = attribute?.attributeValue
        if (!attributeValue && attributeType.defaultValue)
            attributeValue = attributeType.defaultValue
        if (attributeType.values)
            out << g.select(name: "at_${attributeType.id}", value: attributeValue, from: attributeType.values)
        else
            out << g.textField(name: "at_${attributeType.id}", value: attributeValue)

        out << "</div>"
    }
}
