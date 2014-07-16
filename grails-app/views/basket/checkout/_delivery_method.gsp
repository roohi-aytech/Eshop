<script language="javascript" type="text/javascript">
    function setDeliveryPrice(element, price) {
        if (element.checked) {
            $('#price').val(price);
            var scope = angular.element(document.getElementById('main-container')).scope();
            scope.deliveryPrice = price;
            scope.$apply();
            $('.deliveryMethodList b').removeClass('selected');
            $(element).parent().next('td').next('td').find('b').addClass('selected');
        }
    }
    function setDeliveryPriceWithInsurance(element, price, priceWithInsurance) {
        if (element.checked) {
           $('#price').val(priceWithInsurance);

            var scope = angular.element(document.getElementById('main-container')).scope();
            scope.deliveryPrice = priceWithInsurance;
            scope.$apply();
        } else {
           $('#price').val(price);

            var scope = angular.element(document.getElementById('main-container')).scope();
            scope.deliveryPrice = price;
            scope.$apply();
        }
    }
</script>
<g:form controller="order" action="create" style="margin-bottom:0;">
    <g:hiddenField id="price" name="price"/>
    <ul class="deliveryMethodList">
        <g:each in="${deliveryMethods}" var="deliveryMethod" status="indexer">
            <g:if test="${indexer == 0}">
                <script language="javascript" type="text/javascript">
                    $('#price').val('${deliveryMethod.price}');
                </script>
            </g:if>
            <li>
                <table cellspacing="5" cellpadding="5">
                    <tr>
                        <td rowspan="3">
                            <input type="radio" id="deliverySourceStation${deliveryMethod.sourceStation?.id}"
                                   name="deliverySourceStation" ${indexer == 0 ? 'checked' : ''}
                                   value="${deliveryMethod.sourceStation?.id}" onchange="setDeliveryPrice(this, ${deliveryMethod.price});"/>
                            <g:if test="${indexer == 0}">
                                <script language="javascript" type="text/javascript">
                                    $(document).ready(function () {
                                        setDeliveryPrice(document.getElementById("deliverySourceStation${deliveryMethod.sourceStation?.id}"), ${deliveryMethod.price});
                                    });
                                </script>
                            </g:if>
                        </td>
                        <td rowspan="3">
                            <label for="deliverySourceStation${deliveryMethod.sourceStation?.id}">
                                <img src="${createLink(controller: 'image', params: [id: deliveryMethod.deliveryMethod.id, type: 'deliveryMethod'])}"/>
                            </label>
                        </td>
                        <td>
                            <label for="deliverySourceStation${deliveryMethod.sourceStation?.id}">
                                <b ${indexer == 0 ? 'class="selected"' : ''}>${deliveryMethod.deliveryMethod}</b>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <g:if test="${!deliveryMethod.deliveryMethod.insuranceIsRequired && deliveryMethod.deliveryMethod.insurancePercent > 0}">
                                <input type="checkbox" id="insurance${deliveryMethod.sourceStation?.id}"
                                       name="insurance${deliveryMethod.sourceStation?.id}"
                                       onchange="setDeliveryPriceWithInsurance(this, ${deliveryMethod.price}, ${deliveryMethod.priceWithInsurance});"/>
                                <label for="insurance${deliveryMethod.sourceStation?.id}">
                                    <g:message
                                            code="applyInsurance"/> (${deliveryMethod.deliveryMethod.insurancePercent}%)
                                </label>
                            </g:if>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="deliverySourceStation${deliveryMethod.sourceStation?.id}">
                                <g:message
                                        code="deliveryPrice"/>: ${(deliveryMethod.price) == 0 ? message(code: 'free') : formatNumber(number: deliveryMethod.price, type: 'number') + ' ' + eshop.currencyLabel()}
                            </label>
                        </td>
                    </tr>
                    %{--${deliveryMethod.sourceStation}--}%
                </table>
            </li>
        </g:each>
        <g:if test="${deliveryMethods.size == 0}">
            <g:message code="noDeliveryMethod"/>
        </g:if>
    </ul>
    <br/>

    <div>
        <g:if test="${deliveryMethods.size > 0}">
            <input type="submit" class="btn btn-primary" style="height:30px;"
                   value="<g:message code="enquiry.request.shopping.finalize"/>"/>
        </g:if>
    </div>
</g:form>