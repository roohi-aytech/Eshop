<%@ page import="eshop.Banner" %>
<div class="banners">
    <g:each in="${Banner.findAllByPositionAndDeleted('right', false).sort {it.sortIndex}}">
        <g:if test="${it.url}">
            <a href="${it.url}">
        </g:if>
        <img src="${createLink(controller: 'image', params:[type:'banner', id:it.id])}"/>
        <g:if test="${it.url}">
            </a>
        </g:if>
    </g:each>
</div>