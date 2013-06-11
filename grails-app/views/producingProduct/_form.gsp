<%@ page import="eshop.Brand; eshop.Guarantee; eshop.ProducingProduct" %>
<g:hasErrors bean="${producingProductInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${producingProductInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<script type="text/javascript">
    function addBrand(){
        loadOverlay('<g:createLink controller="brand" action="form"/>',
                '<g:createLink controller="brand" action="save"/>',
                function(r){
                    $("#brand").val(r.name)
                    $("#brand.id").val(r.id)
                })
    }
    function addGuarantee(){
        loadOverlay('<g:createLink controller="guarantee" action="form"/>',
                '<g:createLink controller="guarantee" action="save"/>',
                function(r){
                    $("#guarantee").val(r.name)
                    $("#guarantee.id").val(r.id)
                })
    }

    function addSettlement(){
        loadOverlay('<g:createLink controller="settlement" action="form"/>',
                '<g:createLink controller="settlement" action="save"/>',
                function(r){
                    $("#settlement").val(r.name)
                    $("#settlement.id").val(r.id)
                })
    }


    function brandChanged(brand){
        var size = $(document.getElementsByName("productTypes")).size()
        var productTypesArr = []
        for( var i = 0; i < size ; i++ )
            productTypesArr[i] = ($(document.getElementsByName("productTypes")[i]).val())


        $.ajax({
            url:'<g:createLink action="loadGuarantee" controller="producingProduct"/>',
            data:{
                brand : brand.val(),
                productTypes: productTypesArr,
                producingProductInstance: '${producingProductInstance?.id}'
            },
            type:'post'
        }).done(function(response){
                    $('#guaranteeTemplate').html(response);
                });

    }

    function onProductTypeSelect(param){
        $.ajax({
            url: "${createLink(controller: "producingProduct", action: "loadGuarantee")}",

            type: "post",

            data: {productTypes: param, brand: $('#brandId').val(),  producingProductInstance: '${producingProductInstance?.id}'}
        }).done(function(response){
                    $('#guaranteeTemplate').html(response);
                });
    }


</script>

<g:hiddenField name="id" value="${producingProductInstance?.id}" />
<g:hiddenField name="version" value="${producingProductInstance?.version}" />
<g:hiddenField name="producer.id" value="${producerId}"/>

<div style="display:table;">
<div style="display: table-row">
<div style="padding-left: 60px; display: table-cell" >

    <div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'productTypes', 'error')} ">
        <label >
            <g:message code="producingProduct.productTypes.label" default="Product Types"/>
        </label>

        <rg:tree bean="${producingProductInstance}" field="productTypes" onChange="onProductTypeSelect"  cascadeCheck="true" relationField="parentProduct" width="250px"></rg:tree>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'brand', 'error')} ">
        <label for="brandId">
            <g:message code="producingProduct.brand.label" default="Brand"/>
        </label>

        <g:select id="brandId" name="brand.id"
                  from="${Brand.list()}"
                  optionKey="id"
                  value="${producingProductInstance?.brand?.id}"
                  noSelection="['' : '']"
                  onchange="brandChanged(\$(this))"/>
    </div>

    <fieldset>
        <legend><g:message code="cooperationWay"/></legend>

        <div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'volumeDescription', 'error')}" >
            <label for="volumeDescription">
                <g:message code="producingProduct.volume.label" default="Volume"/>

            </label>
            <g:checkBox name="volume" value="${producingProductInstance?.volume}"/>
            <g:textField name="volumeDescription" value="${producingProductInstance?.volumeDescription}" class="count-words"/>
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
        <div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'retailDescription', 'error')} "  >
            <label for="retailDescription" >
                <g:message code="producingProduct.retail.label" default="Retail"/>

            </label>
            <g:checkBox name="retail" value="${producingProductInstance?.retail}"/>
            <g:textField name="retailDescription" value="${producingProductInstance?.retailDescription}" class="count-words"/>
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

        <div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'priceType', 'error')} ">
            <label for="priceType">
                <g:message code="producingProduct.priceType.label" default="PriceType"/>

            </label>
            <g:select name="priceType" from="${producingProductInstance.constraints.priceType.inList}" value="${producingProductInstance?.priceType}"
                      valueMessagePrefix="producingProduct.priceType" noSelection="['': '']"/>

            <g:textArea name="priceDescription"  value="${producingProductInstance.priceDescription}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'discountType', 'error')} ">
            <label for="discountType">
                <g:message code="producingProduct.discountType.label" default="Type"/>

            </label>
            <g:select name="discountType" from="${producingProductInstance.constraints.discountType.inList}" value="${producingProductInstance?.discountType}"
                      valueMessagePrefix="producingProduct.discountType" noSelection="['': '']"/>

            <g:textField  name="discount" value="${producingProductInstance.discount}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'cooperationPrice', 'error')} ">
            <label for="cooperationPrice">
                <g:message code="producingProduct.cooperationPrice.label" default="cooperationPrice"/>
            </label>
            <g:textArea name="cooperationPrice" value="${producingProductInstance?.cooperationPrice}"/>

        </div>

    </fieldset>

