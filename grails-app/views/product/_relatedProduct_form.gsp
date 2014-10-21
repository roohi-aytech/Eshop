<%@ page import="eshop.RelatedProduct" %>
<g:hiddenField name="id" value="${relatedProductInstance?.id}"/>
<g:hiddenField name="version" value="${relatedProductInstance?.version}" />
<g:hiddenField name="baseProduct.id" value="${baseProductId}" />

<div class="fieldcontain ${hasErrors(bean: relatedProductInstance, field: 'product', 'error')} ">
    <label for="product">
        <g:message code="product.label" default="Product"/>
    </label>
    <rg:autocomplete domainClass="eshop.Product" id="product" like="true" value="${relatedProductInstance?.product?.id}" display="${relatedProductInstance?.product}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relatedProductInstance, field: 'productType', 'error')} ">
    <label for="product">
        <g:message code="productType.label" default="Product"/>
    </label>
    <rg:autocomplete domainClass="eshop.ProductType" id="productType" like="true" value="${relatedProductInstance?.productType?.id}" display="${relatedProductInstance?.productType}"/>
</div>

<div class="fieldcontain" id="variationValues">

</div>


