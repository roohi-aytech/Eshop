<div class="similarProducts">
    <h3><g:message code="product.similar.list-goldaan"/></h3>

    <g:set var="lastVisitedProducts"
           value="${eshop.Product.findAllByDeleted  (false,[max:2])}"/>
    <g:if test="${lastVisitedProducts && !lastVisitedProducts.isEmpty()}">
        <g:each in="${lastVisitedProducts.reverse()}" var="product" status="index">
            <g:render template="goldaan/templates/productThumbnail" model="${[hideActionLabels:true,product:product,size:'100x100']}"/>
        </g:each>
    </g:if>
</div>