<%@ page import="eshop.Currency" %>

<g:hasErrors bean="${currencyInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${currencyInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${currencyInstance?.id}" />
<g:hiddenField name="version" value="${currencyInstance?.version}" />

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="currency.name.label" default="Name" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${currencyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'exchangeRate', 'error')} required">
	<label for="exchangeRate">
		<g:message code="currency.exchangeRate.label" default="Exchange Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="exchangeRate" step="any" required="" value="${currencyInstance.exchangeRate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'display', 'error')}">
    <label for="exchangeRate">
        <g:message code="currency.display.label" default="Display" />
    </label>
    <g:checkBox name="display" value="${currencyInstance.display}"/>
</div>

