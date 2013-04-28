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
    <rg:autocomplete domainClass="eshop.Brand" id="brand" like="true" value="${producingProductInstance?.brand?.id}" display="${producingProductInstance?.brand}"/>
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

<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'refundable', 'error')} ">
    <label for="refundable">
        <g:message code="producingProduct.refundable.label" default="Refundable"/>

    </label>
    <g:select name="refundable" from="${producingProductInstance.constraints.refundable.inList}" value="${producingProductInstance?.refundable}"
              valueMessagePrefix="producingProduct.refundable" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'delivery', 'error')} ">
    <label for="delivery">
        <g:message code="producingProduct.delivery.label" default="delivery"/>

    </label>
    <g:textField name="delivery" value="${producingProductInstance?.delivery}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: producingProductInstance, field: 'paidOff', 'error')} ">
    <label for="paidOff">
        <g:message code="producingProduct.paidOff.label" default="paidOff"/>

    </label>
    <g:textField name="paidOff" value="${producingProductInstance?.paidOff}"/>
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


</script>

