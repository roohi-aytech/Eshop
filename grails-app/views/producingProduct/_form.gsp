<%@ page import="eshop.ProducingProduct" %>
<g:hasErrors bean="${producingProductInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${producingProductInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${producingProductInstance?.id}" />
<g:hiddenField name="version" value="${producingProductInstance?.version}" />
<g:hiddenField name="producer.id" value="${producerId}"/>


<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'productTypes', 'error')} ">
    <label for="productTypes">
        <g:message code="producingProduct.productTypes.label" default="Product Types"/>
    </label>

    <rg:tree bean="${producingProductInstance}" field="productTypes" relationField="parentProduct" width="280px"></rg:tree>
</div>


<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'brand', 'error')} ">
    <label for="brand">
        <g:message code="producingProduct.brand.label" default="Brand"/>
    </label>
    <rg:autocomplete  domainClass="eshop.Brand" id="brand" like="true" value="${producingProductInstance?.brand?.id}" display="${producingProductInstance?.brand}"/>
    <input type="button" value="${message(code: "add")}" onclick="addBrand()">
</div>

<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'discountType', 'error')} ">
    <label for="discountType">
        <g:message code="producingProduct.discountType.label" default="Type"/>

    </label>
    <g:select name="discountType" from="${producingProductInstance.constraints.discountType.inList}" value="${producingProductInstance?.discountType}"
              valueMessagePrefix="producingProduct.discountType" noSelection="['': '']"/>
</div>


<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'discount', 'error')} ">
    <label for="discount">
        <g:message code="producingProduct.discount.label" default="Discount"/>
    </label>
    <g:field type="number" style="direction: ltr;" name="discount" step="any" required=""
             value="${producingProductInstance.discount}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'guarantee', 'error')} ">
    <label for="guarantee">
        <g:message code="producingProduct.guarantee.label" default="Guarantee"/>
    </label>
    <rg:autocomplete domainClass="eshop.Guarantee" id="guarantee" like="true" value="${producingProductInstance?.guarantee?.id}" display="${producingProductInstance?.guarantee}"/>
    <input type="button" value="${message(code: "add")}" onclick="addGuarantee()">
</div>

<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'settlement', 'error')} ">
    <label for="settlement">
        <g:message code="producingProduct.settlement.label" default="Settlement"/>
    </label>
    <rg:autocomplete domainClass="eshop.Settlement" id="settlement" like="true" value="${producingProductInstance?.settlement?.id}" display="${producingProductInstance?.settlement}"/>
    <input type="button" value="${message(code: "add")}" onclick="addSettlement()">
    <g:textField name="settlementDescription" value="${producingProductInstance?.settlementDescription}"/>

</div>

%{--<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'settlementDescription', 'error')} ">--}%
    %{--<label for="settlementDescription">--}%
        %{--<g:message code="producingProduct.settlementDescription.label" default="settlementDescription"/>--}%
    %{--</label>--}%
    %{--<g:textField name="settlementDescription" value="${producingProductInstance?.settlementDescription}"/>--}%

%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'refundable', 'error')} ">
    <label for="refundable">
        <g:message code="producingProduct.refundable.label" default="Refundable"/>

    </label>
    <g:select name="refundable" from="${producingProductInstance.constraints.refundable.inList}" value="${producingProductInstance?.refundable}"
              valueMessagePrefix="producingProduct.refundable" noSelection="['': '']"/>
    <g:textField name="refundableDescription" value="${producingProductInstance?.refundableDescription}"/>

</div>

%{--<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'refundableDescription', 'error')} ">--}%
    %{--<label for="refundableDescription">--}%
        %{--<g:message code="producingProduct.refundableDescription.label" default="refundableDescription"/>--}%

    %{--</label>--}%
    %{--<g:textField name="refundableDescription" value="${producingProductInstance?.refundableDescription}"/>--}%
%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'deliveryPlace', 'error')} ">
    <label for="deliveryPlace">
        <g:message code="producingProduct.deliveryPlace.label" default="DeliveryPlace"/>

    </label>
    <g:textField name="deliveryPlace" value="${producingProductInstance?.deliveryPlace}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'volumeDescription', 'error')}"  style="display: inline-block; width: 50%">
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
<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'retailDescription', 'error')} "  style="display: inline-block; width: 50%" >
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

<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'priceType', 'error')} ">
    <label for="priceType">
        <g:message code="producingProduct.priceType.label" default="PriceType"/>

    </label>
    <g:select name="priceType" from="${producingProductInstance.constraints.priceType.inList}" value="${producingProductInstance?.priceType}"
              valueMessagePrefix="producingProduct.priceType" noSelection="['': '']"/>

    <g:textField name="priceDescription" value="${producingProductInstance.priceDescription}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'cooperationPrice', 'error')} ">
    <label for="cooperationPrice">
        <g:message code="producingProduct.cooperationPrice.label" default="cooperationPrice"/>
    </label>
    <g:field type="number" style="direction: ltr;" name="cooperationPrice" step="any" required=""
             value="${producingProductInstance.cooperationPrice}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'testPeriod', 'error')} ">
    <label for="testPeriod">
        <g:message code="producingProduct.testPeriod.label" default="testPeriod"/>
    </label>
    <g:field type="number" style="direction: ltr;" name="testPeriod" step="any" required=""
             value="${producingProductInstance.testPeriod}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'addedValue', 'error')} ">
    <label for="addedValue">
        <g:message code="producingProduct.addedValue.label" default="addedValue"/>
    </label>
    <g:field type="number" style="direction: ltr;" name="addedValue" step="any" required=""
             value="${producingProductInstance.addedValue}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'transportationCost', 'error')} ">
    <label for="transportationCost">
        <g:message code="producingProduct.transportationCost.label" default="TransportationCost"/>
    </label>
    <g:field type="number" style="direction: ltr;" name="transportationCost" step="any" required=""
             value="${producingProductInstance.transportationCost}"/>
</div>






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
</script>

