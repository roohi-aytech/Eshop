<% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
<g:set var="price" value="${priceService.calcProductModelPrice(productModel.id)}"/>
<g:if test="${price.showVal}">
    %{--<g:message code="price"/>:--}%
    <b><g:render template="price"
                 model="${[productModel: productModel, mainVal: price.mainVal, showVal: price.showVal, lastUpdate: price.lastUpdate]}"/></b>
</g:if>