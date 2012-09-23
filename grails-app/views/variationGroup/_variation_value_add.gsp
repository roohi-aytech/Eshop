<g:hiddenField name="id" value="${variationValueInstance?.id}"/>
<g:hiddenField name="variationGroup.id" value="${variationValueInstance?.variationGroup?.id}"/>
<div class="fieldcontain ${hasErrors(bean: variationValueInstance, field: 'value', 'error')} ">
    <label for="value">
        <g:message code="variationValue.value.label" default="Name" />
    </label>
    <g:textField name="value" value="${variationValueInstance?.value}"/>
</div>