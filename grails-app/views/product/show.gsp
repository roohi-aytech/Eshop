
<%@ page import="eshop.Product" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
        <h2><g:message code="default.show.label" args="[entityName]" /></h2>

		<div id="show-product" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product">
			
				<g:if test="${productInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="product.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="product.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.productTypes}">
				<li class="fieldcontain">
					<span id="productTypes-label" class="property-label"><g:message code="product.productTypes.label" default="Product Types" /></span>
					
						<g:each in="${productInstance.productTypes}" var="p">
						<span class="property-value" aria-labelledby="productTypes-label"><g:link controller="productType" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.attributes}">
				<li class="fieldcontain">
					<span id="attributes-label" class="property-label"><g:message code="product.attributes.label" default="Attributes" /></span>
					
						<g:each in="${productInstance.attributes}" var="a">
						<span class="property-value" aria-labelledby="attributes-label"><g:link controller="attribute" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.variations}">
				<li class="fieldcontain">
					<span id="variations-label" class="property-label"><g:message code="product.variations.label" default="Variations" /></span>
					
						<g:each in="${productInstance.variations}" var="v">
						<span class="property-value" aria-labelledby="variations-label"><g:link controller="variation" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productInstance?.id}" />
					<g:link class="edit" action="edit" id="${productInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
