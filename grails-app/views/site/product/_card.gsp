<script language="javascript" type="text/javascript">

    var selectedAddedValues = [${selectedAddedValues.collect{it.id}.join(',')}];
    $(document).ready(function () {
        $('#selectedAddedValues').val(selectedAddedValues.toString());
    });
    function addToBasket(id, name, price) {
        var scope = angular.element(document.getElementById('main-container')).scope();
        scope.selectedAddedValues = selectedAddedValues;
        scope.addToBasket(id, name, price, selectedAddedValues);
    }

    function addOrRemoveAddedValue(item) {

        var i = selectedAddedValues.indexOf(parseInt($(item).val()));
        if (i != -1)
            selectedAddedValues.splice(i, 1);
        else
            selectedAddedValues[selectedAddedValues.length] = parseInt($(item).val());

        $('#selectedAddedValues').val(selectedAddedValues.toString());
        var $form = $("#productVariationForm");
        var serializedData = $form.serialize();
        $('#product-card').html('${message(code: 'waiting')}');
        angular.element(document.getElementById('main-container')).scope().reloadProductCart("${createLink(controller: "site", action: "productCard")}", serializedData, $('#product-card'));
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
    <g:set var="price" value="${priceService.calcProductModelPrice(productModel.id, selectedAddedValues.collect{it.id})}"/>
    <g:if test="${price.valueAddedVal}">
        <div class="price">
            <g:message code="price"/>:
            <span class='current'><g:formatNumber
                    number="${price.valueAddedVal}" type="number"/> <g:message code="rial"/></span>
        </div>
    </g:if>

    <g:if test="${addedValues?.size() > 0}">
        <div class="addedValues">
            <div class="title"><g:message code="addedValue.title"/></div>
            <g:each in="${addedValues}" var="addedValue">
                <div class="item"
                    ${addedValue.processTime == 'mandetory' ? 'original-title="' + message(code: "product.addedValues.${addedValue.processTime}.tip") + '"' : ''}>
                    <div>
                        <g:if test="${addedValue.processTime == 'optional'}">
                            <input type="checkbox" name="addedValues" id="addedValues_${addedValue.id}"
                                   value="${addedValue.id}" onchange="addOrRemoveAddedValue(this);"
                                ${selectedAddedValues.collect { it.id }.contains(addedValue.id) ? 'checked' : ''}/>
                            <label for="addedValues_${addedValue.id}">
                                ${addedValue.name}
                            </label>
                        </g:if>
                        <g:else>
                            <div class="requiredItem">
                                ${addedValue.name}
                            </div>
                        </g:else>
                    </div>

                    <div class="price">
                        <g:if test="${addedValue.type == 'percent'}">
                            <g:formatNumber number="${Math.round((addedValue.value * price.mainVal) / 100)}"
                                            type="number"/> <g:message code="rial"/>
                        </g:if>
                        <g:else>
                            <g:formatNumber number="${addedValue.value}" type="number"/> <g:message code="rial"/>
                        </g:else>
                    </div>
                </div>
            </g:each>
        </div>
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
