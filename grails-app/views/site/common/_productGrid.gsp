<div class="container-fluid">
    <ul class="thumbnails row-fluid">
    %{--<div class="span" style="display: none;"></div>--}%
        <g:each in="${productIds}" status="i" var="productId">
            <g:set var="product" value="${eshop.Product.get(productId)}"/>
            <g:if test="${product}">
                <li class="span3">
                    <g:render template="product_search" model="[product: product,]"/>
                </li>
            </g:if>
        </g:each>
    </ul>
    <g:if test="${filters.products.totalPages > 1}">
        <div class="pagination pagination-centered">
            <ul>
                <g:each in="${(0..<filters.products.totalPages + 1)}">
                    <li ${(params.page ?: "0") == it.toString() ? 'class="active"' : ''}>
                        <g:link action="browse" params="${params + [page: it]}">${it + 1}</g:link></li>
                </g:each>
            </ul>
        </div>
    </g:if>
</div>