</div>

<div style="display: table-cell">

    <div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'settlement', 'error')} ">
        <label for="settlement">
            <g:message code="producingProduct.settlement.label" default="Settlement"/>
        </label>
        <g:select id="settlement" name="settlement.id"
                  from="${eshop.Settlement.list()}"
                  optionKey="id"
                  value="${producingProductInstance?.settlement?.id}"
                  noSelection="[null: '']"/>

        <g:textArea name="settlementDescription" value="${producingProductInstance?.settlementDescription}"/>

        <input type="button" value="${message(code: "add")}" onclick="addSettlement()">

    </div>

    <div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'refundable', 'error')} ">
        <label for="refundable">
            <g:message code="producingProduct.refundable.label" default="Refundable"/>

        </label>
        <g:select name="refundable" from="${producingProductInstance.constraints.refundable.inList}" value="${producingProductInstance?.refundable}"
                  valueMessagePrefix="producingProduct.refundable" noSelection="['': '']"/>
        <g:textField name="refundableDescription" value="${producingProductInstance?.refundableDescription}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'testPeriod', 'error')} ">
        <label for="testPeriod">
            <g:message code="producingProduct.testPeriod.label" default="TestPriod"/>

        </label>
        <g:select name="testPeriod" from="${producingProductInstance.constraints.testPeriod.inList}" value="${producingProductInstance?.testPeriod}"
                  valueMessagePrefix="producingProduct.testPeriod" noSelection="['': '']"/>
        <g:textField name="testPeriodDescription" value="${producingProductInstance?.testPeriodDescription}"/>

    </div>

    <script type="text/javascript" language="javascript">

        //                $(document).ready(brandChanged($('#brandId')))
        //                 setTimeout("brandChanged($('#brandId'))" ,50000)

    </script>


    <span class="guarantee" id="guaranteeTemplate" >

        <g:render template="guarantee_value" model="[
                producingProductInstance: producingProductInstance,
                brand: producingProductInstance?.brand
        ]"/>

    </span>


    %{--<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'guarantee', 'error')} ">--}%
    %{--<label for="guarantee">--}%
    %{--<g:message code="guarantee.label" default="Guarantee"/>--}%
    %{--</label>--}%

    %{--<g:select id="guarantee" name="guarantee.id"--}%
    %{--from="${eshop.Guarantee.list()}"--}%
    %{--optionKey="id"--}%
    %{--value="${producingProductInstance?.guarantee?.id}"--}%
    %{--noSelection="[null: '']"/>--}%


    %{--</div>--}%


    <div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'deliveryPlace', 'error')} ">
        <label for="deliveryPlace">
            <g:message code="producingProduct.deliveryPlace.label" default="DeliveryPlace"/>

        </label>
        <g:textField name="deliveryPlace" value="${producingProductInstance?.deliveryPlace}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'transportationCost', 'error')} ">
        <label for="transportationCost">
            <g:message code="producingProduct.transportationCost.label" default="TransportationCost"/>
        </label>
        <g:textField  name="transportationCost"
                      value="${producingProductInstance.transportationCost}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'addedValue', 'error')} ">
        <label for="addedValue">
            <g:message code="producingProduct.addedValue.label" default="addedValue"/>
        </label>
        <g:select name="addedValue" from="${producingProductInstance.constraints.addedValue.inList}" value="${producingProductInstance?.addedValue}"
                  valueMessagePrefix="producingProduct.addedValue" noSelection="['': '']"/>

        <g:field id="addedValueDescription" type="number" name="addedValueDescription" step="any" value="${producingProductInstance?.addedValueDescription}" />

    </div>


</div>
</div>
</div>





