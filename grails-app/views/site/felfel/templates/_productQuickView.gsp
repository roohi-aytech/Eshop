<div itemscope itemtype="http://schema.org/Product">

    <div class="quick-view">
        <div class="product_img_left_block">
            <g:render template="/site/felfel/templates/product/zoom" key="${params.id}"/>
            <div class="roolover-product-box">
                <div class="rollover"><g:message code="zoom.help"/></div>
            </div>

            <div class="share_block">

                <p>
                    <a title="Share on Facebook" target="_blank"
                       href="http://www.facebook.com/sharer/sharer.php?u=${createLink(uri:'/product/' + product.id, absolute: true)}"
                       rel="nofollow" class="facebook"></a>

                    <a onclick="javascript:window.open('http://twitter.com/home?status=Check out the ${createLink(uri:'/product/' + product.id, absolute: true)}', 'target=_pearent', 'width=820,height=455')"
                       href="javascript://" class="twitter"></a>



                    <a count-layout="horizontal" class="pint"
                       href="JavaScript:newPopup('http://pinterest.com/pin/create/button/?url=${createLink(uri:'/product/' + product.id, absolute: true)}&amp;media=http://i1.pepperfry.com/media/catalog/product/i/n/150x165/inalsa-maxie-plus-food-processor--white--inalsa-maxie-plus-food-processor--white--mtkjxg.jpg&amp;description=Inalsa Wonder Maxie Plus Food Processor - The Inalsa Wonder Maxie plus Food Processor (White) is a full juice processor combination available in the glossy white color. With the polycarbonate processing bowl Free Shipping across India &amp; Quality Guarant');"><span></span>
                    </a>

                    <eshop:addToWishList useLongText="true" prodcutId="${product.id}"/>
                    <eshop:addToCompareList useLongText="true" prodcutId="${product.id}"/>
                </p>

                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>

        <div class="product_detail_right_block">
            <div class="product-card-content" id="product-card">
                <g:render template="/site/felfel/templates/product/card" key="${params.id}"
                          model="${[product: product, productModel: eshop.ProductModel.findByProductAndIsDefaultModel(product, true), addedValues: addedValues, selectedAddedValues: selectedAddedValues]}"/>
            </div>


            <div class="options">
                <div class="column-left">
                    <p class="brand-badge">
                        <img width="80px" height="80px" itemprop="brand"
                             src="${createLink(controller: 'image', params: [id: product?.brand?.id, type: 'brand'])}"
                             alt="${product?.brand}"/>
                    </p>

                    <p>
                        <g:message code="productCode.label"/>: <b>${params.id}</b>
                    </p>

                    <div itemprop="aggregateRating">
                        <span class="meta" itemprop="value">${rate}</span>
                        <meta itemprop="best" content="5"/>
                        <eshop:rate identifier="hidProductRate" currentValue="${rate}"
                                    readOnly="true"/>
                    </div>
                </div>

                <ehcache:render template="product/variation" key="${params.id}"/>

                <div class="product-additives">
                    <g:render template="product/additives"/>
                    <script language="javascript" type="text/javascript">
                        $('.addedValues .item').tipsy({gravity: 'e'});
                    </script>
                </div>

                <div class="clearfix"></div>
            </div>

            <div id="shoppingPanel">
                <g:render template="/site/felfel/templates/product/shoppingPanel"
                          model="${[product: product, productModel: eshop.ProductModel.findByProductAndIsDefaultModel(product, true), addedValues: addedValues, selectedAddedValues: selectedAddedValues]}"/>
            </div>
        </div>

        <div class="clearfix"></div>
    </div>
</div>


<div id="priceHistogramModal" class="modal hide fade" tabindex="-1" role="window"
     aria-labelledby="priceHistogramModalLabel" aria-hidden="true" style="width: 700px;">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                onclick="hidePriceHistogram();">×</button>
    </div>

    <div class="modal-body">
    </div>
</div>


<script language="javascript" type="text/javascript">
    var modal;
    function showPriceHistogram(id) {
        $("#priceHistogramModal .modal-body").html('<img class="loading" src="${resource(dir: 'images', file: 'loading.gif')}"/>');
        if (modal) {
            modal.show();
            $('#priceHistogramModal').addClass('in');
        }
        else {
            modal = $("#priceHistogramModal").modal({
                backdrop: false,
                show: true
            });
        }
        $("#priceHistogramModal .modal-body").load('${createLink(controller: 'productModel', action: 'priceHistogram')}/' + id, function () {
        });
    }

    function hidePriceHistogram() {
        $('#priceHistogramModal').removeClass('in');
        modal.hide();
    }
</script>