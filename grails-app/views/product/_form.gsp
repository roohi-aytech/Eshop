<%@ page import="eshop.Product" %>

<g:hiddenField name="id" value="${productInstance?.id}" />
<g:hiddenField name="version" value="${productInstance?.version}" />
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="product.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${productInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="product.description.label" default="Description"/>

    </label>
    <g:textField name="description" value="${productInstance?.description}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'manufactureDate', 'error')} ">
    <label for="manufactureDate">
        <g:message code="product.manufactureDate.label" default="Manufacture Date"/>

    </label>
    <rg:datePicker name="manufactureDate" value="${productInstance?.manufactureDate}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'manufactureCountry', 'error')} ">
    <label for="manufactureCountry">
        <g:message code="product.manufactureCountry.label" default="Manufacture Country"/>

    </label>
    <g:textField name="manufactureCountry" value="${productInstance?.manufactureCountry}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'brand', 'error')} ">
    <label for="brand">
        <g:message code="product.brand.label" default="Brand"/>
    </label>
    <rg:autocomplete domainClass="eshop.Brand" id="brand" like="true" value="${productInstance?.brand?.id}" display="${productInstance?.brand}"/>
    <input type="button" value="${message(code: "add")}" onclick="addBrand()">
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'productTypes', 'error')} ">
    <label for="productTypes">
        <g:message code="product.producttypes.label" default="Product Types"/>

    </label>
    <div id="productTypes"></div>
    <g:hiddenField name="producttypes" value="${productTypeIds}" />
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
</script>


