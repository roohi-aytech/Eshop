<g:each in="${productIds}" status="i" var="productId">
    <g:if test="${i % 3 == 0}">
        <div class="row">
    </g:if>
    <g:set var="product" value="${eshop.Product.get(productId)}"/>
    <g:if test="${product}">
        <g:render template="/site/${grailsApplication.config.eShop.instance}/templates/productThumbnail" model="[product: product]"/>
    </g:if>
    <g:if test="${i % 3 == 2 || i == productIds.size() - 1}">
        </div>
    </g:if>
</g:each>