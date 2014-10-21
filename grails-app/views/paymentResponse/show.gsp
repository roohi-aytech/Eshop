
<%@ page import="eshop.accounting.PaymentResponse" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'paymentResponse.label', default: 'PaymentResponse')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-paymentResponse" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-paymentResponse" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list paymentResponse">
			
				<g:if test="${paymentResponseInstance?.approved}">
				<li class="fieldcontain">
					<span id="approved-label" class="property-label"><g:message code="paymentResponse.approved.label" default="Approved" /></span>
					
						<span class="property-value" aria-labelledby="approved-label"><g:formatBoolean boolean="${paymentResponseInstance?.approved}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentResponseInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="paymentResponse.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${paymentResponseInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentResponseInstance?.creationDate}">
				<li class="fieldcontain">
					<span id="creationDate-label" class="property-label"><g:message code="paymentResponse.creationDate.label" default="Creation Date" /></span>
					
						<span class="property-value" aria-labelledby="creationDate-label"><g:formatDate date="${paymentResponseInstance?.creationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentResponseInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="paymentResponse.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${paymentResponseInstance?.owner?.id}">${paymentResponseInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentResponseInstance?.indx}">
				<li class="fieldcontain">
					<span id="indx-label" class="property-label"><g:message code="paymentResponse.indx.label" default="Indx" /></span>
					
						<span class="property-value" aria-labelledby="indx-label"><g:fieldValue bean="${paymentResponseInstance}" field="indx"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentResponseInstance?.request}">
				<li class="fieldcontain">
					<span id="request-label" class="property-label"><g:message code="paymentResponse.request.label" default="Request" /></span>
					
						<span class="property-value" aria-labelledby="request-label"><g:link controller="paymentRequest" action="show" id="${paymentResponseInstance?.request?.id}">${paymentResponseInstance?.request?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${paymentResponseInstance?.id}" />
					<g:link class="edit" action="edit" id="${paymentResponseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
