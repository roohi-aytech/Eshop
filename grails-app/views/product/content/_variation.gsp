<div>
    <g:select name="variations"
              from="${variations}"
              optionKey="id"
              value="${variation?.id}"
              onchange="variationChanged(this)"
              noSelection="['0': '']"/>
    <span class="variationValues">
        <g:if test="${variation}">
            <g:render template="content/variation_values" model="[
                    variationValues:variation.variationValues,
                    variationValue:variationValue
            ]"/>
        </g:if>
    </span>
    <input type="button" value="${message(code: 'remove')}" onclick="$(this).parent().remove()">
    <script type="text/javascript">
        function variationChanged(variation) {
            $.ajax({
                url:'<g:createLink action="imageVariationValue" controller="product"/>',
                data:{
                    variation:variation.value
                },
                type:'GET'
            }).done(function(response){
                        $(variation)
                                .parent()
                                .find(".variationValues")
                                .html("")
                                .append(response)
                    })
        }
    </script>
</div>
