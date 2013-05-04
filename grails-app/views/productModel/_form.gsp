<%@ page import="eshop.VariationValue; eshop.Price" %>

<g:hasErrors bean="${productModelInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${productModelInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${productModelInstance?.id}" />
<g:hiddenField name="version" value="${productModelInstance?.version}" />
<g:hiddenField name="product.id" value="${productModelInstance?.product?.id}" />

<div class="fieldcontain ${hasErrors(bean: productModelInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="productModel.name.label" default="Name"/>

    </label>
    <g:textField  name="name"  value="${productModelInstance.name}"/>
</div>

<div>

    <g:each in="${product.variations}" var="variation">
        <label>${variation.name}</label>

        <select id="variation_${variation.id}" name="variation_${variation.id}">
            <g:each in="${variation.variationValues}" var="variationValue">
                <option value="${variationValue.id}" ${(productModelInstance?.variationValues?.contains(variationValue))? 'selected': ''}>${variationValue.value}</option>
            </g:each>
        </select>

    </g:each>
</div>


<div class="fieldcontain ${hasErrors(bean: productModelInstance, field: 'guarantee', 'error')} ">
    <label for="guarantee">
        <g:message code="productModel.guarantee.label" default="Guarantee"/>
    </label>
    <rg:autocomplete domainClass="eshop.Guarantee" id="guarantee" like="true" value="${productModelInstance?.guarantee?.id}" display="${productModelInstance?.guarantee}"/>

</div>



