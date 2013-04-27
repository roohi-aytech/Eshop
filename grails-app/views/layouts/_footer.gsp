<div class="footer1">
    <% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
    <g:set var="lastVisitedProducts"
           value="${productService.findLastVisitedProducts(cookie(name: 'lastVisitedProducts'))}"></g:set>
    <g:if test="${lastVisitedProducts && !lastVisitedProducts.isEmpty()}">
        <g:render template="/site/common/productCarousel"
                  model="${[title: message(code: 'product.lastVisited.list'), productList: lastVisitedProducts, mode: 'large']}"></g:render>
    </g:if>
</div>

<div class="footer2">
    <a href="${createLink(controller: 'site')}"><g:message code="home.label"></g:message></a> |
    <a href="#"><g:message code="support.label"></g:message></a> |
    <a href="#"><g:message code="help.label"></g:message></a> |
    <a href="#"><g:message code="contact.label"></g:message></a>
</div>

<div class="footer3"></div>