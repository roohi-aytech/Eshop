<span class="price">
    <g:if test="${status == 'exists'}">
        <g:if test="${showVal}">
            <span class='current'
            %{--${lastUpdate?" price-last-update' original-title='${rg.formatJalaliDate(date:lastUpdate)}'":"'"}--}%><g:formatNumber
                    number="${showVal}" type="number"/> <g:message code="rial"/></span>
            <g:if test="${lastUpdate}">
                <span class="price-last-update" original-title="${message(code: 'price.lastUpdate')}">
                    <rg:formatJalaliDate date="${lastUpdate}"></rg:formatJalaliDate>
                </span>
            </g:if>
        </g:if>
    </g:if>
    <g:else>
        <span class="${status}-label"><g:message code="productModel.status.${status}"/>
    </g:else>
</span>
