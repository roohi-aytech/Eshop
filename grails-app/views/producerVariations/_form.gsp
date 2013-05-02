<%@ page import="eshop.Producer; eshop.ProducerVariations" %>

<g:hasErrors bean="${producerVariationsInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${producerVariationsInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${producerVariationsInstance?.id}" />
<g:hiddenField name="version" value="${producerVariationsInstance?.version}" />
<g:hiddenField name="product.id" value="${product?.id}" />


<div class="fieldcontain ${hasErrors(bean: producerVariationsInstance, field: 'producer', 'error')} ">
    <label for="producer">
        <g:message code="producer.label" default="Producer"/>
    </label>
    <rg:autocomplete domainClass="eshop.Producer" id="producer" like="true" value="${producerVariationsInstance?.producer?.id}" display="${producerVariationsInstance?.producer}"/>

</div>

<div>
    <g:each in="${product.variations}" var="variation">
        <label>${variation.name}</label>

        <select id="variation_${variation.id}" name="variation_${variation.id}" >
            <g:each in="${variation.variationValues}" var="variationValue">
                <option value="${variationValue.id}" ${(priceInstance.variationValues.contains(variationValue))? 'selected': ''}>${variationValue.value}</option>
                </option>
            </g:each>
        </select>

    </g:each>
</div>

