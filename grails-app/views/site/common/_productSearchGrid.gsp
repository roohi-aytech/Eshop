<div class="container-fluid">
    <ul class="product-thumbnails thumbnails row-fluid">
    %{--<div class="span" style="display: none;"></div>--}%
        <g:each in="${filters.searchResult.results.collect { it.id }}" status="i" var="productId">
            <g:set var="product" value="${eshop.Product.get(productId)}"/>
            <g:if test="${product}">
                <li class="span3">
                    <g:render template="/site/common/productThumbnail" model="[product: product]"/>
                </li>
            </g:if>
        </g:each>
    </ul>
    <g:if test="${filters.searchResult.total.toInteger() > filters.searchResult.max.toInteger()}">
        <div class="pagination pagination-centered">
            <ul>
                <g:if test="${filters.searchResult.offset.toInteger() >= filters.searchResult.max.toInteger() * 2}">
                    <li>
                        <g:link action="${params.action}" params="${params + [offset: 0]}">>></g:link></li>
                </g:if>
                <g:if test="${filters.searchResult.offset.toInteger() >= filters.searchResult.max.toInteger()}">
                    <li>
                        <g:link action="${params.action}"
                                params="${params + [offset: filters.searchResult.offset.toInteger() - filters.searchResult.max.toInteger()]}">></g:link></li>
                </g:if>
                <g:set var="currentPage" value="${filters.searchResult.offset.toInteger() / filters.searchResult.max.toInteger()}"></g:set>
                <g:each in="${(0..<(filters.searchResult.total.toInteger() / filters.searchResult.max.toInteger()) + 1)}">
                    <g:if test="${it > currentPage - 6 && it < currentPage + 6}">
                        <li ${currentPage.toString() == it.toString() ? 'class="active"' : ''}>
                            <g:link action="${params.action}" params="${params + [offset: it * filters.searchResult.max.toInteger()]}">${it + 1}</g:link></li>
                    </g:if>
                </g:each>
                <g:if test="${filters.searchResult.offset.toInteger() + filters.searchResult.max.toInteger() < filters.searchResult.total.toInteger()}">
                    <li>
                        <g:link action="${params.action}" params="${params + [offset: filters.searchResult.offset.toInteger() + filters.searchResult.max.toInteger()]}"><</g:link></li>
                </g:if>
                <g:if test="${filters.searchResult.offset.toInteger() + 2 * filters.searchResult.max.toInteger() < filters.searchResult.total.toInteger()}">
                    <li>
                        <g:link action="${params.action}"
                                params="${params + [offset: Math.floor(filters.searchResult.total.toInteger() / filters.searchResult.max.toInteger()) * filters.searchResult.max.toInteger()]}"><<</g:link></li>
                </g:if>
            </ul>
        </div>
    </g:if>
</div>