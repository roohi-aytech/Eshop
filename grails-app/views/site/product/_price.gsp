<g:if test="${productModel}">
    <% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
    <g:set var="price" value="${priceService.calcProductModelPrice(productModel.id)}"/>
    <g:if test="${price.showVal}">
    %{--<g:message code="price"/>:--}%
        <b><g:render template="price"
                     model="${[productModel: productModel, showVal: price.showVal, lastUpdate: price.lastUpdate]}"/></b>
    </g:if>
</g:if>