<g:hiddenField name="id" value="${content?.id}"/>
<div class="fieldcontain">
    <label for="value">
        <g:message code="addedValue.variationValues.label" default="Value"/>
    </label>

    <div id="addValueVariations">
        <g:each in="${content?.variationValues}" var="variationValue">
            <g:render template="content/variation"
                      model="[variations: productInstance.variations,
                              variationValue: variationValue,
                              variation:productInstance.variations?.find{it.variationValues.contains(variationValue)}]"/>
        </g:each>
    </div>
    <input type="button" value="${message(code: "add")}" onclick="addVariation()"/>
</div>
<script type="text/javascript">
    function addVariation() {
        $.ajax({
            url:'<g:createLink action="imageVariation" controller="product"/>',
            data:{
                'productId':${productInstance?.id}
            },
            type:'GET'
        }).done(function (response) {
                    $("#addValueVariations")
                            .append(response)
                })
    }
</script>
