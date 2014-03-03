%{--<g:if test="${status == 'exists'}">--}%
    <span class="price">
        <g:if test="${showVal}">
            <span class='current'>
            <g:formatNumber number="${showVal}" type="number"/> <g:message code="rial"/></span>
            <g:if test="${lastUpdate}">
                <span class="price-last-update" original-title="${message(code: 'price.lastUpdate')}">
                    <rg:formatJalaliDate date="${lastUpdate}"/>
                </span>
            </g:if>
        </g:if>
    </span>
%{--</g:if>--}%
