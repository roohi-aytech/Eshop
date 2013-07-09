<g:if test="${category.hasAttribute && category.selected}">
    <tr>
        %{--<td class="removeThisRow category_${productType.item.id}_${category?.item?.id ?: 0}"--}%
            %{--categoryId="${productType.item.id}_${category?.item?.id ?: 0}"></td>--}%
        <td colspan="${productType.products.toList().count { it } + 1}">
            <h4 style="padding-right:${indent * 20 + 7}px">${category?.item?.name ?: message(code: 'otherAttributes')}</h4>
        </td>
    </tr>
    <g:each in="${category.attributeTypes.findAll{it.selected}}" var="attributeType">
        <tr class="category_${productType.item.id}_${category?.item?.id ?: 0}">
            %{--<td class="removeThisRow"></td>--}%
            <td class="attributeName">
                <div style="padding-right:${indent * 20}px">
                    <b>${attributeType.item.name}</b>
                </div>
            </td>
            <g:each in="${attributeType.values}" var="attribute">
                <td class="attributeValue" ${attributeType.values.any { it != attributeType.values.first() } ? 'style="font-weight:bold"' : ''}>
                    ${attribute ? attribute.replace('\n', '<br/>') : '-'}
                </td>
            </g:each>
        </tr>
    </g:each>
    <g:each in="${category.childCategories}" var="childCategory">
        <g:render template="attributeList"
                  model="${[indent: indent + 1, category: childCategory, productType: productType]}"/>
    </g:each>
</g:if>