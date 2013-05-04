<%@ page import="eshop.VariationValue; eshop.Price" %>

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

<div>

    <g:each in="${product.variations}" var="variation">
        <label>${variation.name}</label>

        <select id="variation_${variation.id}" name="variation_${variation.id}">
            <g:each in="${variation.variationValues}" var="variationValue">
                <option value="${variationValue.id}" ${(priceInstance?.variationValues?.contains(variationValue))? 'selected': ''}>${variationValue.value}</option>
            </g:each>
        </select>

    </g:each>
</div>


<div class="fieldcontain ${hasErrors(bean: priceInstance, field: 'guarantee', 'error')} ">
    <label for="guarantee">
        <g:message code="price.guarantee.label" default="Guarantee"/>
    </label>
    <rg:autocomplete domainClass="eshop.Guarantee" id="guarantee" like="true" value="${priceInstance?.guarantee?.id}" display="${priceInstance?.guarantee}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: priceInstance, field: 'defaultPrice', 'error')}" >
<label for="defaultPrice">
    <g:message code="price.defaultPrice.label" default="Default Price"/>

</label>
<g:checkBox name="defaultPrice" value="${priceInstance?.defaultPrice}"/>
</div>

