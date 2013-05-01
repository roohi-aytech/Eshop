<%@ page import="eshop.accounting.Transaction" %>

<g:hasErrors bean="${transactionInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${transactionInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${transactionInstance?.id}" />
<g:hiddenField name="version" value="${transactionInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'account', 'error')} required">
	<label for="account">
		<g:message code="transaction.account.label" default="Account" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="account" name="account.id" from="${eshop.accounting.Account.list()}" optionKey="id" required="" value="${transactionInstance?.account?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="transaction.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="value" min="0" required="" value="${transactionInstance.value}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="transaction.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${transactionInstance.constraints.type.inList}" value="${transactionInstance?.type}" valueMessagePrefix="transaction.type" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'order', 'error')} ">
	<label for="order">
		<g:message code="transaction.order.label" default="Order" />
		
	</label>
	<g:select id="order" name="order.id" from="${eshop.Order.list()}" optionKey="id" value="${transactionInstance?.order?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="transaction.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${eshop.User.list()}" optionKey="id" required="" value="${transactionInstance?.creator?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="transaction.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${transactionInstance?.date}"  />
</div>

