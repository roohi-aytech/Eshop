<% def feedService = grailsApplication.classLoader.loadClass('eshop.FeedService').newInstance() %>
<g:set var="items" value="${feedService.readNews()}"/>
<g:if test="${items.size()}">
    <div class="news" id="news-news">
        <h3><g:message code="news.news.title"/></h3>
        <ul>
            <g:each in="${items.size() > 4 ? items[0..3] : items}" var="item">
                <li>
                    <a href="${item.link}"><img width="64px" src="${item.imgUrl}"/>${item.title}</a>
                </li>
            </g:each>
        </ul>
        <g:if test="${items.size() > 4}">
            <a class="more-link" href="http://www.blog.zanbil.ir/zanbil-and-festival-news">
                <g:message code="news.more"/> <span>>></span>
            </a>
        </g:if>
    </div>
</g:if>