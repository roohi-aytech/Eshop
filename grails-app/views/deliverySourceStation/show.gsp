
<%@ page import="eshop.delivery.DeliverySourceStation" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'deliverySourceStation.label', default: 'DeliverySourceStation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-deliverySourceStation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-deliverySourceStation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list deliverySourceStation">
			
				<g:if test="${deliverySourceStationInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="deliverySourceStation.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:link controller="city" action="show" id="${deliverySourceStationInstance?.city?.id}">${deliverySourceStationInstance?.city?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliverySourceStationInstance?.phoneNumber}">
				<li class="fieldcontain">
					<span id="phoneNumber-label" class="property-label"><g:message code="deliverySourceStation.phoneNumber.label" default="Phone Number" /></span>
					
						<span class="property-value" aria-labelledby="phoneNumber-label"><g:fieldValue bean="${deliverySourceStationInstance}" field="phoneNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliverySourceStationInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="deliverySourceStation.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${deliverySourceStationInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliverySourceStationInstance?.contactPersons}">
				<li class="fieldcontain">
					<span id="contactPersons-label" class="property-label"><g:message code="deliverySourceStation.contactPersons.label" default="Contact Persons" /></span>
					
						<span class="property-value" aria-labelledby="contactPersons-label"><g:fieldValue bean="${deliverySourceStationInstance}" field="contactPersons"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliverySourceStationInstance?.deleted}">
				<li class="fieldcontain">
					<span id="deleted-label" class="property-label"><g:message code="deliverySourceStation.deleted.label" default="Deleted" /></span>
					
						<span class="property-value" aria-labelledby="deleted-label"><g:formatBoolean boolean="${deliverySourceStationInstance?.deleted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliverySourceStationInstance?.method}">
				<li class="fieldcontain">
					<span id="method-label" class="property-label"><g:message code="deliverySourceStation.method.label" default="Method" /></span>
					
						<span class="property-value" aria-labelledby="method-label"><g:link controller="deliveryMethod" action="show" id="${deliverySourceStationInstance?.method?.id}">${deliverySourceStationInstance?.method?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliverySourceStationInstance?.targetZones}">
				<li class="fieldcontain">
					<span id="targetZones-label" class="property-label"><g:message code="deliverySourceStation.targetZones.label" default="Target Zones" /></span>
					
						<g:each in="${deliverySourceStationInstance.targetZones}" var="t">
						<span class="property-value" aria-labelledby="targetZones-label"><g:link controller="deliveryTargetZone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${deliverySourceStationInstance?.id}" />
					<g:link class="edit" action="edit" id="${deliverySourceStationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
