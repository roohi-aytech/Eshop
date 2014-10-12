<ul class="breadcrumb">
    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
        <a href="${createLink(uri: '/')}" itemprop="url">
            <span itemprop="title">
                <g:message code="home"/>
            </span>
        </a>
    </li>
    <g:if test="${filters.breadcrumb.size() > 0}">
        <g:each in="${filters.breadcrumb[0..-1]}">
            <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                <span class="divider">${">"}</span>
                <a href="${commonLink}${it.linkTail}"
                   itemprop="url"><span itemprop="title">${it.linkTitle}</span></a>
            </li>
        </g:each>
    </g:if>
</ul>