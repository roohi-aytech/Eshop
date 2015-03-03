
<%@ page import="eshop.NewsLetterInstance" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsLetterInstance.label', default: 'NewsLetterInstance')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-newsLetterInstance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-newsLetterInstance" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newsLetterInstance">
			
				<g:if test="${newsLetterInstanceInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="newsLetterInstance.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${newsLetterInstanceInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsLetterInstanceInstance?.finishDate}">
				<li class="fieldcontain">
					<span id="finishDate-label" class="property-label"><g:message code="newsLetterInstance.finishDate.label" default="Finish Date" /></span>
					
						<span class="property-value" aria-labelledby="finishDate-label"><g:formatDate date="${newsLetterInstanceInstance?.finishDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsLetterInstanceInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="newsLetterInstance.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${newsLetterInstanceInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsLetterInstanceInstance?.logs}">
				<li class="fieldcontain">
					<span id="logs-label" class="property-label"><g:message code="newsLetterInstance.logs.label" default="Logs" /></span>
					
						<g:each in="${newsLetterInstanceInstance.logs}" var="l">
						<span class="property-value" aria-labelledby="logs-label"><g:link controller="newsLetterLog" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${newsLetterInstanceInstance?.id}" />
					<g:link class="edit" action="edit" id="${newsLetterInstanceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
