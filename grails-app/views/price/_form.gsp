<%@ page import="eshop.Price" %>

<g:hasErrors bean="${priceInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${priceInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${priceInstance?.id}" />
<g:hiddenField name="version" value="${priceInstance?.version}" />
<g:hiddenField name="product.id" value="${priceInstance?.product?.id}" />


<div class="fieldcontain ${hasErrors(bean: priceInstance, field: 'currency', 'error')} required">
	<label for="currency">
		<g:message code="price.currency.label" default="Currency" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="currency" name="currency.id" from="${eshop.Currency.list()}"
              optionKey="id"  noSelection="['':message(code: 'rial')]"
              value="${priceInstance?.currency?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: priceInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="price.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="price" step="any" required="" value="${priceInstance.price}"/>
</div>

