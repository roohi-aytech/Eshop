%{--<g:if test="${status == 'exists'}">--}%
    <span class="price">
        <g:if test="${showVal}">
            <span class='current'>
            <g:formatNumber number="${showVal}" type="number"/> <g:message code="rial"/></span>
            <g:if test="${lastUpdate && !hideLastUpdate}">
                <span class="price-last-update" original-title="${message(code: 'price.lastUpdate')}">
                    <rg:formatJalaliDate date="${lastUpdate}"/>
                </span>
            </g:if>
        </g:if>
        <g:elseif test="${grailsApplication.config.showProductStatus}">
            <span class='current'><g:message code="productModel.status.${status}.label"/></span>
        </g:elseif>
    </span>
%{--</g:if>--}%
