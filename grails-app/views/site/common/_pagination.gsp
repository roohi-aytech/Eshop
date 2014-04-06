<g:if test="${totalPages > 1}">
    <div class="pagination pagination-centered">
        <ul>
            <g:if test="${params.page && params.page.toInteger() > 1}">
                <li ${(params.page ?: "0") == it.toString() ? 'class="active"' : ''}>
                    <g:link action="${params.action}" params="${params + [page: 0]}"><<</g:link></li>
            </g:if>
            <g:if test="${params.page && params.page.toInteger() > 0}">
                <li ${(params.page ?: "0") == it.toString() ? 'class="active"' : ''}>
                    <g:link action="${params.action}" params="${params + [page: params.page.toInteger() - 1]}"><</g:link></li>
            </g:if>
            <g:set var="currentPage" value="${0}"></g:set>
            <g:if test="${params.page}">
                <g:set var="currentPage" value="${params.page.toInteger()}"></g:set>
            </g:if>
            <g:each in="${(0..<totalPages + 1)}">
                <g:if test="${it > currentPage - 6 && it < currentPage + 6}">
                    <li ${(params.page ?: "0") == it.toString() ? 'class="active"' : ''}>
                        <g:link action="${params.action}" params="${params + [page: it]}">${it + 1}</g:link></li>
                </g:if>
            </g:each>
            <g:if test="${currentPage < totalPages - 1}">
                <li ${(params.page ?: "0") == it.toString() ? 'class="active"' : ''}>
                    <g:link action="${params.action}" params="${params + [page: currentPage + 1]}">></g:link></li>
            </g:if>
            <g:if test="${currentPage < totalPages - 2}">
                <li ${(params.page ?: "0") == it.toString() ? 'class="active"' : ''}>
                    <g:link action="${params.action}"
                            params="${params + [page: Math.ceil(totalPages).toInteger() - 1]}">>></g:link></li>
            </g:if>
        </ul>
    </div>
</g:if>