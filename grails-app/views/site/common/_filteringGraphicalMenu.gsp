%{--product types--}%
<g:if test="${filters.productTypes}">
    <h3 class="productType-container-title">
        <g:message code="site.selectSubcategory"
                   default="Select SubProductType"></g:message>
    </h3>
    <g:render template="common/productTypeGrid"
              model="${[type: 'filter', subProductTypeLinks: filters.productTypes]}"></g:render>
</g:if>
%{--Brands Filters--}%
<g:if test="${filters?.brands}">
    <g:render template="common/brandCarousel" model="${[
            title: message(code: 'site.selectBrand'),
            brands: filters.brands,
            selectedBrands: filters.selecteds["b"],
            type: 'filter'
    ]}"></g:render>
</g:if>
%{--attributes--}%
<g:if test="${!productTypeTypeLinks.isEmpty()}">
    <h3 class="productType-container-title">
        <g:message code="site.selectProductTypeType"></g:message>
    </h3>
    <g:render template="common/productTypeTypeGrid"></g:render>
</g:if>