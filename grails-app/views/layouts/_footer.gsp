<div class="footer1">
    <% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
    <g:set var="lastVisitedProducts"
           value="${productService.findLastVisitedProducts(cookie(name: 'lastVisitedProducts'))}"></g:set>
    <g:if test="${lastVisitedProducts && !lastVisitedProducts.isEmpty()}">
        <g:render template="/site/common/productCarousel"
                  model="${[title: message(code: 'product.lastVisited.list'), productList: lastVisitedProducts, mode: 'large']}"></g:render>
    </g:if>
</div>