<div class="pull-right added-value-form-added-values">
    <g:each in="${addedValues}">
        <a href="#" onclick="selectAddedValue(${it?.id})">
            <div id="addedValue${it.id}" class="thumbnail mediaholder small added-value-content">
                <img src="<g:createLink controller="image" params="[type:'addedValue']" id="${it?.id}"/>" alt="">
                <div class="title">
                    ${it.name}
                </div>
                <div>
                    <g:formatNumber number="${it.value}" type="number"/>
                </div>
            </div>
        </a>
    </g:each>

</div>
<div class="pull-left added-value-form-added-actions">
    <g:form id="addedValueSelect" controller="site" action="addedValueSelectSubmit">
        <g:hiddenField name="addedValueId"/>
        <g:hiddenField name="basketItemId" value="${basketItemId}"/>

        <g:if test="${addedValueType.needDescription}">
            <div>
                <textarea name="description" placeholder="<g:message code="description" />"></textarea>
            </div>
        </g:if>
    </g:form>
</div>