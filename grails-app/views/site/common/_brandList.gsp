<div class="clearfix"></div>
<h3 class="category_heading">
    <g:message code="topBrands.title"/>
</h3>
<ul class="brand-list">
<g:each in="${brands}" var="brand">
    <li class="sb-showcase-skin checkable ${(selectedBrands?.contains(brand._id?.id) ? 'active' : '')}">
        <g:if test="${type == 'filter'}">
            <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}" f="${params.f}"
                                  remove="${(selectedBrands?.contains(brand._id?.id)).toString()}"
                                  type="icon"/>

        </g:if>
        <g:else>
            <eshop:filterStartBrand productType="${productType}" brandId="${brand._id?.id}"
                                    brandName="${brand._id?.name}"
                                    type="icon"/>
        </g:else>
    </li>
</g:each>
</ul>