%{--product types--}%
<g:if test="${productType.children}">
    <g:render template="common/productTypeCarousel"/>
</g:if>
%{--Brands Filters--}%
<div id="graphicalFilter">
    <g:if test="${filters?.brands}">
        <g:render template="common/brandCarousel" model="${[
                title      : message(code: 'site.selectBrand'),
                productType: productType,
                brands     : filters.brands
        ]}"/>
    </g:if>
    %{--attributes--}%
    <g:if test="${productType?.types?.size() > 0 && filters?.types && filters?.types?.size() > 1}">
        <g:render template="common/productTypeTypeCarousel" model="${[types: filters.types]}"/>
    </g:if>
</div>