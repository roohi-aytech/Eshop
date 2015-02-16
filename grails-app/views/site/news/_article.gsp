<% def feedService = grailsApplication.classLoader.loadClass('eshop.FeedService').newInstance() %>
<g:set var="items" value="${feedService.readArticles(productTypeId)}"/>
<g:if test="${items.size()}">
    <div class="news" id="news-article">
        <h3><g:message code="news.article.title"/></h3>
        <ul>
            <g:each in="${items.size() > 4 ? items[0..3] : items}" var="item">
                <li>
                    <a href="${createLink(uri: "/article/${item.id}")}"><img style="height:48px;" src="${createLink(controller: 'image', params: [id:item.id, type:'article'])}"/>${item.title}</a>
                </li>
            </g:each>
        </ul>
        <g:if test="${items.size() > 4}">
            <a class="more-link" href="${createLink(uri:"/article/list/${productTypeId?:''}")}">
                <g:message code="articles.more"/> <span>>></span>
            </a>
        </g:if>
    </div>
</g:if>