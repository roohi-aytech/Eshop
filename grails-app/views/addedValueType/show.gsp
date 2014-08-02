
<%@ page import="eshop.AddedValueType" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'addedValueType.label', default: 'AddedValueType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-addedValueType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-addedValueType" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list addedValueType">
			
				<g:if test="${addedValueTypeInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="addedValueType.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${addedValueTypeInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addedValueTypeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="addedValueType.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${addedValueTypeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addedValueTypeInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="addedValueType.image.label" default="Image" /></span>
					
						<span class="property-value" aria-labelledby="image-label"><g:link controller="content" action="show" id="${addedValueTypeInstance?.image?.id}">${addedValueTypeInstance?.image?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${addedValueTypeInstance?.needDescription}">
				<li class="fieldcontain">
					<span id="needDescription-label" class="property-label"><g:message code="addedValueType.needDescription.label" default="Need Description" /></span>
					
						<span class="property-value" aria-labelledby="needDescription-label"><g:formatBoolean boolean="${addedValueTypeInstance?.needDescription}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${addedValueTypeInstance?.addedValues}">
				<li class="fieldcontain">
					<span id="addedValues-label" class="property-label"><g:message code="addedValueType.addedValues.label" default="Added Values" /></span>
					
						<g:each in="${addedValueTypeInstance.addedValues}" var="a">
						<span class="property-value" aria-labelledby="addedValues-label"><g:link controller="addedValue" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${addedValueTypeInstance?.id}" />
					<g:link class="edit" action="edit" id="${addedValueTypeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
