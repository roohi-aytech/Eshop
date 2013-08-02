<%@ page import="eshop.accounting.Account" %>

<g:hasErrors bean="${accountInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${accountInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${accountInstance?.id}" />
<g:hiddenField name="version" value="${accountInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'bankName', 'error')} ">
	<label for="bankName">
		<g:message code="account.bankName.label" default="Bank Name" />
		
	</label>
    <g:select name="bankName" value="${accountInstance?.bankName}"
              valueMessagePrefix="account.bankName" from="${accountInstance.constraints.bankName.inList}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'type', 'error')} ">
    <label for="type">
        <g:message code="account.type.label" />

    </label>
    <g:select name="type" value="${accountInstance?.type}"
              valueMessagePrefix="account.type" from="${accountInstance.constraints.type.inList}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'branchName', 'error')} ">
	<label for="branchName">
		<g:message code="account.branchName.label" default="Branch Name" />
		
	</label>
	<g:textField name="branchName" value="${accountInstance?.branchName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'ownerName', 'error')} ">
	<label for="ownerName">
		<g:message code="account.ownerName.label" default="Owner Name" />
		
	</label>
	<g:textField name="ownerName" value="${accountInstance?.ownerName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'accountNumber', 'error')} ">
	<label for="accountNumber">
		<g:message code="account.accountNumber.label" default="Account Number" />
		
	</label>
	<g:textField name="accountNumber" value="${accountInstance?.accountNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'shebaNumber', 'error')} ">
	<label for="shebaNumber">
		<g:message code="account.shebaNumber.label" default="Sheba Number" />
		
	</label>
	<g:textField name="shebaNumber" value="${accountInstance?.shebaNumber}" style="direction:ltr;width:180px"/>
    <script type="text/javascript" language="javascript">
        $('#shebaNumber').maskInput('IR99-9999-9999-9999-9999-9999-99');
    </script>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'cardNumber', 'error')} ">
	<label for="cardNumber">
		<g:message code="account.cardNumber.label" default="Card Number" />
		
	</label>
	<g:textField name="cardNumber" value="${accountInstance?.cardNumber}" style="direction:ltr;width:110px"/>
    <script type="text/javascript" language="javascript">
        $('#cardNumber').maskInput('9999 9999 9999 9999');
    </script>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'bankLogo', 'error')} ">
	<label for="bankLogo">
		<g:message code="account.bankLogo.label" default="Bank Logo" />
		
	</label>
	<input type="file" id="bankLogo" name="bankLogo" />
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'hasOnlinePayment', 'error')} ">
    <label for="hasOnlinePayment">
        <g:message code="account.hasOnlinePayment.label" default="Has Online Payment" />

    </label>
    <g:checkBox name="hasOnlinePayment" value="${accountInstance?.hasOnlinePayment}" />
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'onlinePaymentConfiguration', 'error')} ">
    <label for="onlinePaymentConfiguration">
        <g:message code="account.onlinePaymentConfiguration.label" />

    </label>
    <g:textArea rows="10" cols="100" name="onlinePaymentConfiguration" style="direction: ltr" value="${accountInstance?.onlinePaymentConfiguration}" />
</div>

