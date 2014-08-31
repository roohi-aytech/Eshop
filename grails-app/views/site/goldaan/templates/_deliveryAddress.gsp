<div class="shopping-basket">
    <script type="application/javascript">
        var deliveryAddresses=${(prevAddresses?:[]) as grails.converters.JSON}
        var cities=${eshop.City.list() as grails.converters.JSON}
    </script>
    <div class="text-center">
        <h4><g:message code="plese-enter-delivery-info"/></h4>
    </div>
    <table class="table-simulated">
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="radio" ng-model="callBeforeSend" value="true">
                <g:message code="call-before-send"/>
                <br/>
                <input type="radio" ng-model="callBeforeSend" value="false">
                <g:message code="send-surprise"/>
                <br/>
                <br/>
            </td>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
        <tr>
            <td>
                <g:message code="delivery-time"/>
            </td>
            <td>

                <rg:datePicker angular="true" minuteRange="${[0,15,30,45]}" hourRange="${(8..22)}" hm="true" name="deliveryDate"/>
            </td>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
        <tr>
            <td class="vertical-align-top">
                <g:select name="prevAddress" from="${prevAddresses}"
                          optionKey="id" optionValue="title" noSelection="['':message(code:'newAddress')]"
                          ng-model="deliveryAddress" />
                <script type="application/javascript">
                $('#prevAddress').change(function(){
                    updateDeliveryAddressesJs(this.value)
                })
                </script>
                %{--<g:each in="${prevAddresses}">--}%
                    %{--<div>--}%
                        %{--<input type="radio" ng-model="deliveryAddress" onclick="updateDeliveryAddressesJs(${it.id})" value="${it.id}"/>--}%
                        %{--${it.title}--}%
                    %{--</div>--}%
                %{--</g:each>--}%
                %{--<input name="deliveryAddress" type="radio" ng-model="deliveryAddress" value="" onclick="updateDeliveryAddressesJs()" />--}%

            </td>
            <td class="vertical-align-top">
                <div class="delivery-address">
                    <input id="deliveryName" type="text" ng-model="deliveryName" placeholder="<g:message code="delivery-person" />">
                    <input id="deliveryPhone" type="text" ng-model="deliveryPhone" placeholder="<g:message code="delivery-phone" />">
                    <br/>
                    %{--<select ng-model="deliveryCity" ng-options="item.id as item.title for item in cities">--}%
                        %{--<option value=""><g:message code="city" /></option>--}%
                    %{--</select>--}%
                    <textarea id="deliveryAddressLine" ng-model="deliveryAddressLine" placeholder="<g:message code="delivery-address" />"></textarea>
                </div>
            </td>
        </tr>
    </table>
    <br>
    <div class="alert alert-warning">
        <g:message code="delivery-alert"/>
    </div>
    <g:set var="nextStep" value="${message(code:'next-step')}"/>
    <sec:ifLoggedIn>
        <g:set var="submitForm" value="finalizeBasket(this);"/>
        <g:set var="nextStep" value="${message(code:'alerts.basket.button.checkOut')}"/>
    </sec:ifLoggedIn>
    <div class="basket-actions">
        <button class="btn btn-primary" onclick="factorReview()"><g:message code="prev-step" /></button>
        <button class="btn btn-success" onclick="if(updateDeliveryInfo()){${submitForm}}">${nextStep}</button>
    </div>
</div>
