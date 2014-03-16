<g:if test="${productModel}">
    <% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
    <g:set var="price" value="${priceService.calcProductModelPrice(productModel.id)}"/>
    <g:if test="${price.showVal}">

        <span class="price">
            <g:if test="${price.showVal}">
                <g:if test="${price.lastUpdate}">
                    <div class="price-last-update">
                        <g:message code="price.lastUpdate"/>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <rg:formatJalaliDate
                                date="${price.lastUpdate}"/>
                    </div>
                </g:if>
                <span class='current'><g:formatNumber
                        number="${price.showVal}" type="number"/> <g:message code="rial"/></span>

                <a id="priceHistogram" class="priceHistogram"
                   onclick="showPriceHistogram(${productModel.id});">
                    <g:message code="productModel.priceHistogram"/>
                </a>

                <div class="flag-container">
                    <g:message code="productModel.status"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <g:render template="common/productModelStatusFlag"
                                                                       model="${[status: price.status]}"/>
                </div>
            </g:if>
        </span>

    </g:if>
</g:if>
<g:else>

    <div class="flag-container">
        <g:message code="productModel.status"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <g:render template="common/productModelStatusFlag"
                                                                                        model="${[status: 'not-exists']}"/>
    </div>
</g:else>