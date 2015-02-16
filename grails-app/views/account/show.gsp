
<%@ page import="eshop.accounting.Account" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-account" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-account" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list account">
			
				<g:if test="${accountInstance?.bankName}">
				<li class="fieldcontain">
					<span id="bankName-label" class="property-label"><g:message code="account.bankName.label" default="Bank Name" /></span>
					
						<span class="property-value" aria-labelledby="bankName-label"><g:fieldValue bean="${accountInstance}" field="bankName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountInstance?.branchName}">
				<li class="fieldcontain">
					<span id="branchName-label" class="property-label"><g:message code="account.branchName.label" default="Branch Name" /></span>
					
						<span class="property-value" aria-labelledby="branchName-label"><g:fieldValue bean="${accountInstance}" field="branchName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountInstance?.ownerName}">
				<li class="fieldcontain">
					<span id="ownerName-label" class="property-label"><g:message code="account.ownerName.label" default="Owner Name" /></span>
					
						<span class="property-value" aria-labelledby="ownerName-label"><g:fieldValue bean="${accountInstance}" field="ownerName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountInstance?.accountNumber}">
				<li class="fieldcontain">
					<span id="accountNumber-label" class="property-label"><g:message code="account.accountNumber.label" default="Account Number" /></span>
					
						<span class="property-value" aria-labelledby="accountNumber-label"><g:fieldValue bean="${accountInstance}" field="accountNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountInstance?.shebaNumber}">
				<li class="fieldcontain">
					<span id="shebaNumber-label" class="property-label"><g:message code="account.shebaNumber.label" default="Sheba Number" /></span>
					
						<span class="property-value" aria-labelledby="shebaNumber-label"><g:fieldValue bean="${accountInstance}" field="shebaNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountInstance?.cardNumber}">
				<li class="fieldcontain">
					<span id="cardNumber-label" class="property-label"><g:message code="account.cardNumber.label" default="Card Number" /></span>
					
						<span class="property-value" aria-labelledby="cardNumber-label"><g:fieldValue bean="${accountInstance}" field="cardNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountInstance?.hasOnlinePayment}">
				<li class="fieldcontain">
					<span id="hasOnlinePayment-label" class="property-label"><g:message code="account.hasOnlinePayment.label" default="Has Online Payment" /></span>
					
						<span class="property-value" aria-labelledby="hasOnlinePayment-label"><g:formatBoolean boolean="${accountInstance?.hasOnlinePayment}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountInstance?.bankLogo}">
				<li class="fieldcontain">
					<span id="bankLogo-label" class="property-label"><g:message code="account.bankLogo.label" default="Bank Logo" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${accountInstance?.id}" />
					<g:link class="edit" action="edit" id="${accountInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
