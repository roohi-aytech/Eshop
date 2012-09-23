<%@ page import="eshop.VariationGroup" %>


<g:hiddenField name="id" value="${variationGroupInstance?.id}"/>
<g:hiddenField name="version" value="${variationGroupInstance?.version}" />
<div class="fieldcontain ${hasErrors(bean: variationGroupInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="variationGroup.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${variationGroupInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: variationGroupInstance, field: 'representationType', 'error')} ">
	<label for="representationType">
		<g:message code="variationGroup.representationType.label" default="Representation Type" />
		
	</label>
	<g:select name="representationType" from="${variationGroupInstance.constraints.representationType.inList}" value="${variationGroupInstance?.representationType}" valueMessagePrefix="variationGroup.representationType" noSelection="['': '']"/>
</div>

<div class="fieldcontain valuesButton" count="0">
    <label for="values" class="valueslabel">
        <g:message code="attributeType.values.label" default="Values" />
    </label>
    <input type="button" id="valuesBtn" value="${message(code: "add")}" onclick="addValueTemplate()">
</div>
<div class="fieldcontain valueTemplate" style="display: none;">
    <label for="values" class="valueslabel">
    </label>
    <g:textField name="values"  value=""/>
    <g:hiddenField name="valuesid"  value=""/>
    <input type="button" value="${message(code: "remove")}" onclick="removeValueTemplate(this)">
</div>

<script type="text/javascript">
    function removeValueTemplate(val){
        $(val).parent().remove();
        $(".valueslabel")
            .html("")
            .first()
            .html("<g:message code="variationGroup.variationValues.label" default="Variation Values" />");
    }
    function addValueTemplate(id,value){
        var valueTemplate=$(".valueTemplate");
        var valuesButton=$(".valuesButton");
        var newValueTemplate = valueTemplate
                .clone()
                .removeClass("valueTemplate")
                .addClass("value")
                .show();
        if(value)
            newValueTemplate.find("[name=values]").val(value);
        if(id)
            newValueTemplate.find("[name=valuesid]").val(id);
        var count=parseFloat(valuesButton.attr("count"));
        newValueTemplate.find("[name=values]").attr("name","variationValues["+count+"].value");
        newValueTemplate.find("[name=valuesid]").attr("name","variationValues["+count+"].id");
        valuesButton.attr("count",count+1);

        newValueTemplate.insertBefore(valuesButton);
        $(".valueslabel")
            .html("")
            .first()
            .html("<g:message code="variationGroup.variationValues.label" default="Variation Values" />");
    }
    $(function(){
    <g:each in="${variationGroupInstance?.variationValues}" var="variationValue">
        addValueTemplate(${variationValue.id},'${variationValue.value}');
    </g:each>
    })
</script>

