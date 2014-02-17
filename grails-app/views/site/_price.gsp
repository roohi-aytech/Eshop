

<span class="price">
    <g:if test="${showVal}">
        <span class='current'><g:formatNumber
                number="${showVal}" type="number"/> <g:message code="rial"/></span>
        <g:if test="${lastUpdate}">
            <span class="price-last-update" original-title="${message(code:'price.lastUpdate')}">
                <rg:formatJalaliDate date="${lastUpdate}"/>
            </span>
        </g:if>
        <a id="priceHistogram" class="priceHistogram"
        %{--href="#priceHistogram"--}%
           onclick="showPriceHistogram(${productModel.id});">
            <g:message code="productModel.priceHistogram"/>
        </a>
        <g:render template="common/productModelStatusFlag" model="${[status : status]}"/>
    </g:if>
</span>

