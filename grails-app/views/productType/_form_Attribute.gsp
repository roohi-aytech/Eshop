<%@ page import="eshop.AttributeType" %>



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

<div class="fieldcontain ${hasErrors(bean: attributeTypeInstance, field: 'defaultValue', 'error')} ">
    <label for="defaultValue">
        <g:message code="attributeType.defaultValue.label" default="Default Value" />

    </label>
    <g:textField name="defaultValue" value=""/>
</div>




<div class="fieldcontain attributeTypeButton">
    <label for="values" class="valueslabel">
        <g:message code="attributeType.values.label" default="Values" />
    </label>
    <input type="button" id="valuesBtn" value="${message(code: "add")}" onclick="addattributeTypeValueTemplate()">
</div>
<div class="fieldcontain attributeTypeValueTemplate" style="display: none;">
    <label for="values" class="valueslabel">
    </label>
    <g:textField name="values"  value=""/>
    <input type="button" value="${message(code: "remove")}" onclick="removeattributeTypeValueTemplate(this)">
</div>
<g:hiddenField id="productType" name="productType.id" />
<g:javascript>
    function removeattributeTypeValueTemplate(val){
        $(val).parent().remove();
        $(".valueslabel")
            .html("")
            .first()
            .html("<g:message code="attributeType.values.label" default="Values" />");
    }
    function addattributeTypeValueTemplate(value){
        var attributeTypeValueTemplate=$(".attributeTypeValueTemplate");
        var attributeTypeButton=$(".attributeTypeButton");
        var newattributeTypeValueTemplate = attributeTypeValueTemplate
                .clone()
                .removeClass("attributeTypeValueTemplate")
                .addClass("attributeTypeValue")
                .show();
        if(value)
            newattributeTypeValueTemplate.find("[name=values]").val(value);
        newattributeTypeValueTemplate.insertBefore(attributeTypeButton);
        $(".valueslabel")
            .html("")
            .first()
            .html("<g:message code="attributeType.values.label" default="Values" />");


    }
</g:javascript>