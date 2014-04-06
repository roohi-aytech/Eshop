

<div class="btn-group pull-left topNavigationItem link-basket ng-cloak"
     id="link-basket-empty" ng-show="!basket.length">

    <span><g:message code="basket.empty"/></span>
</div>

<div class="btn-group pull-left topNavigationItem link-basket full ng-cloak"
     id="link-basket" ng-show="basket.length">
    <common:link class="dropdown-toggle" data-toggle="dropdown" href="#"
                 original-title="${message(code: "basket")}" controller="basket" action="checkout" https="${false}">
        <span id="basketCounter" class="counter">{{basketCounter}} <g:message
                code="basket.product"/> {{calculateBasketTotalPrice() | number:0}} <g:message code="rial"/></span>
    </common:link>
</div>


<div id="basketItems" class="hidden">
    <div class="inner-content product_container">
        <div ng-class="{product_block:true,last:$index%2==1}" class="product-block"
             ng-repeat="basketItem in visibleItems()">
            <div class="min_car_img">
                <a class="min_cart" href="${createLink(uri: '/product')}/{{basketItem.id}}">
                    <img width="60" height="66"
                         src="<g:createLink controller="image"
                                            action="index"/>/{{basketItem.id}}?type=productModel&wh=50x50"/>
                </a>
            </div>

            <div class="min_car_pro_detail">
                <p>
                    <a href="${createLink(uri: '/product')}/{{basketItem.id}}">
                        {{itemFirstLine(basketItem.name)}} {{itemSecondLine(basketItem.name)}}
                    </a>
                </p>

                <p>
                    <g:message code="price"/> : {{basketItem.realPrice | number:0}} <g:message code="rial"/>
                </p>

                <p>
                    <g:message code="basket-items-count"/> :
                    <input type="text" value="{{basketItem.count}}"
                           onkeyup="updateBasketItemCount('{{basketItem.id}}', this.value)"/>
                    <a class="delete" title="<g:message code="basket.items.delete"/>"
                       ng-click="removeFromBasket(basketItem.id)"></a>
                </p>
            </div>
        </div>
        %{--<span class="basket-item-image">--}%
        %{--<img src="<g:createLink controller="image"--}%
        %{--action="index"/>/{{basketItem.id}}?type=productModel&wh=50x50"/>--}%
        %{--</span>--}%
        %{--<span class="basket-item-count">--}%
        %{--<g:message code="basket-items-count"/><br/>--}%
        %{--<input type="text" value="{{basketItem.count}}"--}%
        %{--onkeyup="updateBasketItemCount('{{basketItem.id}}', this.value)"/>--}%
        %{--</span>--}%
        %{--<span class="basket-item-title">--}%
        %{--{{basketItem.name}}<br/>--}%
        %{--<span>{{basketItem.realPrice | number:0}} <g:message code="rial"/>--}%
        %{--<br/>--}%
        %{--<a ng-click="removeFromBasket(basketItem.id)" class="removeBasketItem"><g:message--}%
        %{--code="basket.items.delete"/></a>--}%
        %{--</span>--}%
        %{--</span>--}%
        %{--</li>--}%
        %{--<li ng-show="!basket.length"><g:message code="basket.empty"/></li>--}%
        %{--</ul>--}%

        <div class="clearfix"></div>

        <div class="price_block extra_item" ng-show="basket.length > 4">
            <p>
                <common:link href="#" controller="basket" action="checkout" https="${false}">
                    <g:message code="basket.items.extraItems.part1"/>
                    {{invisibleItemsCount()}}
                    <g:message code="basket.items.extraItems.part2"/>
                </common:link>
            </p>

            <div class="clearfix"></div>
        </div>

        <div class="clearfix"></div>

        <div class="price_block">
            <p><g:message code="basket.items.price"/> {{calculateBasketTotalPrice() | number:0}} <g:message
                    code="rial"/></p>
            <common:link class="button checkout_button" href="#" controller="basket" action="checkout" https="${false}">
                <span><g:message code="alerts.basket.button.checkOut"/></span>
            </common:link>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<script language="javascript" type="text/javascript">
    $.fn.qtip.zindex = 999999999;
    $('.link-basket.full').qtip({
        id: 'basketItemsList',
        content: {
            text: $('#basketItems')
        },
        style: {
            classes: 'qtip-bootstrap'//,
//            width: 550
        },
        position: {
            my: 'top left',
            at: 'bottom left'
        },
        show: {
            effect: function (offset) {
                $(this).slideDown(100);
            }
        },
        hide: {
            fixed: true,
            delay: 1000
        },
        metadata: {
            type: 'html5'
        }
    });
</script>
