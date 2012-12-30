<%@ page import="eshop.PageDetails" %>

<g:hasErrors bean="${pageDetailsInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${pageDetailsInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${pageDetailsInstance?.id}"/>
<g:hiddenField name="version" value="${pageDetailsInstance?.version}"/>


<div class="fieldcontain ${hasErrors(bean: pageDetailsInstance, field: 'productType', 'error')} ">
    <label for="productType">
        <g:message code="pageDetails.productType.label" default="Product Type"/>

    </label>
    <rg:autocomplete domainClass="eshop.ProductType" like="true" id="productType"
              value="${pageDetailsInstance?.productType?.id}" display="${pageDetailsInstance?.productType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageDetailsInstance, field: 'brand', 'error')} ">
    <label for="brand">
        <g:message code="pageDetails.brand.label" default="Brand"/>

    </label>
    <rg:autocomplete domainClass="eshop.Brand" like="true" id="brand"
              value="${pageDetailsInstance?.brand?.id}" display="${pageDetailsInstance?.brand}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageDetailsInstance, field: 'title', 'error')} ">
    <label for="title">
        <g:message code="pageDetails.title.label" default="Title"/>

    </label>
    <g:textField name="title" value="${pageDetailsInstance?.title}" class="count-words" size="52"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageDetailsInstance, field: 'keywords', 'error')} ">
    <label for="keywords">
        <g:message code="pageDetails.keywords.label" default="Keywords"/>

    </label>
    <g:textArea cols="50" rows="4" name="keywords" value="${pageDetailsInstance?.keywords}" class="count-words"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageDetailsInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="pageDetails.description.label" default="Description"/>

    </label>
    <g:textArea cols="50" rows="4" name="description" value="${pageDetailsInstance?.description}" class="count-words"/>
</div>

<script type="text/javascript">
    $(function () {

        $(".count-words").keypress(function () {
            var inp = $(this)
            inp.parent().find(".word-counter").html(inp.val().length)
        }).each(function () {
                    $("<span class='word-counter'></span>").insertAfter($(this))
                    $(this).keypress()

                })
    })
</script>