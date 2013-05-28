<%@ page import="eshop.VariationValue; eshop.Price" %>



<g:hiddenField name="id" value="${productModelInstance?.id}" />
<g:hiddenField name="version" value="${productModelInstance?.version}" />
<g:hiddenField name="product.id" value="${productModelInstance?.product?.id}" />
<g:hasErrors bean="${productModelInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${productModelInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

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

    <g:select id="guarantee" name="guarantee.id"
              required=""
              from="${guarantees}"
              optionKey="id"
              value="${productModelInstance?.guarantee?.id}"
              noSelection="['' : '']"/>
</div>


<div class="fieldcontain ${hasErrors(bean: productModelInstance, field: 'isDefaultModel', 'error')}" >
    <label for="isDefaultModel">
        <g:message code="productModel.isDefaultModel.label" default="Default Model"/>

    </label>
    <g:checkBox name="isDefaultModel" value="${productModelInstance?.isDefaultModel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productModelInstance, field: 'status', 'error')} ">
    <label for="status">
        <g:message code="productModel.status.label" default="Status"/>

    </label>
    <g:select name="status" from="${productModelInstance.constraints.status.inList}" value="${productModelInstance?.status}"
              valueMessagePrefix="productModel.status" noSelection="['': '']"/>


</div>
