<%@ page import="eshop.delivery.DeliveryMethod" %>

<g:hasErrors bean="${deliveryMethodInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${deliveryMethodInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${deliveryMethodInstance?.id}" />
<g:hiddenField name="version" value="${deliveryMethodInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: deliveryMethodInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="deliveryMethod.name.label" default="Name" />
		
	</label>
	<g:textField size="35" name="name" value="${deliveryMethodInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryMethodInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="deliveryMethod.description.label" default="Description" />
		
	</label>
	<g:textArea cols="35" rows="5" name="description" value="${deliveryMethodInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryMethodInstance, field: 'logo', 'error')} ">
	<label for="logo">
		<g:message code="deliveryMethod.logo.label" default="Logo" />
		
	</label>
	<input type="file" id="logo" name="logo" />
    <img src="<g:createLink controller="deliveryMethod" action="getImage" params="${[id:deliveryMethodInstance?.id]}"/>" style="max-width: 100px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryMethodInstance, field: 'insuranceIsRequired', 'error')} ">
    <label for="insuranceIsRequired">
        <g:message code="deliveryMethod.insuranceIsRequired.label" default="insuranceIsRequired" />

    </label>
    <g:checkBox name="insuranceIsRequired" value="${deliveryMethodInstance?.insuranceIsRequired}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryMethodInstance, field: 'insurancePercent', 'error')} ">
    <label for="insurancePercent">
        <g:message code="deliveryMethod.insurancePercent.label" default="insurancePercent" />

    </label>
    <g:textField size="35" name="insurancePercent" value="${deliveryMethodInstance?.insurancePercent}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryMethodInstance, field: 'addedValuePercent', 'error')} ">
    <label for="addedValuePercent">
        <g:message code="deliveryMethod.addedValuePercent.label" default="addedValuePercent" />

    </label>
    <g:textField size="35" name="addedValuePercent" value="${deliveryMethodInstance?.addedValuePercent}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryMethodInstance, field: 'hidePrice', 'error')} ">
    <label for="insuranceIsRequired">
        <g:message code="deliveryMethod.hidePrice.label" default="hidePrice" />

    </label>
    <g:checkBox name="hidePrice" value="${deliveryMethodInstance?.hidePrice}"/>
</div>
<g:if test="${grailsApplication.config.deliveryMinIntervalFromOrderEnabled}">
<div class="fieldcontain ${hasErrors(bean: deliveryMethodInstance, field: 'hidePrice', 'error')} ">
    <label for="minIntervalFromOrder">
        <g:message code="deliveryMethod.minIntervalFromOrder.label" default="minIntervalFromOrder" />

    </label>
    <g:textField name="minIntervalFromOrder" value="${deliveryMethodInstance?.minIntervalFromOrder}"/>
</div>
</g:if>




