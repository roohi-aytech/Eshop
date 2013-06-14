<g:set var="page" value="${params.page?.toInteger() ?: 0}"/>
<g:set var="lastPage" value="${Math.round(filters.products.totalPages)}"/>
<g:if test="${page > 0}">
    <link rel="prev" href="${createLink(absolute: true, action:params.action, params:params + [page: page - 1])}"/>
</g:if>
<g:if test="${page < lastPage}">
    <link rel="next" href="${createLink(absolute: true, action:params.action, params:params + [page: page + 1])}"/>
</g:if>