<g:if test="${productType.children}">
    <g:render template="common/productTypeCarouselNew"/>
</g:if>
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