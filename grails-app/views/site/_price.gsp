<span class="price">
    %{--<g:if test="${mainVal}">--}%
        %{--<span class="old"><g:formatNumber number="${mainVal}" type="number"/></span>--}%
    %{--</g:if>--}%
    <g:if test="${showVal}">
        <span class='current ${lastUpdate? "price-last-update' original-title='${rg.formatJalaliDate(date:lastUpdate)}'":"'"}><g:formatNumber number="${showVal}" type="number"/></span>
    </g:if>
</span>
