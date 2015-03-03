<%@ page import="eshop.ProductType" %>
<% def feedService = grailsApplication.classLoader.loadClass('eshop.FeedService').newInstance() %>
<g:set var="items" value="${feedService.readPosts(productTypeId)}"/>
<g:if test="${items.size()}">
    <div class="news" id="news-blog">
        <h3><g:message code="news.blog.title"/></h3>
        <ul>
            <g:each in="${items.size() > 4 ? items[0..3] : items}" var="item">
                <li>
                    <a href="${item.link}"><img width="64px" src="${item.imgUrl}"/>${item.title}</a>
                </li>
            </g:each>
        </ul>
        <g:if test="${items.size() > 4}">
            <a class="more-link" href="http://www.blog.zanbil.ir/${ProductType.get(productTypeId)?.seoFriendlyName}">
                <g:message code="news.more"/> <span>>></span>
            </a>
        </g:if>
    </div>
</g:if>