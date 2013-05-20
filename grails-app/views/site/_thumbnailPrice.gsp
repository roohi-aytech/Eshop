<span class="price">
%{--<g:if test="${mainVal}">--}%
    %{--<span class="old"><g:formatNumber number="${mainVal}" type="number"/></span>--}%
%{--</g:if>--}%
<g:if test="${showVal}">
    <span class="current"><g:formatNumber number="${showVal}" type="number"/></span>
</g:if>
</span>
