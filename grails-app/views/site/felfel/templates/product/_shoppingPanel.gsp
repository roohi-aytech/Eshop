<g:if test="${productModel}">
    <% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
    <g:set var="price" value="${priceService.calcProductModelPrice(productModel.id)}"/>
    <g:set var="oldPrice" value="${priceService.calcProductModelOldPrice(productModel.id)}"/>
    <g:if test="${price.showVal && price.status == 'exists'}">
        <div class="action_block">

            <div class="action_block_left without_config ">
                <ul>
                    <input type="hidden" id="inventory_count" value="29" name="inventory_count">
                    <input type="hidden" id="max_inventory_count" value="200" name="max_inventory_count">

                    <li class="qty">
                        <span><g:message code="count"/></span>
                        <span class="count"><input type="text" class="qty_inpt" disabled="disabled" value="1"
                                                   id="qty_${product?.id}" name="count"></span>

                        <div class="up_down">
                            <a onclick="updateOrderCount('${product?.id}', 'up');" class="up"
                               href="javascript:void(0);"></a>
                            <a onclick="updateOrderCount('${product?.id}', 'down');" class="down"
                               href="javascript:void(0);"></a>
                        </div>
                    </li>

                </ul>

                <div class="total_price">

                    <span class="you_pay" id="total-price"><g:message code="basket.totalPrice"/></span> <span
                        class="red" id="orderPrice_${product?.id}"><g:formatNumber number="${price.showVal}" type="number"/> <eshop:currencyLabel/></span>

                </div>


                <div class="clearfix"></div>
            </div>

            <div class="action_block_right">
                <input type="button" value="${message(code:'add-to-basket')}" title="${message(code:'add-to-basket')}" class="add_to_cart" id="add_cart" onclick="addItemToBasket(${productModel?.id}, '${productModel?.toBasketItemString()}', ${price?.showVal?.toInteger()});">
                <input type="button" value="${message(code:'buy-now')}" title="${message(code:'buy-now')}" class="buy_now_maroon" id="buy_imm" onclick="shopItem(${productModel?.id}, '${productModel?.toBasketItemString()}', ${price?.showVal?.toInteger()});">
            </div>

            <div class="clearfix"></div>
        </div>

        <input type="hidden" id="itemPrice_${product?.id}" value="${formatNumber(number:price.showVal, type:'number').replaceAll(',', '')}"/>

        <script language="javascript" type="text/javascript">
            function updateOrderCount(id, dir) {
                var input = $('#qty_' + id);
                var count = parseInt(input.val());
                if (dir == 'up')
                    count = count + 1;
                else if (count > 1)
                    count = count - 1;
                input.val(count);
                $('#orderPrice_' + id).text((parseInt($('#itemPrice_' + id).val()) * count).formatMoney() + ' ${eshop.currencyLabel()}');
            }

            function addItemToBasket(id, name, price) {
                var scope = angular.element(document.getElementById('main-container')).scope();
                scope.selectedAddedValues = selectedAddedValues;
                scope.addToBasket(id, name, price, selectedAddedValues, parseInt($('#qty_${product?.id}').val()));
                $('#link-basket').qtip('show');
            }

            function shopItem(id, name, price){
                addItemToBasket(id, name, price);
                $('#link-basket').qtip('show');
                setTimeout(function(){
                    window.location.href = '${createLink(controller: 'basket', action: 'checkout', absolute: true)}';
                }, 1000);
            }


        </script>
    </g:if>
</g:if>