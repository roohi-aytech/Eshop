<g:if test="${articles && !articles.isEmpty()}">
    <div class="well sidebar-nav">
        <ul class="nav nav-list">
            <li class="nav-header"><g:message code="journalArticle"></g:message></li>
            <g:each in="${articles}">
                <li><a href="${createLink(uri:'/article/' + it.id)}" target="_blank">${it.title}</a></li>
            </g:each>
        </ul>
    </div>
</g:if>