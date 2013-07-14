
<%@ page import="eshop.delivery.DeliveryTargetZone" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'deliveryTargetZone.label', default: 'DeliveryTargetZone')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-deliveryTargetZone" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-deliveryTargetZone" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list deliveryTargetZone">
			
				<g:if test="${deliveryTargetZoneInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="deliveryTargetZone.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${deliveryTargetZoneInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryTargetZoneInstance?.cities}">
				<li class="fieldcontain">
					<span id="cities-label" class="property-label"><g:message code="deliveryTargetZone.cities.label" default="Cities" /></span>
					
						<g:each in="${deliveryTargetZoneInstance.cities}" var="c">
						<span class="property-value" aria-labelledby="cities-label"><g:link controller="city" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryTargetZoneInstance?.deleted}">
				<li class="fieldcontain">
					<span id="deleted-label" class="property-label"><g:message code="deliveryTargetZone.deleted.label" default="Deleted" /></span>
					
						<span class="property-value" aria-labelledby="deleted-label"><g:formatBoolean boolean="${deliveryTargetZoneInstance?.deleted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryTargetZoneInstance?.pricingRules}">
				<li class="fieldcontain">
					<span id="pricingRules-label" class="property-label"><g:message code="deliveryTargetZone.pricingRules.label" default="Pricing Rules" /></span>
					
						<g:each in="${deliveryTargetZoneInstance.pricingRules}" var="p">
						<span class="property-value" aria-labelledby="pricingRules-label"><g:link controller="deliveryPricingRule" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryTargetZoneInstance?.sourceStation}">
				<li class="fieldcontain">
					<span id="sourceStation-label" class="property-label"><g:message code="deliveryTargetZone.sourceStation.label" default="Source Station" /></span>
					
						<span class="property-value" aria-labelledby="sourceStation-label"><g:link controller="deliverySourceStation" action="show" id="${deliveryTargetZoneInstance?.sourceStation?.id}">${deliveryTargetZoneInstance?.sourceStation?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${deliveryTargetZoneInstance?.id}" />
					<g:link class="edit" action="edit" id="${deliveryTargetZoneInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
