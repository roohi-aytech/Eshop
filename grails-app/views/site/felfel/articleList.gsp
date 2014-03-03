<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 1/20/14
  Time: 3:26 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="article.list.title" args="${[productType?.name?:'']}"/></title>
</head>

<body>
<div class="page-content">
    <h2><g:message code="article.list.title" args="${[productType?.name?:'']}"/></h2>
    <ul class="article-list">
        <g:each in="${articles}" var="article">
            <li>
                <img src="${createLink(controller: 'image', params: [id:article.id, type:'article'])}"/>
                <a href="${createLink(uri: "/article/${article.id}")}">${article.title}</a><br/>
                <span>${article.summary}</span>
            </li>
        </g:each>
    </ul>

    <g:if test="${totalPages > 1}">
        <div class="pagination pagination-centered">
            <g:set var="currentPage" value="${0}"/>
            <g:if test="${params.page}">
                <g:set var="currentPage" value="${params.page.toInteger()}"/>
            </g:if>
            <ul>
                <g:if test="${currentPage > 1}">
                    <li>
                        <g:link action="${params.action}" params="${params + [page: 0]}"><<</g:link></li>
                </g:if>
                <g:if test="${currentPage > 0}">
                    <li>
                        <g:link action="${params.action}" params="${params + [page: currentPage - 1]}"><</g:link></li>
                </g:if>
                <g:each in="${(0..<totalPages + 1)}">
                    <g:if test="${it > currentPage - 6 && it < currentPage + 6}">
                        <li ${(params.page ?: "0") == it.toString() ? 'class="active"' : ''}>
                            <g:link action="${params.action}" params="${params + [page: it]}">${it + 1}</g:link></li>
                    </g:if>
                </g:each>
                <g:if test="${currentPage < totalPages - 1}">
                    <li>
                        <g:link action="${params.action}" params="${params + [page: currentPage + 1]}">></g:link></li>
                </g:if>
                <g:if test="${currentPage < totalPages - 2}">
                    <li>
                        <g:link action="${params.action}"
                                params="${params + [page: Math.ceil(totalPages).toInteger() - 1]}">>></g:link></li>
                </g:if>
            </ul>
        </div>
    </g:if>
</div>
</body>
</html>