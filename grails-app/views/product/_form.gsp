<%@ page import="eshop.Product" %>

<g:hiddenField name="id" value="${productInstance?.id}"/>
<g:hiddenField name="version" value="${productInstance?.version}"/>

<g:if test="${productInstance?.id}">
    <g:message code="product.baseProductId" default="Code"/>:
    <b>${productInstance?.id}</b>
</g:if>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="product.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${productInstance?.name}" class="count-words" size="70"/>
</div>


<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'pageTitle', 'error')} ">
    <label for="pageTitle">
        <g:message code="product.pageTitle.label" default="Page Title"/>

    </label>
    <g:checkBox name="manualTitle" value="${productInstance?.manualTitle}"/>
    <g:textField name="pageTitle" value="${productInstance?.pageTitle}" class="count-words"/>
    <script type="text/javascript">
        $(function () {
            $("#manualTitle").change(function () {
                if ($(this).attr("checked"))
                    $("#pageTitle").removeAttr("disabled")
                else
                    $("#pageTitle").attr("disabled", "disabled")
            })
            if ($("#manualTitle").attr("checked"))
                $("#pageTitle").removeAttr("disabled")
            else
                $("#pageTitle").attr("disabled", "disabled")
        })
    </script>
</div>
%{--<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'keywords', 'error')} ">--}%
%{--<label for="keywords">--}%
%{--<g:message code="product.keywords.label" default="Keywords"/>--}%

%{--</label>--}%
%{--<g:textArea name="keywords" value="${productInstance?.keywords}" cols="20" rows="5" class="count-words"/>--}%
%{--</div>--}%
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'manufactureDate', 'error')} ">
    <label for="manufactureDate">
        <g:message code="product.manufactureDate.label" default="Manufacture Date"/>

    </label>
    <g:textField name="manufactureDate" value="${productInstance?.manufactureDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'manufactureCountry', 'error')} ">
    <label for="manufactureCountry">
        <g:message code="product.manufactureCountry.label" default="Manufacture Country"/>

    </label>
    <g:textField name="manufactureCountry" value="${productInstance?.manufactureCountry}"/> <input type="button"
                                                                                                   onclick="editCountry()"
                                                                                                   value="${message(code: 'edit')}">
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'iranCode', 'error')} ">
    <label for="iranCode">
        <g:message code="product.iranCode.label" default="Iran Code"/>

    </label>
    <g:textField name="iranCode" value="${productInstance?.iranCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'shabnamCode', 'error')} ">
    <label for="shabnamCode">
        <g:message code="product.shabnamCode.label" default="Shabnam Code"/>

    </label>
    <g:textField name="shabnamCode" value="${productInstance?.shabnamCode}"/>
</div>
%{--<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'manufactureCountry', 'error')} ">--}%
%{--<label for="manufactureCountry">--}%
%{--<g:message code="product.manufactureCountry.label" default="Manufacture Country"/>--}%

%{--</label>--}%
%{--<g:textField name="manufactureCountry" value="${productInstance?.manufactureCountry}"/>--}%
%{--</div>--}%
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'weight', 'error')} ">
    <label for="manufactureCountry">
        <g:message code="product.weight.label" default="Weight"/>

    </label>
    <g:field type="number" name="weight" value="${productInstance?.weight}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'length', 'error')} ">
    <label for="length">
        <g:message code="product.length.label" default="length"/>

    </label>
    <g:field type="number" name="length" value="${productInstance?.length}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'width', 'error')} ">
    <label for="width">
        <g:message code="product.width.label" default="width"/>

    </label>
    <g:field type="number" name="width" value="${productInstance?.width}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'height', 'error')} ">
    <label for="height">
        <g:message code="product.height.label" default="height"/>

    </label>
    <g:field type="number" name="height" value="${productInstance?.height}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'brand', 'error')} ">
    <label for="brand">
        <g:message code="product.brand.label" default="Brand"/>
    </label>
    <rg:autocomplete domainClass="eshop.Brand" id="brand" like="true" value="${productInstance?.brand?.id}"
                     display="${productInstance?.brand}"/>
    <input type="button" value="${message(code: "add")}" onclick="addBrand()">
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'isVisible', 'error')} ">
    <label for="isVisible">
        <g:message code="product.isVisible.label"/>
    </label>
    <g:checkBox name="isVisible" id="isVisible" checked="${productInstance?.isVisible}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'productTypes', 'error')} ">
    <label for="productTypes">
        <g:message code="product.producttypes.label" default="Product Types"/>

    </label>

    <div id="productTypes"></div>
    <g:hiddenField name="producttypes" value="${productTypeIds}"/>
</div>
<script type="text/javascript">
    function addBrand() {
        loadOverlay('<g:createLink controller="brand" action="form"/>',
                '<g:createLink controller="brand" action="save"/>',
                function (r) {
                    $("#brand").val(r.name)
                    $("#brand.id").val(r.id)
                })
    }
    function editCountry() {
        var country = $("#manufactureCountry").val()
        if (country) {
            loadOverlay('<g:createLink controller="product" action="countryForm"/>?country=' + country,
                    '<g:createLink controller="product" action="saveCountry"/>',
                    function (r) {
                        $("#manufactureCountry").val(r.country)
                    })
        }
        else {
            alert('<g:message code="please-select-a-country" />')
        }

    }
    $(function () {

        $(".count-words").keypress(function () {
            var inp = $(this)
            inp.parent().find(".word-counter").html(inp.val().length)
        }).each(function () {
                    $("<span class='word-counter'></span>").insertAfter($(this))
                    $(this).keypress()

                })
    })
    jQuery("#manufactureCountry").autocomplete({
        source: '${g.createLink(controller:"product", action:"searchCountryValues")}',
        minLength: 1
    })
</script>

