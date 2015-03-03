<g:if test="${productTypeName && productTypeName?.size() > 0}">
    <g:if test="${brand && brand?.size() > 0}">
        <g:message code="pageTitle.productTypeAndBrand" args="${[productTypeName, brand]}"/>
    </g:if>
    <g:else>
        <g:message code="pageTitle.productTypeOnly" args="${[productTypeName]}"/>
    </g:else>
</g:if>
<g:else>
    <g:message code="pageTitle.brandOnly" args="${[brand]}"/>
</g:else>