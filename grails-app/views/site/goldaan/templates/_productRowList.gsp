<g:if test="${productIds?.size() > 0}">

    <g:each in="${productIds?.collect{it.modelId}}" status="i" var="productModelId">
        <g:set var="productModel" value="${eshop.ProductModel.findById(productModelId)}"/>
        %{--<g:if test="${i % 3 == 0}">--}%
            %{--<div class="row">--}%
        %{--</g:if>--}%
        %{--<g:set var="product" value="${eshop.Product.get(productId?.id)}"/>--}%

        <g:if test="${productModel}">
            <g:render template="/site/${grailsApplication.config.eShop.instance}/templates/productThumbnail"
                      model="[product: productModel.product,model:productModel]"/>
        </g:if>
        %{--<g:if test="${i % 3 == 2 || i == productIds.size() - 1}">--}%
            %{--</div>--}%
        %{--</g:if>--}%
    </g:each>
</g:if>
<g:else>
    <div class="info">
        <g:message code="search.noResult"/>
    </div>
</g:else>