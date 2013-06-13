<%@ page import="eshop.ProducingProduct" %>
<g:hasErrors bean="${productTypeBrandInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${productTypeBrandInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${productTypeBrandInstance?.id}" />
<g:hiddenField name="version" value="${productTypeBrandInstance?.version}" />

<div style="display:table;">
    <div class="fieldcontain ${hasErrors(bean: productTypeBrandInstance, field: 'productTypes', 'error')} ">
       <label for="productTypes">
           <g:message code="productTypeBrand.productTypes.label" default="Product Types"/>
       </label>

       <rg:tree bean="${productTypeBrandInstance}" field="productTypes" relationField="parentProduct" width="250px" cascadeCheck="true"></rg:tree>
    </div>

    <div class="fieldcontain ${hasErrors(bean: productTypeBrandInstance, field: 'brand', 'error')} ">
        <label for="brand">
            <g:message code="producingProduct.brand.label" default="Brand"/>
        </label>
        <rg:autocomplete  domainClass="eshop.Brand" id="brand" like="true" value="${productTypeBrandInstance?.brand?.id}" display="${productTypeBrandInstance?.brand}"/>
        <input type="button" value="${message(code: "add")}" onclick="addBrand()">
    </div>

</div>
