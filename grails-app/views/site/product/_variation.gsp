<%@ page import="eshop.ProductModel" %>
<g:javascript>
    $(".variation-value-color").hover(function () {
        var vth = $(this).parents(".product-variation")
        vth.find(".hover-variation")
                .show()
                .text($(this).text())
        vth.find(".cur-variation").hide()

    }, function () {
        var vth = $(this).parents(".product-variation")
        vth.find(".cur-variation").show()
        vth.find(".hover-variation").hide()
    });

    $(".variation-value-color").click(function () {
        $(this).parent().find('.variation-value-color').removeClass('selected');
        $(this).addClass('selected');
        var variationId = parseInt($(this).parent().attr('variationId'));
        var variationValueId = parseInt($(this).attr('variationValueId'));
        $('#cur-variation-' + variationId).html($(this).html());
        $('#variation' + variationId).val($(this).attr('variationValueId'));

        var $form = $("#productVariationForm");
        var serializedData = $form.serialize();

        $('#product-card').html('${message(code: 'waiting')}');
        angular.element(document.getElementById('main-container')).scope().reloadProductCart("${createLink(controller: "site", action: "productCard")}", serializedData, $('#product-card'));
    });
</g:javascript>
<div class="product-variations">
    <g:set var="defaultModel" value="${ProductModel.findByProductAndIsDefaultModel(product, true)}"/>
    <g:if test="${defaultModel}">
        <form id="productVariationForm">
            <g:hiddenField name="productId" value="${product.id}"/>
        %{--variation select--}%
            <g:each in="${product?.variations}">
                <div class="product-variation">
                    <div class="variation-title">
                        ${it.name}:
                        <g:set var="curVariation"
                               value="${defaultModel?.variationValues?.find { value -> value?.variationGroup?.id == it?.variationGroup?.id }}"/>
                        <div ${curVariation?.variationGroup?.representationType == 'Color' ? 'itemprop="color"' : ''}
                                class="cur-variation"
                                id="cur-variation-${it.id}">${curVariation}</div>

                        <div class="hover-variation"></div>
                        <g:hiddenField id="variation${it.id}" name="variation${it.id}" value="${curVariation?.id}"/>
                    </div>

                    <g:if test="${it.variationValues.count { it } > 1}">
                        <div class="variation-value" variationId="${it.id}">
                            <g:each in="${it.variationValues}">
                                <div variationValueId="${it.id}"
                                     class="variation-value-color ${defaultModel?.variationValues?.find { value -> value?.variationGroup?.id == it.variationGroup.id }?.value == it.value ? 'selected' : ''}">
                                    ${it}
                                </div>
                            </g:each>
                        </div>
                    </g:if>
                </div>
            </g:each>
        %{--guarantee select--}%
            <div class="product-variation">
                <div class="variation-title">
                    ${message(code: 'guarantee')}:
                    <g:set var="curVariation"
                           value="${defaultModel?.guarantee?.name}"/>
                    <div class="cur-variation"
                         id="cur-variation-0">${defaultModel?.guarantee?.name}</div>

                    <div class="hover-variation"></div>
                    <g:hiddenField id="variation0" name="guarantee" value="${defaultModel?.guarantee?.id}"/>
                </div>
                <g:set var="gList" value="${ProductModel.findAllByProduct(product).collect { it.guarantee }.toSet()}"/>
                <g:if test="${gList.count { it } > 1}">
                    <div class="variation-value" variationId="0">
                        <g:each in="gList">
                            <div variationValueId="${it.id}"
                                 class="variation-value-color ${defaultModel?.guarantee?.id == it.id ? 'selected' : ''}">
                                ${it.name}
                            </div>
                        </g:each>
                    </div>
                </g:if>
            </div>
        </form>
    </g:if>
</div>