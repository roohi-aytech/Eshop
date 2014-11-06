<script language="javascript" type="text/javascript">
    function setDeliveryPrice(element, name, price, hidePrice) {
        if (element.checked) {
            if (hidePrice) {
                $('#price').val(price);

                var scope = angular.element(document.body).scope();
                scope.deliveryPrice = name;
                scope.$apply();
            }
            else {
                $('#price').val(price);
                var scope = angular.element(document.body).scope();
                scope.deliveryPrice = price;
                scope.$apply();
                $('.deliveryMethodList b').removeClass('selected');
                $(element).parent().next('td').next('td').find('b').addClass('selected');
            }
            $('.deliveryMethodList li').removeClass('selected');
            $(element).parent().addClass('selected');
        }
    }
    function setDeliveryPriceWithInsurance(element, name, price, priceWithInsurance, hidePrice) {
        if (hidePrice) {
            $('#price').val(price);

            var scope = angular.element(document.body).scope();
            scope.deliveryPrice = name;
            scope.$apply();
            $('.deliveryMethodList li').removeClass('selected');
            $(element).parent().addClass('selected');
        }
        else {
            if (element.checked) {
                $('#price').val(priceWithInsurance);

                var scope = angular.element(document.body).scope();
                scope.deliveryPrice = priceWithInsurance;
                scope.$apply();
                $('.deliveryMethodList li').removeClass('selected');
                $(element).parent().addClass('selected');
            } else {
                $('#price').val(price);

                var scope = angular.element(document.body).scope();
                scope.deliveryPrice = price;
                scope.$apply();
            }
        }
    }
</script>
<div style="padding-bottom: 10px;margin-bottom: 10px;border-bottom: 1px dashed #dddddd;padding-top:10px;">
<g:message code="deliveryMethod.help"/>
</div>
<g:form controller="order" action="create" style="margin-bottom:0;">
    <div id="no-sign-in">
        <g:hiddenField id="price" name="price"/>
        <ul class="deliveryMethodList">
            <g:each in="${deliveryMethods}" var="deliveryMethod" status="indexer">
                <g:if test="${indexer == 0}">
                    <script language="javascript" type="text/javascript">
                        $('#price').val('${deliveryMethod.price}');
                    </script>
                </g:if>
                <li>
                    <input type="radio" id="deliverySourceStation${deliveryMethod.sourceStation?.id}"
                           name="deliverySourceStation" ${indexer == 0 ? 'checked' : ''}
                           value="${deliveryMethod.sourceStation?.id}"
                           onchange="setDeliveryPrice(this, '${deliveryMethod.deliveryMethod}', ${deliveryMethod.price}, ${deliveryMethod.hidePrice});"/>
                    %{--<label for="deliverySourceStation${deliveryMethod.sourceStation?.id}">--}%
                        %{--<img src="${createLink(controller: 'image', params: [id: deliveryMethod.deliveryMethod.id, type: 'deliveryMethod'])}"/>--}%
                    %{--</label>--}%
                    <label for="deliverySourceStation${deliveryMethod.sourceStation?.id}" style="color:black;">
                        <b ${indexer == 0 ? 'class="selected"' : ''}>${deliveryMethod.deliveryMethod}</b>
                    </label>
                    <br/>
                    <g:if test="${!deliveryMethod.deliveryMethod.insuranceIsRequired && deliveryMethod.deliveryMethod.insurancePercent > 0}">
                        <input type="checkbox" id="insurance${deliveryMethod.sourceStation?.id}"
                               name="insurance${deliveryMethod.sourceStation?.id}"
                               onchange="setDeliveryPriceWithInsurance(this, '${deliveryMethod.deliveryMethod}', ${deliveryMethod.price}, ${deliveryMethod.priceWithInsurance}, ${deliveryMethod.hidePrice});"/>
                        <label for="insurance${deliveryMethod.sourceStation?.id}">
                            <g:message
                                    code="applyInsurance"/> (${deliveryMethod.deliveryMethod.insurancePercent}%)
                        </label>
                    </g:if>
                    <label ${deliveryMethod.hidePrice ? "style='display:none;'" : ''}
                            for="deliverySourceStation${deliveryMethod.sourceStation?.id}">
                        <g:message
                                code="deliveryPrice"/>: ${(deliveryMethod.price) == 0 ? message(code: 'free') : formatNumber(number: deliveryMethod.price, type: 'number') + ' ' + eshop.currencyLabel()}
                    </label>
                    <g:if test="${indexer == 0}">
                        <script language="javascript" type="text/javascript">
                            $(document).ready(function () {
                                setDeliveryPrice(document.getElementById("deliverySourceStation${deliveryMethod.sourceStation?.id}"), '${deliveryMethod.deliveryMethod}', ${deliveryMethod.price}, ${deliveryMethod.hidePrice});
                            });
                        </script>
                    </g:if>
                </li>
            </g:each>
            <g:if test="${deliveryMethods.size == 0}">
                <g:message code="noDeliveryMethod"/>
            </g:if>
        </ul>
        <g:if test="${deliveryMethods.size > 0}">
            <input type="submit" class="grn-btn"
                   value="<g:message code="enquiry.request.shopping.finalize"/>"/>
        </g:if>
    </div>
</g:form>

<div class="clear20"></div>