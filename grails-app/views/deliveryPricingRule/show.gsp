
<%@ page import="eshop.delivery.DeliveryPricingRule" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'deliveryPricingRule.label', default: 'DeliveryPricingRule')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-deliveryPricingRule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-deliveryPricingRule" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list deliveryPricingRule">
			
				<g:if test="${deliveryPricingRuleInstance?.weightMin}">
				<li class="fieldcontain">
					<span id="weightMin-label" class="property-label"><g:message code="deliveryPricingRule.weightMin.label" default="Weight Min" /></span>
					
						<span class="property-value" aria-labelledby="weightMin-label"><g:fieldValue bean="${deliveryPricingRuleInstance}" field="weightMin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryPricingRuleInstance?.weightMax}">
				<li class="fieldcontain">
					<span id="weightMax-label" class="property-label"><g:message code="deliveryPricingRule.weightMax.label" default="Weight Max" /></span>
					
						<span class="property-value" aria-labelledby="weightMax-label"><g:fieldValue bean="${deliveryPricingRuleInstance}" field="weightMax"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryPricingRuleInstance?.volumeMin}">
				<li class="fieldcontain">
					<span id="volumeMin-label" class="property-label"><g:message code="deliveryPricingRule.volumeMin.label" default="Volume Min" /></span>
					
						<span class="property-value" aria-labelledby="volumeMin-label"><g:fieldValue bean="${deliveryPricingRuleInstance}" field="volumeMin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryPricingRuleInstance?.volumeMax}">
				<li class="fieldcontain">
					<span id="volumeMax-label" class="property-label"><g:message code="deliveryPricingRule.volumeMax.label" default="Volume Max" /></span>
					
						<span class="property-value" aria-labelledby="volumeMax-label"><g:fieldValue bean="${deliveryPricingRuleInstance}" field="volumeMax"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryPricingRuleInstance?.factor}">
				<li class="fieldcontain">
					<span id="factor-label" class="property-label"><g:message code="deliveryPricingRule.factor.label" default="Factor" /></span>
					
						<span class="property-value" aria-labelledby="factor-label"><g:fieldValue bean="${deliveryPricingRuleInstance}" field="factor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryPricingRuleInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="deliveryPricingRule.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${deliveryPricingRuleInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryPricingRuleInstance?.deleted}">
				<li class="fieldcontain">
					<span id="deleted-label" class="property-label"><g:message code="deliveryPricingRule.deleted.label" default="Deleted" /></span>
					
						<span class="property-value" aria-labelledby="deleted-label"><g:formatBoolean boolean="${deliveryPricingRuleInstance?.deleted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryPricingRuleInstance?.targetZone}">
				<li class="fieldcontain">
					<span id="targetZone-label" class="property-label"><g:message code="deliveryPricingRule.targetZone.label" default="Target Zone" /></span>
					
						<span class="property-value" aria-labelledby="targetZone-label"><g:link controller="deliveryTargetZone" action="show" id="${deliveryPricingRuleInstance?.targetZone?.id}">${deliveryPricingRuleInstance?.targetZone?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${deliveryPricingRuleInstance?.id}" />
					<g:link class="edit" action="edit" id="${deliveryPricingRuleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
