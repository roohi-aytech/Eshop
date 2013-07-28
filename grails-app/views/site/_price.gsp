

<span class="price">
%{--<g:if test="${mainVal}">--}%
%{--<span class="old"><g:formatNumber number="${mainVal}" type="number"/></span>--}%
%{--</g:if>--}%
    <g:if test="${showVal}">
        <span class='current'><g:formatNumber
                number="${showVal}" type="number"/> <g:message code="rial"/></span>
        <g:if test="${lastUpdate}">
            <span class="price-last-update" original-title="${message(code:'price.lastUpdate')}">
                <rg:formatJalaliDate date="${lastUpdate}"></rg:formatJalaliDate>
            </span>
        </g:if>
        <a id="priceHistogram" class="priceHistogram"
        %{--href="#priceHistogram"--}%
           onclick="showPriceHistogram(${productModel.id});">
            <g:message code="productModel.priceHistogram"/>
        </a>
    </g:if>
</span>

