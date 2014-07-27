<div>
    <g:each in="${addedValues}">
        <div class="thumbnail mediaholder small">
            <img src="<g:createLink controller="image" params="[type:'addedValue']" id="${it?.id}"/>" alt="">
            <div class="title">
                ${it.name}
            </div>
        </div>
    </g:each>

</div>
<g:if test="${addedValueType.needDescription}">
    <div>
        <textarea name="description" placeholder="<g:message code="description" />"></textarea>
    </div>
</g:if>