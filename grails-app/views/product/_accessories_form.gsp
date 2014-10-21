<%@ page import="eshop.Accessory" %>
<g:hiddenField name="id" value="${accessoryInstance?.id}"/>
<g:hiddenField name="version" value="${accessoryInstance?.version}" />
<g:hiddenField name="baseProduct.id" value="${baseProductId}" />

<div class="fieldcontain ${hasErrors(bean: accessoryInstance, field: 'product', 'error')} ">
    <label for="product">
        <g:message code="product.label" default="Product"/>
    </label>
    <rg:autocomplete domainClass="eshop.Product" id="product" like="true" value="${accessoryInstance?.product?.id}" display="${accessoryInstance?.product}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accessoryInstance, field: 'productType', 'error')} ">
    <label for="product">
        <g:message code="productType.label" default="Product"/>
    </label>
    <rg:autocomplete domainClass="eshop.ProductType" id="productType" like="true" value="${accessoryInstance?.productType?.id}" display="${accessoryInstance?.productType}"/>
</div>


</div>


