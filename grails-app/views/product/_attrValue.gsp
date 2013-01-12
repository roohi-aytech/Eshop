<g:hiddenField name="attributeTypeId" value="${attributeTypeId}"/>
<g:hiddenField name="id" value="${attributeValue?.id}"/>
<div class="fieldcontain" style="">
    <label for="value" class="valueslabel">
        <g:message code="attributeType.values.label" default="Values"/>
    </label>
    <g:if test="${attributeType == "Text"}">
        <g:textArea cols="40" rows="5" name="value" value="${attributeValue?.value}"/>
    </g:if>
    <g:else>
        <g:textField name="value" value="${attributeValue?.value}"/>
    </g:else>
</div>