<%@ page import="eshop.VariationGroup" %>
<g:hiddenField name="id" value="${variationInstance?.id}"/>
<g:hiddenField name="version" value="${variationInstance?.version}"/>
<g:hiddenField name="baseProduct.id" value="${baseProductId}"/>

<div class="fieldcontain ${hasErrors(bean: variationInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="variation.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${variationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: variationInstance, field: 'variationGroup', 'error')} ">
    <label for="name">
        <g:message code="variation.variationGroup.label" default="Name"/>

    </label>
    <g:select name="variationGroup.id"
              from="${VariationGroup.findAllByProductTypeIsNullOrProductTypeInList(parentProductTypes).sort {it.name}}"
              optionKey="id"
              value="${variationInstance?.variationGroup?.id}"
              onchange="variatoinGroupChanged()"
              noSelection="['0': '']"/>
    <input type="button" value="${message(code:"new-variation-group")}" onclick="$('#vgc-button').click()">

</div>

<div class="fieldcontain" id="variationValues">

</div>
<script type="text/javascript">
    function variatoinGroupChanged() {
        $.ajax({
            url:'<g:createLink action="variationValues" controller="VariationGroup"/>',
            data:{
                id:$("#variationGroup\\.id").val()
                ${baseProductId?",baseProductId:"+baseProductId:""}
            },
            type:'GET'
        }).done(function (response) {
                    $("#variationValues")
                            .html("")
                            .append(response)
                })
    }
    function newVariationGroup(){

    }
    $(function () {
        variatoinGroupChanged()
    })

</script>


