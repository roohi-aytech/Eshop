<%@ page import="eshop.ProductType" %>
%{--product types--}%
<g:if test="${filters.productTypes}">
    <g:render template="common/productTypeCarouselNew"
              model="${[type: 'filter', subProductTypeLinks: filters?.productTypes]}"/>
</g:if>
%{--product types--}%
%{--<g:if test="${filters.productTypes}">--}%
%{--<h3 class="productType-container-title">--}%
%{--<g:message code="site.selectSubcategory"--}%
%{--default="Select SubProductType"></g:message>--}%
%{--</h3>--}%
%{--<g:render template="common/productTypeGrid"--}%
%{--model="${[type: 'filter', subProductTypeLinks: filters.productTypes]}"></g:render>--}%
%{--</g:if>--}%
%{--Brands Filters--}%
<div id="graphicalFilter">
    <g:if test="${filters?.brands}">
        <g:render template="common/brandCarouselNew" model="${[
                title         : message(code: 'site.selectBrand'),
                brands        : filters.brands,
                selectedBrands: filters.selecteds["b"],
                type          : 'filter'
        ]}"/>
    </g:if>
    <g:if test="${productType?.types?.size() > 0 && filters?.types && filters?.types?.size() > 1}">
        <g:render template="common/productTypeTypeCarousel" model="${[types: filters.types, menuType: 'filter']}"/>
    </g:if>
</div>