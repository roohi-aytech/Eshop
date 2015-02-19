<%@ page import="eshop.goldaan.SpecialProducts" %>

<g:hasErrors bean="${specialProductsInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${specialProductsInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${specialProductsInstance?.id}" />
<g:hiddenField name="version" value="${specialProductsInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: specialProductsInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="specialProducts.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${specialProductsInstance.constraints.type.inList}" value="${specialProductsInstance?.type}" valueMessagePrefix="specialProducts.type" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialProductsInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="specialProducts.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${eshop.Product.list()}" optionKey="id" required="" value="${specialProductsInstance?.product?.id}" class="many-to-one"/>
</div>

