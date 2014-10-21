<div class="similarProducts">
    <h3><g:message code="product.similar.list-goldaan"/></h3>
    <g:set var="pCount" value="${eshop.Product.countByDeleted(false)}"/>
    <g:set var="lastVisitedProducts"
           value="${eshop.Product.findAllByDeleted  (false,[max:1,offset:(int)(Math.random()*pCount)]).plus(eshop.Product.findAllByDeleted  (false,[max:1,offset:(int)(Math.random()*pCount)]))}"/>
    <g:if test="${lastVisitedProducts && !lastVisitedProducts.isEmpty()}">
        <g:each in="${lastVisitedProducts.reverse()}" var="product" status="index">
            <g:render template="goldaan/templates/productThumbnail" model="${[hideActionLabels:true,product:product,size:'100x100']}"/>
        </g:each>
    </g:if>
</div>