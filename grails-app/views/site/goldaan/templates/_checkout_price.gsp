<table>
    <tr>
        <td><g:message code="basket.totalPrice"/></td>
        <td><span class="totalPrice">{{calculateBasketTotalPrice() | number:0}}</span> <eshop:currencyLabel/></td>
    </tr>
    <tr>
        <td><g:message code="deliveryPrice"/></td>
        <td>
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
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <div class="price-sep"></div>
        </td>
    </tr>
    <tr>
        <td><g:message code="basket.totalPayablePrice"/></td>
        <td>
            <span class="totalPrice">{{calculateBasketPayablePrice() | number:0}} <eshop:currencyLabel/></span>
        </td>
    </tr>
</table>
