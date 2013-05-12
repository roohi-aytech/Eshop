
<div style="display:table;">
    <div style="display: table-row">
        <div style="padding-left: 60px; display: table-cell" >
            <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'discountType', 'error')} ">
                <label for="discountType">
                    <g:message code="producingProduct.discountType.label" default="Type"/>

                </label>
                <g:select name="discountType" from="${producerProductModelInstance.constraints.discountType.inList}"
                          value="${producerProductModelInstance?.discountType}"
                          valueMessagePrefix="producingProduct.discountType" noSelection="['': '']"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'discount', 'error')} ">
                <label for="discount">
                    <g:message code="producingProduct.discount.label" default="Discount"/>
                </label>
                <g:field type="number" style="direction: ltr;" name="discount" step="any" required=""
                         value="${producerProductModelInstance?.discount}" />
            </div>


            <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'settlement', 'error')} ">
                <label for="settlement">
                    <g:message code="producingProduct.settlement.label" default="Settlement"/>
                </label>
                <rg:autocomplete domainClass="eshop.Settlement" id="settlement" like="true" value="${producerProductModelInstance?.settlement?.id}" display="${producerProductModelInstance?.settlement}"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'settlementDescription', 'error')} ">

                <g:textArea name="settlementDescription" value="${producerProductModelInstance?.settlementDescription}"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'deliveryPlace', 'error')} ">
                <label for="deliveryPlace">
                    <g:message code="producingProduct.deliveryPlace.label" default="DeliveryPlace"/>

                </label>
                <g:textField name="deliveryPlace" value="${producerProductModelInstance?.deliveryPlace}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'refundable', 'error')} ">
                <label for="refundable">
                    <g:message code="producingProduct.refundable.label" default="Refundable"/>

                </label>
                <g:select name="refundable" from="${producerProductModelInstance.constraints.refundable.inList}" value="${producerProductModelInstance?.refundable}"
                          valueMessagePrefix="producingProduct.refundable" noSelection="['': '']"/>
                <g:textField name="refundableDescription" value="${producerProductModelInstance?.refundableDescription}"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'volumeDescription', 'error')}"  style="display: inline-block;">
                <label for="volumeDescription">
                    <g:message code="producingProduct.volume.label" default="Volume"/>

                </label>
                <g:checkBox name="volume" value="${producerProductModelInstance?.volume}"/>
                <g:textField name="volumeDescription" value="${producerProductModelInstance?.volumeDescription}" class="count-words"/>
                <script type="text/javascript">
                    $(function(){
                        $("#volume").change(function(){
                            if($(this).attr("checked"))
                                $("#volumeDescription").removeAttr("disabled");
                            else
                                $("#volumeDescription").attr("disabled","disabled");
                        });
                        if($("#volume").attr("checked"))
                            $("#volumeDescription").removeAttr("disabled");
                        else
                            $("#volumeDescription").attr("disabled","disabled");
                    });
                </script>
            </div>


        </div>
        <div style="display: table-cell">

           <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'retailDescription', 'error')} "  style="display: inline-block;" >
            <label for="retailDescription" >
                <g:message code="producingProduct.retail.label" default="Retail"/>

            </label>
            <g:checkBox name="retail" value="${producerProductModelInstance?.retail}"/>
            <g:textField name="retailDescription" value="${producerProductModelInstance?.retailDescription}" class="count-words"/>
            <script type="text/javascript">
                $(function(){
                    $("#retail").change(function(){
                        if($(this).attr("checked"))
                            $("#retailDescription").removeAttr("disabled");
                        else
                            $("#retailDescription").attr("disabled","disabled");
                    });
                    if($("#retail").attr("checked"))
                        $("#retailDescription").removeAttr("disabled");
                    else
                        $("#retailDescription").attr("disabled","disabled");
                });
            </script>
        </div>

        <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'priceType', 'error')} ">
            <label for="priceType">
                <g:message code="producingProduct.priceType.label" default="PriceType"/>

            </label>
            <g:select name="priceType" from="${producerProductModelInstance.constraints.priceType.inList}" value="${producerProductModelInstance?.priceType}"
                      valueMessagePrefix="producingProduct.priceType" noSelection="['': '']"/>


        </div>

        <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'priceDescription', 'error')} ">

            <g:textArea name="priceDescription" value="${producerProductModelInstance.priceDescription}"/>

        </div>

        <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'cooperationPrice', 'error')} ">
            <label for="cooperationPrice">
                <g:message code="producingProduct.cooperationPrice.label" default="cooperationPrice"/>
            </label>
            <g:field type="number" style="direction: ltr;" name="cooperationPrice" step="any" required=""
                     value="${producerProductModelInstance.cooperationPrice}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'testPeriod', 'error')} ">
            <label for="testPeriod">
                <g:message code="producingProduct.testPeriod.label" default="testPeriod"/>
            </label>
            <g:field type="number" style="direction: ltr;" name="testPeriod" step="any" required=""
                     value="${producerProductModelInstance.testPeriod}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'addedValue', 'error')} ">
            <label for="addedValue">
                <g:message code="producingProduct.addedValue.label" default="addedValue"/>
            </label>
            <g:field type="number" style="direction: ltr;" name="addedValue" step="any" required=""
                     value="${producerProductModelInstance.addedValue}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'transportationCost', 'error')} ">
            <label for="transportationCost">
                <g:message code="producingProduct.transportationCost.label" default="TransportationCost"/>
            </label>
            <g:field type="number" style="direction: ltr;" name="transportationCost" step="any" required=""
                     value="${producerProductModelInstance.transportationCost}"/>
        </div>


</div>
