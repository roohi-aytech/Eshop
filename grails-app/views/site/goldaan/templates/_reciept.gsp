<div class="shopping-basket">

<table class="table-simulated buyer-info">
    %{--<tr>--}%
        %{--<td colspan="3" >--}%
            %{--<div class="buyer-info-header"><g:message code="basket.buyerinfo" /></div>--}%
        %{--</td>--}%
    %{--</tr>--}%
    <tr>
        <td><input id="buyerName" type="text" ng-model="buyerName" placeholder="<g:message code="buyer-name" />"/></td>
        %{--<td><input type="text" ng-model="buyerPhone" placeholder="<g:message code="buyer-phone" />"/></td>--}%
        %{--<td><input type="text" ng-model="buyerEmail" placeholder="<g:message code="buyer-email" />"/></td>--}%
        <td></td>
    </tr>
</table>

<table class="table table-striped table-bordered">
    <tr>
        <th class="small"><g:message code="index" /></th>
        <th class=""><g:message code="product.title" /></th>
        <th class="small"><g:message code="seller-goldaan"/></th>
        <th class="small"><g:message code="orderItem.unitPrice"/> (<eshop:currencyLabel/>)</th>
        <th class="small"><g:message code="count"/></th>
        <th class="small"><g:message code="basket.totalPrice"/> (<eshop:currencyLabel/>)</th>
    </tr>
    <tr ng-repeat="basketItem in basket" class="basketItemReceipt">
        <td class="small">{{$index+1}}</td>
        <td>
            <span class="name">
                {{itemFirstLine(basketItem.name)}}/<span class="smaller">{{itemSecondLine(basketItem.name)}}</span>
                <span ng-repeat="addedValueInstance in basketItem.selectedAddedValueInstances" class="addedValue">
                    <span class="plus"> +</span>{{addedValueInstance.title}}
                </span>
            </span>
        </td>
        <td class="small"><span class="smaller">{{itemThirdLine(basketItem.name)}}</span></td>
        <td class="small"><span class="price"><b>{{basketItem.realPrice | number:0}}</b> </span></td>
        <td class="small"><span class="count">{{basketItem.count}}</span></td>
        <td class="small"><span class="price"><b>{{basketItem.realPrice * basketItem.count | number:0}}</b></span></td>

    </tr>
    <tr>
        <td colspan="3">
            <input type="checkbox" ng-model="sendFactor"> <g:message code="sendFactorWith" />
        </td>
        <td colspan="3" >
            <div>
                <span class="reciept-price-label" ><g:message code="basket.totalPrice"/>:</span>
                <span class="totalPrice-reciept">{{calculateBasketTotalPrice() | number:0}}</span> <eshop:currencyLabel/>
            </div>
            <div ng-show="deliveryPrice > 0">
                <span class="reciept-price-label" ><g:message code="deliveryPrice"/>:</span>
                <span>
                    <b><span class="totalPrice-reciept">{{deliveryPrice | number:0}}</span></b> <eshop:currencyLabel/>
                </span>
            </div>
            <div ng-show="customerAccountValue > 0 && useGolBon">
                <span class="reciept-price-label" ><g:message code="basket.paycurgolbol"/>:</span>
                <span>
                    <b><span class="totalPrice-reciept">{{customerAccountValue | number:0}}-</span></b> <eshop:currencyLabel/>
                </span>
            </div>
            <div>
                <span class="reciept-price-label" ><g:message code="basket.totalPayablePrice"/>:</span>
                <span class="totalPrice-reciept">{{calculateBasketPayablePrice() | number:0}}</span> <eshop:currencyLabel/>
            </div>
    </tr>
</table>
    <div class="payment-type">
        <div>
            <div class="payment-type-title"><g:message code="payment.type" /></div>
            <span>
                <span class="payment-type-item"><input type="radio" ng-model="paymentType" value="online"> <g:img dir="images/goldaan" file="online.png"/> <b><g:message code="payment.types.online" /></b> (<g:message code="online-pay-info" />)</span>
                <span class="payment-type-item"><input type="radio" ng-model="paymentType" value="payInPlace"> <g:img dir="images/goldaan" file="money.png"/> <b><g:message code="payment.types.payInPlace" /></b> (<g:message code="money-pay-info" />)</span>
            </span>
        </div>
    </div>
    <div class="basket-actions">
        <button class="btn btn-primary" onclick="basketReview()"> <g:message code="prev-step" /></button>
        <button class="btn btn-success" onclick="updateBuyerAndPaymentTypeAndSendFactor()"> <g:message code="next-step" /></button>
    </div>
</div>