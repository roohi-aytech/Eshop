<%@ page import="eshop.AttributeType; eshop.Attribute" %>
<g:if test="${!indent}">
    <g:set var="indent" value="${0}"/>
</g:if>
<g:if test="${indent == 0}">
    <table class="attribute-list">
</g:if>

<g:each in="${categories?.sort { it.sortIndex }}" var="category">
    <g:if test="${category.attributes.count { (!it.attributeType.deleted && it.attributeType.showPositions.contains('productDetails') || it.attributeType.showPositions.contains('productFullDetails')) && it.value && it.value.toString().compareTo("N/A") != 0 } > 0}">
        <tr>
            <td colspan="2">
                <h4 style="padding-right:${indent * 20 + 7}px">${category.item.name}</h4>
            </td>
        </tr>
        <g:each in="${category.attributes.sort { it.attributeType.sortIndex }}" var="attribute">
            <g:if test="${!attribute.attributeType.deleted && (attribute.attributeType.showPositions.contains('productDetails') || attribute.attributeType.showPositions.contains('productFullDetails')) && attribute.value && attribute.value.toString().compareTo("N/A") != 0}">
                <tr>
                    <td>
                        <div style="padding-right:${indent * 20}px">
                            <b>${attribute.attributeType}</b>
                        </div>
                    </td>
                    <td>
                        ${attribute.value.toString().replace('\n', '<br/>')}
                    </td>
                </tr>
            </g:if>
        </g:each>

        <g:render template="product/attributes" model="${[categories: category.childCategories, indent: indent + 1]}"/>
    </g:if>
</g:each>
<g:if test="${indent == 0}">
    <g:set var="orphanAttributes"
           value="${Attribute.findAllByProductAndAttributeTypeInList(product, AttributeType.findAllByCategoryIsNull())}"></g:set>
    <g:if test="${orphanAttributes.count { !it.attributeType.deleted && (it.attributeType.showPositions.contains('productDetails') || it.attributeType.showPositions.contains('productFullDetails')) && it.value && it.value.toString().compareTo("N/A") != 0 } > 0}">
        <tr>
            <td colspan="2">
                <h4><g:message code="otherAttributes"/></h4>
            </td>
        </tr>
    </g:if>
    <g:each in="${orphanAttributes?.sort { it.attributeType.sortIndex }}" var="attribute">
        <g:if test="${!attribute.attributeType.deleted && (attribute.attributeType.showPositions.contains('productDetails') || attribute.attributeType.showPositions.contains('productFullDetails')) && attribute.value && attribute.value.toString().compareTo("N/A") != 0}">
            <tr>
                <td>
                    <b>${attribute.attributeType}</b>
                </td>
                <td>
                    ${attribute.value.toString().replace('\n', '<br/>')}
                </td>
            </tr>
        </g:if>
    </g:each>
    </table>
</g:if>