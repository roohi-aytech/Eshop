<g:javascript>
    $(".variation-value-color").hover(function () {
        var vth=$(this).parents(".product-variation")
        vth.find(".hover-variation")
                .show()
                .text($(this).text())
        vth.find(".cur-variation").hide()

    },function(){
        var vth=$(this).parents(".product-variation")
        vth.find(".cur-variation").show()
        vth.find(".hover-variation").hide()
    })
</g:javascript>
<div class="product-variations">
    <g:each in="${product?.variations}">
        <div class="product-variation">
            <div class="variation-title">
                ${it.name}:
                <div class="cur-variation">${it.variationValues.find()}</div>
                <div class="hover-variation"></div>
            </div>
            <g:if test="${it.variationGroup.representationType.equals("String")}">
                <div class="variation">
                    <div class="variation-value">
                        <g:select name="${it.id}" from="${it.variationValues}"/>
                    </div>
                </div>
            </g:if>
            <g:if test="${it.variationGroup.representationType.equals("Color")}">
                <div class="variation-value">
                    <g:each in="${it.variationValues}">
                        <div class="variation-value-color">
                            ${it}
                        </div>
                    </g:each>
                </div>
            </g:if>
        </div>
    </g:each>
</div>