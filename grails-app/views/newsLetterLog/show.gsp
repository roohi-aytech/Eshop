
<%@ page import="eshop.NewsLetterLog" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsLetterLog.label', default: 'NewsLetterLog')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-newsLetterLog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-newsLetterLog" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newsLetterLog">
			
				<g:if test="${newsLetterLogInstance?.sendDate}">
				<li class="fieldcontain">
					<span id="sendDate-label" class="property-label"><g:message code="newsLetterLog.sendDate.label" default="Send Date" /></span>
					
						<span class="property-value" aria-labelledby="sendDate-label"><g:formatDate date="${newsLetterLogInstance?.sendDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsLetterLogInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="newsLetterLog.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${newsLetterLogInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsLetterLogInstance?.errorMessage}">
				<li class="fieldcontain">
					<span id="errorMessage-label" class="property-label"><g:message code="newsLetterLog.errorMessage.label" default="Error Message" /></span>
					
						<span class="property-value" aria-labelledby="errorMessage-label"><g:fieldValue bean="${newsLetterLogInstance}" field="errorMessage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsLetterLogInstance?.stackTrace}">
				<li class="fieldcontain">
					<span id="stackTrace-label" class="property-label"><g:message code="newsLetterLog.stackTrace.label" default="Stack Trace" /></span>
					
						<span class="property-value" aria-labelledby="stackTrace-label"><g:fieldValue bean="${newsLetterLogInstance}" field="stackTrace"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsLetterLogInstance?.customer}">
				<li class="fieldcontain">
					<span id="customer-label" class="property-label"><g:message code="newsLetterLog.customer.label" default="Customer" /></span>
					
						<span class="property-value" aria-labelledby="customer-label"><g:link controller="customer" action="show" id="${newsLetterLogInstance?.customer?.id}">${newsLetterLogInstance?.customer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsLetterLogInstance?.newsLetterInstance}">
				<li class="fieldcontain">
					<span id="newsLetterInstance-label" class="property-label"><g:message code="newsLetterLog.newsLetterInstance.label" default="News Letter Instance" /></span>
					
						<span class="property-value" aria-labelledby="newsLetterInstance-label"><g:link controller="newsLetterInstance" action="show" id="${newsLetterLogInstance?.newsLetterInstance?.id}">${newsLetterLogInstance?.newsLetterInstance?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${newsLetterLogInstance?.id}" />
					<g:link class="edit" action="edit" id="${newsLetterLogInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
