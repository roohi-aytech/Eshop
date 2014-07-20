<script language="javascript" type="text/javascript">

    $(".shopping-basket").accordion({
        heightStyle: "content"
    });

    function updateDeliveryMethods() {

        <g:if test="${currentStep >= 4}">
        $('#delivery-methods-container').html('<img class="loading" src="${resource(dir: 'images', file: 'loading.gif')}"/> ${message(code: 'waiting')}').load('${createLink(controller: 'basket', action: 'deliveryMethods')}', function () {
        });
        </g:if>
    }

</script>

<div class="shopping-basket accordion" style="margin-bottom: 20px;">
    <h3><span style="background: rgb(9, 76, 127)"><g:message code="basket.content"/></span></h3>

    <div>
        <ul>
            <li ng-repeat="basketItem in basket" class="basketItem">
                <span class="image"><img
                        ng-src="{{contextRoot}}site/image/{{basketItem.id}}?type=productModel&wh=100x100"/>
                </span>
                <span class="name"><h3 style="display: inline-block"><a
                        ng-href="{{contextRoot}}site/product/{{basketItem.productId}}">
                    {{itemFirstLine(basketItem.name)}}<br/>{{itemSecondLine(basketItem.name)}}
                </a>
                </h3>
                    <span ng-repeat="addedValueName in basketItem.selectedAddedValueNames" class="addedValue">
                        <span class="plus">+</span> {{addedValueName}}
                    </span>
                </span>
                <span class="price"><g:message
                        code="orderItem.unitPrice"/>: <b>{{basketItem.realPrice | number:0}}</b> <eshop:currencyLabel/></span>
                <span class="count"><g:message code="count"></g:message>: <input type="text"
                                                                                 value="{{basketItem.count}}"
                                                                                 onkeyup="updateBasketItemCount('{{basketItem.id}}', this.value, updateDeliveryMethods)"/>
                </span>
                <span class="delete">[ <a type="button"
                                          onclick="removeFromBasket('{{basketItem.id}}', updateDeliveryMethods)"><g:message
                            code="basket.items.delete"/></a> ]</span>
                <hr/>
                <span class="price"><g:message
                        code="basket.totalPrice"/>: <b>{{basketItem.realPrice * basketItem.count | number:0}}</b> <eshop:currencyLabel/></span>

                <div class="clearfix"></div>
            </li>
        </ul>
    </div>
</div>


<div class="check-out-price">
    <g:message code="basket.totalPrice"></g:message>: <b><span
        class="totalPrice">{{calculateBasketTotalPrice() | number:0}}</span></b> <eshop:currencyLabel/>
</div>

<div class="check-out-price" ng-if="deliveryPrice == -1">
    <g:message code="deliveryPrice"></g:message>:
    <span ng-switch on="deliveryPrice">
        <span ng-switch-when="-1"><g:message code="deliveryMethod.notSelected"/></span>
        <span ng-switch-when="0"><b><g:message code="free"/></b></span>
        <span ng-switch-default>
            <span ng-show="deliveryPrice > -1">
            <b><span class="totalPrice">{{deliveryPrice | number:0}}</span></b> <eshop:currencyLabel/>
            </span>
            <span ng-hide="deliveryPrice > -1">
                <b><span class="totalPrice">{{deliveryPrice}}</span></b>
            </span>
        </span>
    </span>
</div>

<h2 class="check-out-price">
    <g:message code="basket.totalPayablePrice"></g:message>: <span
        class="totalPrice">{{calculateBasketPayablePrice() | number:0}} <eshop:currencyLabel/></span>
</h2>
