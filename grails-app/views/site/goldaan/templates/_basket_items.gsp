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

<div class="shopping-basket">
    <table>
        <tr>
            <th></th>
            <th class="small"><g:message code="orderItem.unitPrice"/>(<eshop:currencyLabel/>)</th>
            <th class="small"><g:message code="count"/></th>
            <th class="small"><g:message code="basket.totalPrice"/>(<eshop:currencyLabel/>)</th>
            <th class="small"><g:message code="basket.items.delete"/></th>
        </tr>
        <tr ng-repeat="basketItem in basket" class="basketItem">

            <td>
                <span class="image"><img
                        ng-src="{{contextRoot}}image/index/{{basketItem.id}}?type=productModel&wh=100x100"/>
                </span>
                <span class="name"><h3><a
                        ng-href="{{contextRoot}}site/product/{{basketItem.productId}}">
                    {{itemFirstLine(basketItem.name)}}<br/><span class="smaller">{{itemSecondLine(basketItem.name)}}</span>
                </a>
                </h3>
                    <span ng-repeat="addedValueName in basketItem.selectedAddedValueNames" class="addedValue">
                        <span class="plus">+</span> {{addedValueName}}
                    </span>
                </span>
                
                <div class="added-value-types-select pull-left">
                    <g:each in="${addedValueTypes}">
                        <div class="">
                            <a id="{{basketItem.id}}_${it.id}" href="#" onclick="showAddedValueDialog(this,${it.id},'{{basketItem.productId}}','{{basketItem.id}}')">
                                <img src="<g:createLink controller="image" params="[type:'addedValueType']" id="${it?.id}"/>" alt="">
                                ${it.title}${it.description?"(${it.description})":''}
                            </a>
                            %{--<button class="btn btn-info btn-mini">${it.title}</button>--}%
                        </div>
                    </g:each>
                </div>
                
                <div class="clearfix"></div>
            </td>
            <td colspan="4">
                <table>
                    <tr>
                        <td class="small"><span class="price"><b>{{basketItem.realPrice | number:0}}</b> </span></td>
                        <td class="small"><span class="count"><input type="text" value="{{basketItem.count}}" onkeyup="updateBasketItemCount('{{basketItem.id}}', this.value, updateDeliveryMethods)"/></span></td>
                        <td class="small"><span class="price"><b>{{basketItem.realPrice * basketItem.count | number:0}}</b></span></td>
                        <td class="small"><span class="delete"><a type="button" onclick="removeFromBasket('{{basketItem.id}}', updateDeliveryMethods)"><g:img dir="/images/" file="remove-basket-item.png"/></a></span></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <textarea name="description_{{basketItem.id}}" placeholder="<g:message code="description" />"></textarea>
                        </td>
                    </tr>
                </table>
            </td>

        </tr>
        <tr>
            <td>
                <div class="delivery-methods">
                    <span><g:message code="deliveryMethod" />:</span>
                    <span>
                        <g:each in="${deliveryMethods}">
                            <div class="delivery-method">
                                <label>
                                    <input type="radio" value="${it.id}" name="deliveryMethod" onchange="setDeliveryPrice(this, '${it}', ${it.sourceStations?.find()?.targetZones?.find()?.pricingRules?.find()?.netFactor}, ${it.hidePrice});">
                                    <img src="${createLink(controller: 'image', params: [id: it.id, type: 'deliveryMethod'])}"/>
                                    ${it.name} (${it.description})
                                </label>
                            </div>
                        </g:each>
                    </span>
                </div>
            </td>
        </tr>
    </table>
    <div class="basket-actions">
        <button class="btn btn-success" onclick="nextstep()"><g:message code="next-step" /></button>
    </div>
</div>