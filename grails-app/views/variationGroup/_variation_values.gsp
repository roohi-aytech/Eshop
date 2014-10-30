%{--<g:select name="variationValues"--}%
%{--multiple="true"--}%
%{--from="${variationGroupInstance.variationValues}"--}%
%{--optionKey="id"/>--}%
%{--<input id="variationFilter" placeholder="<g:message code="search" />">--}%
<input id="variationGroupValues" placeholder="<g:message code="search"/>"/>
<script type="text/javascript">
    jQuery("#variationGroupValues").autocomplete({
        source:'${g.createLink(controller:"variationGroup", action:"searchVariationValues",params: [variationGroupId:variationGroupInstance?.id])}',
        minLength:1,
        select:function (event, ui) {
            addNewVariationValue(ui.item.id, ui.item.label)
        }
    })
    function addNewVariationValue(id, text) {
        var li = $("<li></li>")
        li.append('<input type="hidden" name="_variationValues">')
        li.append('<input id="variationValues" type="checkbox" value="' + id + '" name="variationValues" checked="checked">')
        li.append(text)
        $("#variationValues").find("ul").append(li)
    }
</script>
<rg:checkBoxList name="variationValues"
                 from="${variationValues}"
                 value="${variationInstance.variationValues.collect {it.id}}"
                 inline="true"
                 optionKey="id"/>
<g:if test="${variationGroupInstance.variationValues}">
    <input type="button" value="${message(code: "add")}" onclick="addVariationGroupValue()">
    <script type="text/javascript">
        function addVariationGroupValue() {
            loadOverlay('<g:createLink controller="variationGroup" action="variationValueForm"/>?variationGroup.id=' + $("#variationGroup\\.id").val()
                    , '<g:createLink controller="variationGroup" action="saveVariationValue"/>', function (value) {
                        addNewVariationValue(value.id, value.value)
                    })
        }
        $(function () {
            $("#variationFilter").keyup(function () {
                filter = $("#variationFilter").val()
                if (filter) {
                    $("#variationValues").find("li").hide()
                    $("#variationValues").find("li:contains('" + filter + "')").show()
                }
                else {
                    $("#variationValues").find("li").show()
                }
            })
        })
    </script>
</g:if>