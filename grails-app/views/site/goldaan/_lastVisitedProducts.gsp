<div class="lastVisitedProducts">
    <h3><g:message code="product.lastVisited.list-goldaan"/></h3>
    <% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
    <g:set var="lastVisitedProducts"
           value="${productService.findLastVisitedProducts(cookie(name: 'lastVisitedProducts'))}"/>
    <g:if test="${lastVisitedProducts && !lastVisitedProducts.isEmpty()}">
        <g:each in="${lastVisitedProducts.reverse()}" var="product" status="index">
            <g:if test="${index<2}">
                <g:render template="goldaan/templates/productThumbnail"/>
            </g:if>
        </g:each>
    </g:if>
</div>