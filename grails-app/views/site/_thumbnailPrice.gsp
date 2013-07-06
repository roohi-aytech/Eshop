<span class="price">
%{--<g:if test="${mainVal}">--}%
%{--<span class="old"><g:formatNumber number="${mainVal}" type="number"/></span>--}%
%{--</g:if>--}%
    <g:if test="${showVal}">
        <span class='current'
            %{--${lastUpdate?" price-last-update' original-title='${rg.formatJalaliDate(date:lastUpdate)}'":"'"}--}%
        ><g:formatNumber number="${showVal}" type="number"/> <g:message code="rial"/></span>
        <g:if test="${lastUpdate}">
        <span class="price-last-update" original-title="${message(code:'price.lastUpdate')}">
            <rg:formatJalaliDate date="${lastUpdate}"></rg:formatJalaliDate>
        </span>
        </g:if>
    </g:if>
    <g:else>
        <g:message code="product.price.inquiryRequired"/>
    </g:else>
</span>
