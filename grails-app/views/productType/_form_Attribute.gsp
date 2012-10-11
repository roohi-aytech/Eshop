<%@ page import="eshop.AttributeType" %>
<g:hasErrors bean="${attributeTypeInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${attributeTypeInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="productType.id" value="${attributeTypeInstance?.productType?.id}" />
<g:hiddenField name="id" value="${attributeTypeInstance?.id}" />
<g:hiddenField name="version" value="${attributeTypeInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: attributeTypeInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="attributeType.name.label" default="Name" />

    </label>
    <g:textField name="name" value="${attributeTypeInstance?.name}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: attributeTypeInstance, field: 'type', 'error')} ">
    <label for="attributeType">
        <g:message code="attributeType.attributeType.label" default="Attribute Type" />

    </label>
    <g:select name="attributeType" from="${(new AttributeType()).constraints.attributeType.inList}" value="${attributeTypeInstance?.attributeType}" valueMessagePrefix="attributeType.attributeType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attributeTypeInstance, field: 'category', 'error')} ">
    <label for="attributeType">
        <g:message code="attributeCategory.label" default="Category" />

    </label>
    <g:select name="category.id" from="${attributeCategories}" optionKey="id" value="${attributeTypeInstance?.category?.id}"  noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attributeTypeInstance, field: 'showPositions', 'error')} ">
    <label for="showPositions">
        <g:message code="showPositions.label" default="Show Positions" />

    </label>
    <rg:checkBoxList name="showPositions" from="${AttributeType.showPositionValues}"  value="${attributeTypeInstance?.showPositions}" translate="true"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attributeTypeInstance, field: 'defaultValue', 'error')} ">
    <label for="defaultValue">
        <g:message code="attributeType.defaultValue.label" default="Default Value" />

    </label>
    <g:textField name="defaultValue" value=""/>
</div>




<div class="fieldcontain attributeTypeButton">

</div>
<div class="fieldcontain attributeTypeValueTemplate" style="">
    <label for="values" class="valueslabel">
        <g:message code="attributeType.values.label" default="Values" />
    </label>
    <g:each in="${attributeTypeInstance.values}">
        <div>
            <g:textField name="values" value="${it}"/>
            <input type='button' value='${message(code: "remove")}' onclick="$(this).parent().remove()">
        </div>
    </g:each>
    <input type="button" id="valuesBtn" value="${message(code: "add")}" onclick="addattributeTypeValueTemplate(this)">
</div>
<script type="text/javascript">
    function addattributeTypeValueTemplate(obj){
        var div=$("<div></div>")
        var input=$("<input type='text' name='values'>")
        var del=$("<input type='button' value='${message(code: "remove")}'>")
        del.click(function(){
            $(this).parent().remove()
        })
        div.append(input)
        div.append(del)
        div.insertBefore($(obj))
    }
</script>