%{--<g:select name="variationValues"--}%
%{--multiple="true"--}%
%{--from="${variationGroupInstance.variationValues}"--}%
%{--optionKey="id"/>--}%
<input id="variationFilter" placeholder="<g:message code="search" />">
<rg:checkBoxList name="variationValues"
                 from="${variationGroupInstance.variationValues}"
                 value="${variationInstance.variationValues.collect {it.id}}"
                 inline="true"
                 optionKey="id"/>
<g:if test="${variationGroupInstance.variationValues}">
    <input type="button" value="${message(code: "add")}" onclick="addVariationGroupValue()">
    <script type="text/javascript">
        function addVariationGroupValue() {
            loadOverlay('<g:createLink controller="variationGroup" action="variationValueForm"/>?variationGroup.id=' + $("#variationGroup\\.id").val()
                    , '<g:createLink controller="variationGroup" action="saveVariationValue"/>',variatoinGroupChanged)
        }
        $(function(){
            $("#variationFilter").keyup(function(){
                filter = $("#variationFilter").val()
                if(filter){
                    $("#variationValues").find("li").hide()
                    $("#variationValues").find("li:contains('"+filter+"')").show()
                }
                else{
                    $("#variationValues").find("li").show()
                }
            })
        })
    </script>
</g:if>