<div class="btn-group pull-left topNavigationItem link-basket"
     id="link-basket-empty" ng-show="!basket.length">

    <span><g:message code="basket.empty"/></span>

    <common:link class="btn-shop" controller="basket" action="checkout" https="${false}">
        <g:message code="basket.show"/>
    </common:link>
</div>

<div class="btn-group pull-left topNavigationItem link-basket full"
     id="link-basket" ng-show="basket.length">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#"
       original-title="${message(code: "basket")}">
        <span id="basketCounter" class="counter">{{basketCounter}} <g:message
                code="basket.product"/> {{calculateBasketTotalPrice() | number:0}} <g:message code="rial"/></span>
    </a>

    <div id="basketItems" class="dropdown-menu content">
        <div class="inner-content">
            <ul class="scrollable">
                <li ng-repeat="basketItem in basket">
                    <span class="basket-item-image">
                        <img src="<g:createLink controller="image"
                                                action="index"/>/{{basketItem.id}}?type=productModel&wh=50x50"/>
                    </span>
                    <span class="basket-item-count">
                        <g:message code="basket-items-count"></g:message><br/>
                        <input type="text" value="{{basketItem.count}}" onkeyup="updateBasketItemCount('{{basketItem.id}}', this.value)"/>
                    </span>
                    <span class="basket-item-title">
                        {{basketItem.name}}<br/>
                        <span>{{basketItem.realPrice | number:0}} <g:message code="rial"/>
                            <br/>
                            <a ng-click="removeFromBasket(basketItem.id)" class="removeBasketItem"><g:message
                                    code="basket.items.delete"></g:message></a>
                        </span>
                    </span>
                </li>
                <li ng-show="!basket.length"><g:message code="basket.empty"></g:message></li>
            </ul>

            <div class="spacer"></div>
            <div class="total">
                <div>
                    <span>{{basketCounter}}</span>
                    <label><g:message code="basket.items.count"/></label>
                    <span>{{calculateBasketTotalPrice() | number:0}} <g:message code="rial"/></span>
                    <label><g:message code="basket.items.price"/></label>
                </div>
            </div>
        </div>
    </div>

    <script>
            $(document).on('click', '#basketItems', function (e) {
                $(this).parent().addClass('open');
                e.stopPropagation();
                return false;
            });
    </script>


    <common:link class="btn-shop" controller="basket" action="checkout" https="${false}">
        <g:message code="basket.show"/>
    </common:link>
</div>
