<g:if test="${category.hasAttribute}">
    <li id="c${category?.item?.id}">
        <span>${category?.item?.name ?: message(code: 'otherAttributes')}</span>
        <ul>
            <g:each in="${category.attributeTypes}" var="attributeType">
                <li ${attributeType?.selected?'checked="true"':''}" id="${attributeType?.item?.id}">
                    <span>${attributeType.item.name}</span>
                </li>
            </g:each>
            <g:each in="${category.childCategories}" var="childCategory">
                <g:render template="attributeTree"
                          model="${[category: childCategory, productType: productType]}"/>
            </g:each>
        </ul>
    </li>
</g:if>