<%@ page import="eshop.ProductModel" %>

<g:set var="productModelList" value="${eshop.ProductModel.findAllByIdInList(productIds?.collect { it.modelId })}"/>

<ul class="product-list" id="listing-container">
<g:each in="${productIds}" status="i" var="productId">
    <g:set var="productModel" value="${productModelList.find { it.id == productId.modelId }}"/>
    <g:if test="${productModel}">
        <g:render template="/mobile/common/productThumbnail" model="${[productModel: productModel]}"/>
    </g:if>
</g:each>
</ul>
