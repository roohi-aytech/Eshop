<%@ page import="eshop.NewsLetterLog" %>

<g:hasErrors bean="${newsLetterLogInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${newsLetterLogInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${newsLetterLogInstance?.id}" />
<g:hiddenField name="version" value="${newsLetterLogInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: newsLetterLogInstance, field: 'sendDate', 'error')} ">
	<label for="sendDate">
		<g:message code="newsLetterLog.sendDate.label" default="Send Date" />
		
	</label>
	<g:datePicker name="sendDate" precision="day"  value="${newsLetterLogInstance?.sendDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: newsLetterLogInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="newsLetterLog.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${newsLetterLogInstance.constraints.status.inList}" value="${newsLetterLogInstance?.status}" valueMessagePrefix="newsLetterLog.status" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newsLetterLogInstance, field: 'errorMessage', 'error')} ">
	<label for="errorMessage">
		<g:message code="newsLetterLog.errorMessage.label" default="Error Message" />
		
	</label>
	<g:textField name="errorMessage" value="${newsLetterLogInstance?.errorMessage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newsLetterLogInstance, field: 'stackTrace', 'error')} ">
	<label for="stackTrace">
		<g:message code="newsLetterLog.stackTrace.label" default="Stack Trace" />
		
	</label>
	<g:textField name="stackTrace" value="${newsLetterLogInstance?.stackTrace}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newsLetterLogInstance, field: 'customer', 'error')} required">
	<label for="customer">
		<g:message code="newsLetterLog.customer.label" default="Customer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="customer" name="customer.id" from="${eshop.Customer.list()}" optionKey="id" required="" value="${newsLetterLogInstance?.customer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newsLetterLogInstance, field: 'newsLetterInstance', 'error')} required">
	<label for="newsLetterInstance">
		<g:message code="newsLetterLog.newsLetterInstance.label" default="News Letter Instance" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="newsLetterInstance" name="newsLetterInstance.id" from="${eshop.NewsLetterInstance.list()}" optionKey="id" required="" value="${newsLetterLogInstance?.newsLetterInstance?.id}" class="many-to-one"/>
</div>

