<%@ page import="eshop.AttributeType" %>
<g:hasErrors bean="${attributeTypeInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${attributeTypeInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="productType.id" value="${attributeTypeInstance?.productType?.id}"/>
<g:hiddenField name="id" value="${attributeTypeInstance?.id}"/>
<g:hiddenField name="version" value="${attributeTypeInstance?.version}"/>


<div class="fieldcontain ${hasErrors(bean: attributeTypeInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="attributeType.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${attributeTypeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attributeTypeInstance, field: 'type', 'error')} ">
    <label for="attributeType">
        <g:message code="attributeType.attributeType.label" default="Attribute Type"/>

    </label>
    <g:select name="attributeType" from="${(new AttributeType()).constraints.attributeType.inList}"
              value="${attributeTypeInstance?.attributeType}" valueMessagePrefix="attributeType.attributeType"
              noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attributeTypeInstance, field: 'category', 'error')} ">
    <label for="attributeType">
        <g:message code="attributeCategory.label" default="Category"/>

    </label>
    <g:select name="category.id" from="${attributeCategories}" optionKey="id"
              value="${attributeTypeInstance?.category?.id}" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attributeTypeInstance, field: 'showPositions', 'error')} ">
    <label for="showPositions">
        <g:message code="showPositions.label" default="Show Positions"/>

    </label>
    <rg:checkBoxList name="showPositions" from="${AttributeType.showPositionValues}"
                     value="${attributeTypeInstance?.showPositions}" translate="true"/>
</div>

<div class="fieldcontain ${hasErrors(bean: attributeTypeInstance, field: 'defaultValue', 'error')} ">
    <label for="defaultValue">
        <g:message code="attributeType.defaultValue.label" default="Default Value"/>

    </label>
    %{--<g:if test="${attributeTypeInstance?.values}">--}%
        <g:select name="defaultValue.id" from="${attributeTypeInstance?.values}"
                    optionKey="id" optionValue="value"
                  value="${attributeTypeInstance?.defaultValue?.id}" noSelection="['': '']"/>
    %{--</g:if>--}%
    %{--<g:else>--}%
        %{--<g:textField name="defaultValue" value="${attributeTypeInstance?.defaultValue}"/>--}%
    %{--</g:else>--}%
</div>


<div class="fieldcontain attributeTypeButton">

</div>

<div class="fieldcontain attributeTypeValueTemplate" style="">
    <label for="values" class="valueslabel">
        <g:message code="attributeType.values.label" default="Values"/>
    </label>
    <g:each in="${attributeTypeInstance?.values?.sort{it.id}}">
        <div>

            <g:if test="${attributeTypeInstance?.attributeType=="Text"}">
                <g:textArea name="values_${it?.id}" value="${it?.value}" onkeydown="updateDefaultValue(${it?.id})" rows="5" cols="70"/>
            </g:if>
            <g:else>
                <g:textField name="values_${it?.id}" value="${it?.value}" onkeydown="updateDefaultValue(${it?.id})"/>
            </g:else>
            <input attrid="${it?.id}" type='button' value='${message(code: "remove")}' onclick="removeValues(this)">
            <span id="val_${it?.id}"></span>
        </div>
        <script type="text/javascript">
            $(function(){
                $.ajax({
                    url:'<g:createLink action="countProductsForAttributeValue" />',
                    data:{
                        id:${it?.id},
                        atid:${attributeTypeInstance?.id}
                    }
                }).success(function(res){
                    $("#val_${it?.id}").html('<g:message code="count" />: '+res)
                })
            })
        </script>
    </g:each>
    <input type="button" id="valuesBtn" value="${message(code: "add")}" onclick="addattributeTypeValueTemplate(this)">
</div>
<script type="text/javascript">
    function updateDefaultValue(id) {
        $("#defaultValue option[value="+id+"]").html($("[name=values_"+id+"]").val())
    }
    function removeValues(t) {
        $(t).parent().remove()
        $("option[value="+$(t).attr("attrid")+"]").remove()

    }
    function addattributeTypeValueTemplate(obj) {

        var div = $("<div></div>")
        var input = $("<input type='text' name='values_'>")
        var del = $("<input type='button' value='${message(code: "remove")}'>")
        del.click(function () {
            removeValues(this)
        })
        div.append(input)
        div.append(del)
        div.insertBefore($(obj))
    }
</script>