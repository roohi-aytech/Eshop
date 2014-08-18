<g:if test="${productIds?.size() > 0}">
    <g:set var="productModelList" value="${eshop.ProductModel.findAllByIdInList(productIds?.collect{it.modelId})}"/>
    <g:each in="${productIds}" status="i" var="productId">
        <g:if test="${i % 3 == 0}">
            <div class="row">
        </g:if>
        <g:set var="productModel" value="${productModelList.find{it.id == productId.modelId}}"/>
        <g:if test="${productModel}">
            <g:render template="/site/${grailsApplication.config.eShop.instance}/templates/productThumbnail"
                      model="[productModel: productModel, productId: productId.id, modelCount: productId.modelCount]"/>

            <g:if test="${i % 3 == 2 || i == productIds.size() - 1}">
                </div>
            </g:if>
        </g:if>
        <g:else>
            <span style="display: none">
                product id : ${productId}
                <br/>
                <g:set var="product" value="${eshop.Product.get(productId.id)}"/>
                synchronization result: ${
                    (product.isSynchronized = false) ||
                            product.save()
                }
            </span>
        </g:else>
    </g:each>
</g:if>
<g:else>
    <div class="info">
        <g:message code="search.noResult"/>
    </div>
</g:else>