<%@ page import="eshop.ProductModel" %>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
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

            angular.element(document.getElementById('main-container')).scope().reloadProductCart("${createLink(controller: "site", action: "productCard")}", serializedData, $('#product-card'));
            <g:if test="${grailsApplication.config.eShop.instance == 'felfel'}">
            angular.element(document.getElementById('main-container')).scope().reloadProductCart("${createLink(controller: "site", action: "productShoppingPanel")}", serializedData, $('#shoppingPanel'));
            </g:if>
            <g:if test="${grailsApplication.config.eShop.instance == 'zanbil'}">
            $('#product-card').html('${message(code: 'waiting')}');
            angular.element(document.getElementById('main-container')).scope().reloadProductPrice("${createLink(controller: "site", action: "productPrice")}", serializedData, $('#product-price'));
            angular.element(document.getElementById('main-container')).scope().reloadProductAdditives("${createLink(controller: "site", action: "productAdditives")}", serializedData, $('.product-additives'));
            </g:if>
            <g:if test="${grailsApplication.config.eShop.instance == 'goldaan'}">
            angular.element(document.getElementById('main-container')).scope().reloadProductAdditives("${createLink(controller: "site", action: "productAdditives")}", serializedData, $('.product-additives'));
            angular.element(document.getElementById('main-container')).scope().reloadAjax("${createLink(controller: "site", action: "productImages")}", serializedData, $('#product-images'));
            </g:if>
        });
    });
</script>

<div class="product-variations">
    <g:set var="defaultModel" value="${ProductModel.findByProductAndIsDefaultModel(product, true)}"/>
    <g:if test="${defaultModel}">
        <form id="productVariationForm">
            <g:hiddenField name="productId" value="${product.id}"/>
            <g:hiddenField name="selectedAddedValues" id="selectedAddedValues" value=""/>
        %{--variation select--}%
            <g:each in="${product?.variations.sort { it.variationValues.size()+it.toString()}}">
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
                            <g:each in="${it.variationValues.sort{it.id}}">
                                <div variationValueId="${it.id}"
                                     class="variation-value-color ${defaultModel?.variationValues?.find { value -> value?.variationGroup?.id == it.variationGroup.id }?.value == it.value ? 'selected' : ''}">
                                    <g:if test="${it.image}">
                                        <div>
                                            <img class="variationValueImage" src="<g:createLink controller="image" params="[type:'variationValue',uid:Math.random()]" id="${it?.id}"/>" alt="">
                                        </div>
                                    </g:if>
                                    ${it}
                                </div>
                            </g:each>
                        </div>
                    </g:if>
                </div>
            </g:each>
        %{--guarantee select--}%
            <div class="product-variation">
                <g:if test="${defaultModel?.guarantee}">
                    <div class="variation-title">
                        ${message(code: 'guarantee')}:
                        <g:set var="curVariation"
                               value="${defaultModel?.guarantee?.name}"/>
                        <div class="cur-variation"
                             id="cur-variation-0">${defaultModel?.guarantee?.name}</div>

                        <div class="hover-variation"></div>
                        <g:hiddenField id="variation0" name="guarantee" value="${defaultModel?.guarantee?.id}"/>
                    </div>
                </g:if>
                <g:set var="gList" value="${ProductModel.findAllByProduct(product).collect { it.guarantee }.toSet()}"/>
                <g:if test="${gList.count { it } > 1}">
                    <div class="variation-value" variationId="0">
                        <g:each in="${gList}">
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