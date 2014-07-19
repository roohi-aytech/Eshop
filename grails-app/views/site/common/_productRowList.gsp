<g:if test="${productIds?.size() > 0}">
    <g:each in="${productIds}" status="i" var="productId">
        <g:if test="${i % 3 == 0}">
            <div class="row">
        </g:if>
        <g:set var="productModel" value="${eshop.ProductModel.get(productId)}"/>
        <g:if test="${productModel}">
            <g:render template="/site/${grailsApplication.config.eShop.instance}/templates/productThumbnail"
                      model="[productModel: productModel]"/>
        </g:if>
        <g:if test="${i % 3 == 2 || i == productIds.size() - 1}">
            </div>
        </g:if>
    </g:each>
</g:if>
<g:else>
    <div class="info">
        <g:message code="search.noResult"/>
    </div>
</g:else>