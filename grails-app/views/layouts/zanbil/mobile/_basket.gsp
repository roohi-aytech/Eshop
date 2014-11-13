<script src="${resource(dir: 'js/mobile', file: 'checkout.js')}" type="text/javascript"></script>

<div id="mcart" class="main-width">
    <div class="clear"></div>

    <div id="checkout">

        <div class="cart_cta">
            <div class="right">
                <h2>
                    <g:message code="basket.items.price"/>
                    <em>{{calculateBasketTotalPrice() | number:0}} <eshop:currencyLabel/></em>
                </h2>
            </div>

            <div id="update_cart_ctas_top" class="update_cart_ctas">
                <div class="proceed_btn_box right">
                    <a href="${createLink(controller: 'basket', action: 'checkout')}" data-q="filters"
                       class="right  grn-btn icon-lock bbq">
                        <h3><g:message code="alerts.basket.button.checkOut"/></h3>
                    </a>
                </div>
            </div>

            <div class="clearfix"></div>
        </div>

        <div class="clear"></div>
        <hr>

        <div id="order-summ">
            <input type="hidden" id="stock_flag" value="0" name="stock_flag">

            <h2 class="ib"><g:message code="orderedItems"/></h2> <h4 class="ib">({{basketCounter}} <g:message
                code="alerts.compare.items.item"/>)</h4>
            <ul>
                <li ng-repeat="basketItem in basket">
                    <a href="${createLink(uri: '/product')}/{{basketItem.id}}">
                        <img src="<g:createLink controller="image"
                                                action="index"/>/{{basketItem.id}}?type=productModel&wh=50x50"/>
                    </a>

                    <div class="cart_details">
                        <h4>
                            <a href="${createLink(uri: '/product')}/{{basketItem.id}}">{{itemFirstLine(basketItem.name)}} {{itemSecondLine(basketItem.name)}}</a>
                        </h4>

                        <div class="total">
                            <h4><span class="price">{{basketItem.realPrice | number:0}}</span> <eshop:currencyLabel/>
                            </h4> X
                            <span>
                                <span ng-class="{dec:true , active: basketItem.count > 1 , inactive: basketItem.count <= 1}"
                                      ng-click="decreaseCount(basketItem.id)">-</span>
                                <input type="text" class="value" value="{{basketItem.count}}"
                                       onkeyup="updateBasketItemCount('{{basketItem.id}}', this.value)">
                                <span class="inc active" ng-click="increaseCount(basketItem.id)">+</span>
                            </span>
                            =
                            <h3 class="net"><span
                                    class="netTotal">{{basketItem.realPrice * basketItem.count | number:0}}</span> <eshop:currencyLabel/>
                            </h3>

                            <h3>
                            </h3></div>

                        <h6 style="color:red" class="mstock">
                        </h6>
                    </div>

                    <div class="close close_item" ng-click="removeFromBasket(basketItem.id)">x</div>
                </li>
            </ul>
        </div>


        <table id="gross">
            <tbody>
            <tr>
                <td class="you-pay"><g:message code="basket.items.price"/></td>
                <td class="pay-price"><b>{{calculateBasketTotalPrice() | number:0}} <eshop:currencyLabel/></b></td>
            </tr>
            </tbody></table>

        <div class="update_cart_ctas">

            <div class="proceed_btn_box">
                <a href="${createLink(controller: 'basket', action: 'checkout')}" data-q="filters"
                   class="full grn-btn icon-lock bbq"><h3><g:message code="alerts.basket.button.checkOut"/></h3></a>

            </div>
        </div>

        <div class="clear20"></div>

    </div>
</div>

