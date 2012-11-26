<%@ page import="eshop.AddedValue" %>

<g:hasErrors bean="${addedValueInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${addedValueInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${addedValueInstance?.id}"/>
<g:hiddenField name="version" value="${addedValueInstance?.version}"/>
<g:hiddenField name="baseProduct.id" value="${addedValueInstance?.baseProduct?.id}"/>

<div class="fieldcontain ${hasErrors(bean: addedValueInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="addedValue.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${addedValueInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addedValueInstance, field: 'type', 'error')} ">
    <label for="type">
        <g:message code="addedValue.type.label" default="Type"/>

    </label>
    <g:select name="type" from="${addedValueInstance.constraints.type.inList}" value="${addedValueInstance?.type}"
              valueMessagePrefix="addedValue.type" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addedValueInstance, field: 'processTime', 'error')} ">
    <label for="processTime">
        <g:message code="addedValue.processTime.label" default="Type"/>

    </label>
    <g:select name="processTime" from="${addedValueInstance.constraints.processTime.inList}"
              value="${addedValueInstance?.processTime}"
              valueMessagePrefix="addedValue.processTime" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addedValueInstance, field: 'value', 'error')} required">
    <label for="value">
        <g:message code="addedValue.value.label" default="Value"/>
    </label>
    <g:field type="number" style="direction: ltr;" name="value" step="any" required=""
             value="${addedValueInstance.value}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addedValueInstance, field: 'value', 'error')} required">
    <label for="value">
        <g:message code="addedValue.variationValues.label" default="Value"/>
    </label>

    <div id="addValueVariations">
        <g:each in="${addedValueInstance?.variationValues}" var="variationValue">
            <g:include action="variation" controller="addedValue"
                       params="['addedValueId': addedValueInstance?.id, 'variationValueId': variationValue?.id]"/>
        </g:each>
    </div>
    <input type="button" value="${message(code: "add")}" onclick="addVariation()"/>
</div>
<script type="text/javascript">
    function addVariation() {
        $.ajax({
            url:'<g:createLink action="variation" controller="addedValue"/>',
            data:{
                'baseProduct.id':${addedValueInstance?.baseProduct?.id}
            },
            type:'GET'
        }).done(function (response) {
                    $("#addValueVariations")
                            .append(response)
                })
    }
</script>
