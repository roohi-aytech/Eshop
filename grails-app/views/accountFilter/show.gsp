
<%@ page import="eshop.accounting.AccountFilter" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'accountFilter.label', default: 'AccountFilter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-accountFilter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-accountFilter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list accountFilter">
			
				<g:if test="${accountFilterInstance?.account}">
				<li class="fieldcontain">
					<span id="account-label" class="property-label"><g:message code="accountFilter.account.label" default="Account" /></span>
					
						<span class="property-value" aria-labelledby="account-label"><g:link controller="account" action="show" id="${accountFilterInstance?.account?.id}">${accountFilterInstance?.account?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountFilterInstance?.brands}">
				<li class="fieldcontain">
					<span id="brands-label" class="property-label"><g:message code="accountFilter.brands.label" default="Brands" /></span>
					
						<g:each in="${accountFilterInstance.brands}" var="b">
						<span class="property-value" aria-labelledby="brands-label"><g:link controller="brand" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${accountFilterInstance?.productType}">
				<li class="fieldcontain">
					<span id="productType-label" class="property-label"><g:message code="accountFilter.productType.label" default="Product Type" /></span>
					
						<span class="property-value" aria-labelledby="productType-label"><g:link controller="productType" action="show" id="${accountFilterInstance?.productType?.id}">${accountFilterInstance?.productType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${accountFilterInstance?.id}" />
					<g:link class="edit" action="edit" id="${accountFilterInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
