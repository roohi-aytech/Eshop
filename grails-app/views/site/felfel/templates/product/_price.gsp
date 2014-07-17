<g:if test="${productModel}">
    <% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
    <g:set var="price" value="${priceService.calcProductModelPrice(productModel.id)}"/>
    <g:set var="oldPrice" value="${priceService.calcProductModelOldPrice(productModel.id)}"/>
    <g:if test="${price.showVal}">

        <div class="price_block" itemtype="http://schema.org/Offer" itemscope="" itemprop="offers">
            <div class="selling_price">
                <ul class="new_pricing_block retail_price_only">
                    <g:if test="${oldPrice.showVal > price.showVal}">
                        <li class="first"><g:message code="oldPrice"/></li>
                        <li>
                            <span class="strike_through">
                                <g:formatNumber number="${oldPrice.showVal}" type="number"/>
                                <eshop:currencyLabel/>
                            </span>
                        </li>
                    </g:if>
                </ul>
                <meta content="IRR" itemprop="priceCurrency">
                <ul class="new_pricing_block last">
                    <li class="first you_pay"><g:message code="price"/></li>
                    <li class="our_price_red" itemprop="price"><span><g:formatNumber number="${price.showVal}"
                                                                                     type="number"/> <eshop:currencyLabel/></span></li>
                </ul>
            </div>

            <div class="offer_block arrow_coupon_box">
                <div class="offer_image_block">
                    <img alt="" src="${resource(dir: 'images/felfel', file: 'best_price.png')}">
                </div>

                <div class="offer_details">
                    <div class="offer_details_title">
                        <g:message code="product.price.info.title"/>
                    </div>

                    <p class="coupon_detail">
                        <g:message code="product.price.info.body"
                                   args="${[rg.formatJalaliDate(date: price.lastUpdate)]}"/>
                    </p>
                </div>

                <div style="height: 1px;" class="clearfix">&nbsp;</div>

                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

            <div class="clearfix"></div>

            <div class="retail_price_block">

                <a id="priceHistogram" class="priceHistogram"
                   onclick="showPriceHistogram(${productModel.id});">
                    <g:message code="productModel.priceHistogram"/>
                </a>

            </div>

        </div>
    </g:if>
    <g:else>

        <div class="price_block">
            <g:message code="product.model.notExists"/>
        </div>
    </g:else>
</g:if>