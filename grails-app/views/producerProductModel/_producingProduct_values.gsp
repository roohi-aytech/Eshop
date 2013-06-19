<%@ page import="eshop.Brand" %>
<table style="display:table;">
    <tr style="display: table-row">
        <td style="padding-left: 60px; display: table-cell" >

            <fieldset>
                <legend><g:message code="cooperationWay"/></legend>

                <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'volumeDescription', 'error')}" >
                    <label for="volumeDescription">
                        <g:message code="producingProduct.volume.label" default="Volume"/>

                    </label>
                    <g:checkBox name="volume" value="${producerProductModelInstance?.volume}"/>
                    <g:textField name="volumeDescription" value="${producerProductModelInstance?.volumeDescription}" class="count-words"/>
                    <script type="text/javascript">
                        $(function(){
                            $("#volume").change(function(){
                                if($(this).attr("checked"))
                                    $("#volumeDescription").removeAttr("disabled")
                                else
                                    $("#volumeDescription").attr("disabled","disabled")
                            })
                            if($("#volume").attr("checked"))
                                $("#volumeDescription").removeAttr("disabled")
                            else
                                $("#volumeDescription").attr("disabled","disabled")
                        })
                    </script>
                </div>
                <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'retailDescription', 'error')} "  >
                    <label for="retailDescription" >
                        <g:message code="producingProduct.retail.label" default="Retail"/>

                    </label>
                    <g:checkBox name="retail" value="${producerProductModelInstance?.retail}"/>
                    <g:textField name="retailDescription" value="${producerProductModelInstance?.retailDescription}" class="count-words"/>
                    <script type="text/javascript">
                        $(function(){
                            $("#retail").change(function(){
                                if($(this).attr("checked"))
                                    $("#retailDescription").removeAttr("disabled")
                                else
                                    $("#retailDescription").attr("disabled","disabled")
                            })
                            if($("#retail").attr("checked"))
                                $("#retailDescription").removeAttr("disabled")
                            else
                                $("#retailDescription").attr("disabled","disabled")
                        })
                    </script>
                </div>
            </fieldset>

            <fieldset>
                <legend><g:message code="price"/></legend>

                <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'priceType', 'error')} ">
                    <label for="priceType">
                        <g:message code="producingProduct.priceType.label" default="PriceType"/>

                    </label>
                    <g:select name="priceType" from="${producerProductModelInstance.constraints.priceType.inList}" value="${producerProductModelInstance?.priceType}"
                              valueMessagePrefix="producingProduct.priceType" noSelection="['': '']"/>

                    <g:textArea name="priceDescription"  value="${producerProductModelInstance.priceDescription}"/>
                </div>

                <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'discountType', 'error')} ">
                    <label for="discountType">
                        <g:message code="producingProduct.discountType.label" default="Type"/>

                    </label>
                    <g:select name="discountType" from="${producerProductModelInstance.constraints.discountType.inList}" value="${producerProductModelInstance?.discountType}"
                              valueMessagePrefix="producingProduct.discountType" noSelection="['': '']"/>

                    <g:textField  name="discount" value="${producerProductModelInstance.discount}"/>
                </div>

                <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'cooperationPrice', 'error')} ">
                    <label for="cooperationPrice">
                        <g:message code="producingProduct.cooperationPrice.label" default="cooperationPrice"/>
                    </label>
                    <g:textArea name="cooperationPrice" value="${producerProductModelInstance?.cooperationPrice}"/>

                </div>

            </fieldset>

        </td>

        <td style="display: table-cell">

            <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'settlement', 'error')} ">
                <label for="settlement">
                    <g:message code="producingProduct.settlement.label" default="Settlement"/>
                </label>
                <g:select id="settlement" name="settlement.id"
                          from="${eshop.Settlement.list()}"
                          optionKey="id"
                          value="${producerProductModelInstance?.settlement?.id}"
                          noSelection="[null: '']"/>

                <g:textArea name="settlementDescription" value="${producerProductModelInstance?.settlementDescription}"/>

                <input type="button" value="${message(code: "add")}" onclick="addSettlement()">

            </div>

            <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'refundable', 'error')} ">
                <label for="refundable">
                    <g:message code="producingProduct.refundable.label" default="Refundable"/>

                </label>
                <g:select name="refundable" from="${producerProductModelInstance.constraints.refundable.inList}" value="${producerProductModelInstance?.refundable}"
                          valueMessagePrefix="producingProduct.refundable" noSelection="['': '']"/>
                <g:textField name="refundableDescription" value="${producerProductModelInstance?.refundableDescription}"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'testPeriod', 'error')} ">
                <label for="testPeriod">
                    <g:message code="producingProduct.testPeriod.label" default="TestPriod"/>

                </label>
                <g:select name="testPeriod" from="${producerProductModelInstance.constraints.testPeriod.inList}" value="${producerProductModelInstance?.testPeriod}"
                          valueMessagePrefix="producingProduct.testPeriod" noSelection="['': '']"/>
                <g:textField name="testPeriodDescription" value="${producerProductModelInstance?.testPeriodDescription}"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'deliveryPlace', 'error')} ">
                <label for="deliveryPlace">
                    <g:message code="producingProduct.deliveryPlace.label" default="DeliveryPlace"/>

                </label>
                <g:textField name="deliveryPlace" value="${producerProductModelInstance?.deliveryPlace}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'transportationCost', 'error')} ">
                <label for="transportationCost">
                    <g:message code="producingProduct.transportationCost.label" default="TransportationCost"/>
                </label>
                <g:textField  name="transportationCost"
                              value="${producerProductModelInstance.transportationCost}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'addedValue', 'error')} ">
                <label for="addedValue">
                    <g:message code="producingProduct.addedValue.label" default="addedValue"/>
                </label>
                <g:select name="addedValue" from="${producerProductModelInstance.constraints.addedValue.inList}" value="${producerProductModelInstance?.addedValue}"
                          valueMessagePrefix="producingProduct.addedValue" noSelection="['': '']"/>

                <g:field id="addedValueDescription" type="number" name="addedValueDescription" step="any" value="${producerProductModelInstance?.addedValueDescription}" />

            </div>


        </td>
    </tr>
</table>



