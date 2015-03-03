
<%@ page import="eshop.delivery.DeliveryMethod" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'deliveryMethod.label', default: 'DeliveryMethod')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-deliveryMethod" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-deliveryMethod" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list deliveryMethod">
			
				<g:if test="${deliveryMethodInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="deliveryMethod.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${deliveryMethodInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryMethodInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="deliveryMethod.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${deliveryMethodInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryMethodInstance?.sourceStations}">
				<li class="fieldcontain">
					<span id="sourceStations-label" class="property-label"><g:message code="deliveryMethod.sourceStations.label" default="Source Stations" /></span>
					
						<g:each in="${deliveryMethodInstance.sourceStations}" var="s">
						<span class="property-value" aria-labelledby="sourceStations-label"><g:link controller="deliverySourceStation" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryMethodInstance?.logo}">
				<li class="fieldcontain">
					<span id="logo-label" class="property-label"><g:message code="deliveryMethod.logo.label" default="Logo" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryMethodInstance?.deleted}">
				<li class="fieldcontain">
					<span id="deleted-label" class="property-label"><g:message code="deliveryMethod.deleted.label" default="Deleted" /></span>
					
						<span class="property-value" aria-labelledby="deleted-label"><g:formatBoolean boolean="${deliveryMethodInstance?.deleted}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${deliveryMethodInstance?.id}" />
					<g:link class="edit" action="edit" id="${deliveryMethodInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
