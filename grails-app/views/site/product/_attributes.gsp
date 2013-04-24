<g:if test="${!indent}">
    <g:set var="indent" value="${0}"/>
</g:if>
<g:if test="${indent == 0}">
    <table class="attribute-list">
</g:if>
<g:each in="${categories}" var="category">
    <tr>
        <td colspan="2">
            <h4>${category.item.name}</h4>
        </td>
    </tr>
    <g:each in="${category.attributes}" var="attribute">
        <g:if test="${attribute.value.toString().compareTo("N/A") != 0}">
            <tr>
                <td>
                    <b>${attribute.attributeType}</b>
                </td>
                <td>
                    ${attribute.value}
                </td>
            </tr>
        </g:if>
    </g:each>

    <g:render template="product/attributes" model="${[categories: category.categories, indent: indent + 1]}"/>
</g:each>
<g:if test="${indent == 0}">
    </table>
</g:if>