<g:if test="${productModel}">

    <div class="department-head">

        <g:if test="${grailsApplication.config.eShop.instance == 'goldaan'}">
            <h1>
                <span class="dark-grey">
                    ${product?.manualTitle ? product?.pageTitle : product?.title}
                    ${name}
                </span>
            </h1>

            <h3>
                <span class="dark-grey">
                    <g:message code="seller-goldaan"/>: ${product?.brand?.name ?: ""}
                </span>
            </h3>
            <br/>
        </g:if>
        <g:else>
            <h1>
                <span class="dark-grey">
                    ${productModel?.product?.productTypes?.find {
                        true
                    }?.name ?: ""} ${productModel?.product?.type?.title ?: ""} ${productModel?.product?.brand?.name ?: ""} <g:message
                            code="productModel"/> ${productModel?.name ?: ""}
                </span>
            </h1>
        </g:else>

    </div>

    <% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
    <g:set var="price" value="${priceService.calcProductModelPrice(productModel.id)}"/>
    <g:set var="oldPrice" value="${priceService.calcProductModelOldPrice(productModel.id)}"/>
    <g:if test="${price.showVal}">

        <div class="product-price">
            <g:if test="${grailsApplication.config.eShop.instance != 'goldaan'}">
                <div class="retail-price">
                    <h4><span class="price_label"><g:message code="oldPrice"/></span>
                        <del>
                            <g:formatNumber number="${oldPrice.showVal}" type="number"/>
                            <eshop:currencyLabel/>
                        </del>
                    </h4>
                </div>
            </g:if>
            <div class="red pay-price">
                <h3><span class="price_label"><span class="red"><g:message code="price"/></span></span> <span
                        class="price"><span id="price-val">
                        <g:formatNumber number="${price.showVal}" type="number"/></span> <eshop:currencyLabel/></span>
                </h3>
            </div>

            <div class="clearfix"></div>

            <div class="clear"></div>
        </div>
    </g:if>

</g:if>