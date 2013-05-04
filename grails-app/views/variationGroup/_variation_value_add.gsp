<g:hiddenField name="id" value="${variationValueInstance?.id}"/>
<g:hiddenField name="variationGroup.id" value="${variationValueInstance?.variationGroup?.id}"/>
<g:hasErrors bean="${variationValueInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${variationValueInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>
<div class="fieldcontain ${hasErrors(bean: variationValueInstance, field: 'value', 'error')} ">
    <label for="value">
        <g:message code="variationValue.value.label" default="Name" />
    </label>
    <g:textField name="value" value="${variationValueInstance?.value}"/>
</div>