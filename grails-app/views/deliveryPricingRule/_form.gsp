<%@ page import="eshop.delivery.DeliveryPricingRule" %>

<g:hasErrors bean="${deliveryPricingRuleInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${deliveryPricingRuleInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${deliveryPricingRuleInstance?.id}"/>
<g:hiddenField name="version" value="${deliveryPricingRuleInstance?.version}"/>
<g:hiddenField name="targetZone.id" value="${params["deliveryTargetZone.id"]}"/>

<br/>
<div style="padding: 3px;text-align: center;">
    <g:field type="number" name="weightMin" step="any" value="${deliveryPricingRuleInstance.weightMin}"
             style="width:100px;text-align: center;margin-left: 3px;"/>
    ≤
    <g:message code="deliveryPricingRule.weight.label" default="Weight"/>
    ≤
    <g:field type="number" name="weightMax" step="any" value="${deliveryPricingRuleInstance.weightMax}"
             style="width:100px;text-align: center;margin-right: 3px;"/>
</div>
<div style="padding: 3px;text-align: center;">
    <g:field type="number" name="volumeMin" step="any" value="${deliveryPricingRuleInstance.volumeMin}"
             style="width:100px;text-align: center;"/>
    ≤
    <g:message code="deliveryPricingRule.volume.label" default="Volume"/>
    ≤
    <g:field type="number" name="volumeMax" step="any" value="${deliveryPricingRuleInstance.volumeMax}"
             style="width:100px;text-align: center;"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryPricingRuleInstance, field: 'factor', 'error')} required">
    <label for="factor">
        <g:message code="deliveryPricingRule.factor.label" default="Factor"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="factor" step="any" required="" value="${deliveryPricingRuleInstance.factor}" style="width:160px;"/>
    <g:select name="type" from="${deliveryPricingRuleInstance.constraints.type.inList}" style="width:100px;"
              value="${deliveryPricingRuleInstance?.type}" valueMessagePrefix="deliveryPricingRule.type"/>
</div>


