<div class="container-fluid">
    <ul class="thumbnails row-fluid">
    %{--<div class="span" style="display: none;"></div>--}%
        <g:each in="${productIds}" status="i" var="productId">
            <g:set var="product" value="${eshop.Product.get(productId)}"/>
            <g:if test="${product}">
                <li class="span3">
                    <g:render template="/site/common/productThumbnail" model="[product: product,]"/>
                </li>
            </g:if>
        </g:each>
    </ul>
    <g:if test="${filters.products.totalPages > 1}">
        <div class="pagination pagination-centered">
            <ul>
                <g:if test="${params.page && params.page.toInteger() > 1}">
                    <li ${(params.page ?: "0") == it.toString() ? 'class="active"' : ''}>
                        <g:link action="browse" params="${params + [page: 0]}">>></g:link></li>
                </g:if>
                <g:if test="${params.page && params.page.toInteger() > 0}">
                    <li ${(params.page ?: "0") == it.toString() ? 'class="active"' : ''}>
                        <g:link action="browse" params="${params + [page: params.page.toInteger() - 1]}">></g:link></li>
                </g:if>
                <g:set var="currentPage" value="${0}"></g:set>
                <g:if test="${params.page}">
                    <g:set var="currentPage" value="${params.page.toInteger()}"></g:set>
                </g:if>
                <g:each in="${(0..<filters.products.totalPages + 1)}">
                    <g:if test="${it > currentPage - 6 && it < currentPage + 6}">
                        <li ${(params.page ?: "0") == it.toString() ? 'class="active"' : ''}>
                            <g:link action="browse" params="${params + [page: it]}">${it + 1}</g:link></li>
                    </g:if>
                </g:each>
                <g:if test="${currentPage < filters.products.totalPages - 1}">
                    <li ${(params.page ?: "0") == it.toString() ? 'class="active"' : ''}>
                        <g:link action="browse" params="${params + [page: currentPage + 1]}"><</g:link></li>
                </g:if>
                <g:if test="${currentPage < filters.products.totalPages - 2}">
                    <li ${(params.page ?: "0") == it.toString() ? 'class="active"' : ''}>
                        <g:link action="browse"
                                params="${params + [page: Math.round(filters.products.totalPages)]}"><<</g:link></li>
                </g:if>
            </ul>
        </div>
    </g:if>
</div>