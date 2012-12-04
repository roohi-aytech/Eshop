<g:hiddenField name="attributeTypeId" value="${attributeTypeId}"/>
<div class="fieldcontain" style="">
    <label for="values" class="valueslabel">
        <g:message code="attributeType.values.label" default="Values"/>
    </label>
    <g:if test="${attributeType == "Text"}">
        <g:textArea cols="10" rows="5" name="values" value="${value}"/>
    </g:if>
    <g:else>
        <g:textField name="values" value="${value}"/>
    </g:else>
    <g:hiddenField name="oldValues" value="${value}"/>
</div>