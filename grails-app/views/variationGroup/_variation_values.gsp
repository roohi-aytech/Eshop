%{--<g:select name="variationValues"--}%
%{--multiple="true"--}%
%{--from="${variationGroupInstance.variationValues}"--}%
%{--optionKey="id"/>--}%
<rg:checkBoxList name="variationValues"
                 from="${variationGroupInstance.variationValues}"
                 value="${variationInstance.variationValues.collect {it.id}}"
                 optionKey="id"/>
<g:if test="${variationGroupInstance.variationValues}">
    <input type="button" value="${message(code: "add")}" onclick="addVariationGroupValue()">
    <script type="text/javascript">
        function addVariationGroupValue() {
            loadOverlay('<g:createLink controller="variationGroup" action="variationValueForm"/>?variationGroup.id=' + $("#variationGroup\\.id").val()
                    , '<g:createLink controller="variationGroup" action="saveVariationValue"/>',variatoinGroupChanged)
        }
    </script>
</g:if>