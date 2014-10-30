<g:if test="${totalPages > 1}">
    <div class="navigation">
        <g:if test="${params.page && params.page.toInteger() > 0}">
                <g:link action="${params.action}" class="pagination_btn"
                        params="${params + [page: params.page.toInteger() - 1]}">
                    <img src="${resource(dir:'images/mobile', file:'back-icon.png')}">
                        </g:link>
        </g:if>
        <g:set var="currentPage" value="${0}"/>
        <g:if test="${params.page}">
            <g:set var="currentPage" value="${params.page.toInteger()}"/>
        </g:if>
        <g:each in="${(0..<totalPages + 1)}">
            <g:if test="${it > currentPage - 2 && it < currentPage + 2}">
                    <g:link action="${params.action}" params="${params + [page: it]}" class="pagination_btn ${(params.page ?: "0") == it.toString() ? 'selected' : ''}">${it + 1}</g:link>
            </g:if>
        </g:each>
        <g:if test="${currentPage < totalPages - 1}">
                <g:link action="${params.action}" params="${params + [page: currentPage + 1]}" class="pagination_btn">
                    <img src="${resource(dir:'images/mobile', file:'next-icon.png')}">
                </g:link>
        </g:if>
    </div>
</g:if>