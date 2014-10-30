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
             style="width:90px;text-align: center;margin-left: 3px;"/>
    <
    <g:message code="deliveryPricingRule.weight.label" default="Weight"/>
    ≤
    <g:field type="number" name="weightMax" step="any" value="${deliveryPricingRuleInstance.weightMax}"
             style="width:90px;text-align: center;margin-right: 3px;"/>
</div>
<div style="padding: 3px;text-align: center;">
    <g:field type="number" name="volumeMin" step="any" value="${deliveryPricingRuleInstance.volumeMin}"
             style="width:90px;text-align: center;"/>
    <
    <g:message code="deliveryPricingRule.volume.label" default="Volume"/>
    ≤
    <g:field type="number" name="volumeMax" step="any" value="${deliveryPricingRuleInstance.volumeMax}"
             style="width:90px;text-align: center;"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryPricingRuleInstance, field: 'weightFactor', 'error')} required">
    <label for="weightFactor">
        <g:message code="deliveryPricingRule.weightFactor.label" default="weightFactor"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="weightFactor" step="any" required="" value="${deliveryPricingRuleInstance.weightFactor}" style="width:160px;"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryPricingRuleInstance, field: 'volumeFactor', 'error')} required">
    <label for="volumeFactor">
        <g:message code="deliveryPricingRule.volumeFactor.label" default="volumeFactor"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="volumeFactor" step="any" required="" value="${deliveryPricingRuleInstance.volumeFactor}" style="width:160px;"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryPricingRuleInstance, field: 'netFactor', 'error')} required">
    <label for="netFactor">
        <g:message code="deliveryPricingRule.netFactor.label" default="Factor"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="netFactor" step="any" required="" value="${deliveryPricingRuleInstance.netFactor}" style="width:160px;"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryPricingRuleInstance, field: 'factorCalculationType', 'error')} required">
    <label for="factorCalculationType">
        <g:message code="deliveryPricingRule.factorCalculationType.label" default="factorCalculationType"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="factorCalculationType" from="${deliveryPricingRuleInstance.constraints.factorCalculationType.inList}" style="width:100px;"
              value="${deliveryPricingRuleInstance?.factorCalculationType}" valueMessagePrefix="deliveryPricingRule.factorCalculationType"/>
</div>


