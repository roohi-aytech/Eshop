<%@ page import="eshop.AttributeType; eshop.Attribute" %>
<g:if test="${categories}">
    <g:if test="${!indent}">
        <g:set var="indent" value="${0}"/>
    </g:if>
    <g:if test="${indent == 0}">
        <div class="acnt-btn no-arrow">
            <a href="javascript:void(0)">
    </g:if>

    <g:each in="${categories?.sort { it.sortIndex }}" var="category">
        <g:if test="${category.hasAttribute && !category.item.deleted}">
            <h3>${category.item.name}</h3>
            <ul>
                <g:each in="${category.attributes.sort { it.attributeType.sortIndex }}" var="attribute">
                    <g:if test="${!attribute.attributeType.deleted && (attribute.attributeType.showPositions.contains('productDetails') || attribute.attributeType.showPositions.contains('productFullDetails')) && attribute.value && attribute.value.toString().compareTo("N/A") != 0}">
                        <li>
                            <p>
                                ${attribute.attributeType}: ${attribute.value.toString().replace('\n', '<br/>')}
                            </p>
                        </li>
                    </g:if>
                </g:each>
            </ul>

            <g:render template="/mobile/common/product/specifications"
                      model="${[categories: category.childCategories, indent: indent + 1]}"/>
        </g:if>
    </g:each>
    <g:if test="${indent == 0}">
        <g:set var="orphanAttributes"
               value="${Attribute.findAllByProductAndAttributeTypeInList(product, AttributeType.findAllByCategoryIsNull())}"/>
        <g:if test="${orphanAttributes.count {
            !it.attributeType.deleted && (it.attributeType.showPositions.contains('productDetails') || it.attributeType.showPositions.contains('productFullDetails')) && it.value && it.value.toString().compareTo("N/A") != 0
        } > 0}">
            <h3><g:message code="otherAttributes"/></h3>
        </g:if>
        <ul>
            <g:each in="${orphanAttributes?.sort { it.attributeType.sortIndex }}" var="attribute">
                <g:if test="${!attribute.attributeType.deleted && (attribute.attributeType.showPositions.contains('productDetails') || attribute.attributeType.showPositions.contains('productFullDetails')) && attribute.value && attribute.value.toString().compareTo("N/A") != 0}">
                    <li>
                        <p>
                            ${attribute.attributeType}: ${attribute.value.toString().replace('\n', '<br/>')}
                        </p>
                    </li>
                </g:if>
            </g:each>
        </ul>
    </g:if>

    <g:if test="${indent == 0}">
        </a>
        </div>
    </g:if>
</g:if>