<script language="javascript" type="text/javascript">
    function addToBasket(id, name, price){
        angular.element(document.getElementById('main-container')).scope().addToBasket(id, name, price);
    }
</script>
<g:if test="${productModel}">
    <h4>${productModel}</h4>

%{--variation select--}%
    <g:each in="${product?.variations}">
        <div class="product-variation">
            <div class="variation-title">
                ${it.name}:
                <div class="cur-variation">${productModel.variationValues.find { value -> value.variationGroup.id == it.variationGroup.id }}</div>
            </div>
        </div>
    </g:each>
%{--guarantee select--}%
    <div class="product-variation">
        <div class="variation-title">
            ${message(code: 'guarantee')}:
            <div class="cur-variation">${productModel.guarantee.name}</div>
        </div>
    </div>

    <br/>
    <% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
    <g:set var="price" value="${priceService.calcProductModelPrice(productModel.id)}"/>
    <g:if test="${price.showVal}">
        %{--<g:message code="price"/>:--}%
        <b><g:render template="price" model="${[productModel:productModel, mainVal: price.mainVal, showVal: price.showVal, lastUpdate: price.lastUpdate]}"/></b>
    </g:if>

    <div class="buttons">
        <eshop:addToBasket prodcutModelId="${productModel.id}"
                           productModelTitle="${productModel}" angular="false"></eshop:addToBasket>
    </div>
</g:if>
<g:else>
    <h4>${product}</h4>
    <g:message code="product.model.notExists"/>
</g:else>
