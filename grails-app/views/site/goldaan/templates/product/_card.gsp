<script language="javascript" type="text/javascript">

    var selectedAddedValues = [${selectedAddedValues.collect{it.id}.join(',')}];
    $(document).ready(function () {
        $('#selectedAddedValues').val(selectedAddedValues.toString());
    });
    function addToBasket(id, name, price) {
        var scope = angular.element(document.getElementById('main-container')).scope();
        scope.selectedAddedValues = selectedAddedValues;
        scope.addToBasket(id, name, price, selectedAddedValues);
    }

    function addOrRemoveAddedValue(item) {

        var i = selectedAddedValues.indexOf(parseInt($(item).val()));
        if (i != -1)
            selectedAddedValues.splice(i, 1);
        else
            selectedAddedValues[selectedAddedValues.length] = parseInt($(item).val());

        $('#selectedAddedValues').val(selectedAddedValues.toString());
        var $form = $("#productVariationForm");
        var serializedData = $form.serialize();
        $('#product-card').html('${message(code: 'waiting')}');
        angular.element(document.getElementById('main-container')).scope().reloadProductCart("${createLink(controller: "site", action: "productCard")}", serializedData, $('#product-card'));
    }
</script>

%{--<h3><g:message code="order.specifications-goldaan"/></h3>--}%
<g:if test="${productModel}">

    %{--<h4>${product?.type?.title ?: (productModel?.product?.productTypes?.find { true }?.name ?: "")} ${product?.name ?: ""}</h4>--}%
    <p>
        <g:message code="productCode.label-goldaan"/>: <b>${product.id}</b>
    </p>
%{--variation select--}%
    %{--<g:each in="${product?.variations}">--}%
        %{--<div class="product-variation">--}%
            %{--<div class="variation-title">--}%
                %{--${it.name}:--}%
                %{--<div class="cur-variation">${productModel?.variationValues.find { value -> value.variationGroup.id == it.variationGroup.id }}</div>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</g:each>--}%
    <% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
    <g:set var="price"
           value="${priceService.calcProductModelPrice(productModel.id, selectedAddedValues.collect { it.id })}"/>

    <g:if test="${price.showVal}">
        <table class="table-simulated price-table">
            <tr itemprop="brand" itemscope itemtype="http://schema.org/Brand">
                <td>
                    <g:message code="seller-goldaan"/>:
                </td>
                <td  itemprop="name">
                    ${product?.brand?.name ?: ""}
                </td>
            </tr>
            <tr itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                <td>
                    <g:message code="price"/>:
                </td>
                <td itemprop="price">
                    <g:formatNumber
                            number="${price.showVal}" type="number"/> <eshop:currencyLabel/>
                </td>
            </tr>
            <g:each in="${selectedAddedValues.findAll { it.processTime != 'mandetory' }}" var="addedValue">
                <tr>
                    <td>
                        ${addedValue.name}:
                    </td>
                    <td>
                        <g:if test="${addedValue.type == 'percent'}">
                            <g:formatNumber number="${Math.round((addedValue.value * price.showVal) / 100)}"
                                            type="number"/> <eshop:currencyLabel/>
                        </g:if>
                        <g:else>
                            <g:formatNumber number="${addedValue.value}" type="number"/> <eshop:currencyLabel/>
                        </g:else>
                    </td>
                </tr>
            </g:each>
            <g:if test="${selectedAddedValues.any { it.processTime != 'mandetory' }}">
                <tr>
                    <td colspan="2">
                        <hr/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <g:message code="basket.totalPrice"/>:
                    </td>
                    <td>
                        <g:formatNumber
                                number="${price.showVal + price.addedVal}" type="number"/> <eshop:currencyLabel/>
                    </td>
                </tr>
            </g:if>
        </table>
    </g:if>

    <div class="buttons">
        <g:if test="${productModel?.status=='exists'}">
            <eshop:addToBasket prodcutModelId="${productModel.id}"
                productModelTitle="${productModel}" angular="false" buttonOnly="${true}"
                useLongText="${true}"/>
        </g:if>
        <a id="productThumbnail_${product.id}" class="btn-email" href="javascript:suggestFriend(${product.id})">
            <span><g:message code="email-to-firend-goldaan" /></span>
        </a>
    </div>
        %{--<div class="pro_first_box" style="height: 40px">--}%


            %{--<div class="hover_fly  fly_3 clearfix">--}%

                %{--<a data-id-product="10" title="Add to cart" rel="nofollow" href="http://transformer.sunnytoo.com/en/cart?qty=1&amp;id_product=10&amp;token=5f2d2499e3a3ae4c0e39accff9ed1f04&amp;add" class="exclusive ajax_add_to_cart_button"><div><i class="icon-basket icon-0x icon-mar-lr2"></i><span>Add to cart</span></div></a>--}%

                %{--<a rel="http://transformer.sunnytoo.com/en/fashion/10-beautiful-lace-half-sleeve-casual-party-jacket-1234567890123.html" href="http://transformer.sunnytoo.com/en/fashion/10-beautiful-lace-half-sleeve-casual-party-jacket-1234567890123.html" class="quick-view"><div><i class="icon-search-1 icon-0x icon-mar-lr2"></i><span>Quick view</span></div></a>--}%
                %{--<a data-product-name="Beautiful Lace Half-Sleeve Casual/Party Jacket" data-product-cover="http://transformer.sunnytoo.com/17-thumb_default/beautiful-lace-half-sleeve-casual-party-jacket.jpg" rel="nofollow" data-id-product="10" href="http://transformer.sunnytoo.com/en/fashion/10-beautiful-lace-half-sleeve-casual-party-jacket-1234567890123.html" class="add_to_compare"><div><i class="icon-ajust icon-0x icon-mar-lr2"></i><span>Add to compare</span></div></a>--}%


                %{--<eshop:addToCompareList prodcutId="${product.id}" productTitle="${product.toString()}" useLongText="${true}"/>--}%
                %{--<a onclick="WishlistCart('wishlist_block_list', 'add', '10', false, 1,this); return false;" rel="10" href="#" class="addToWishlist wishlistProd_10"><div><i class="icon-heart icon-0x icon-mar-lr2"></i><span>Add to Wishlist</span></div></a>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</div>--}%
</g:if>
<g:else>
    <g:message code="product.model.notExists-goldaan"/>
</g:else>
