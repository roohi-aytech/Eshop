
<g:hiddenField name="id" value="${producerStaffInstance?.id}"/>
<g:hiddenField name="producer.id" value="${producerStaffInstance?.producer?.id}"/>

<div class="fieldcontain ${hasErrors(bean: producerStaffInstance, field: 'value', 'error')} ">
    <label for="value">
        <g:message code="producer.name.label" default="Value" />
    </label>
    <g:textField name="value" value="${producerStaffInstance?.value}"/>
</div>

