<div class="product_block four_column" id="productThumbnail_${productModel?.id}">
    <div class="image">
        <a title="${productModel}"
           href="${createLink(uri: "/product/${productModel?.product?.id}?model=${productModel?.id}")}">
            <img width="236px" height="260px" border="0"
                 src="${resource(dir: '/images/felfel', file: 'grey.gif')}"
                 data-src="${createLink(controller: 'image', params: [id: productModel?.id, wh: '300x300', type: 'productModel'])}"
                 class="lazy" id="lazy-${productModel?.id}"></a></div>

    <div class="details">
        <div class="product-name">
            <a title="${productModel}"
               href="${createLink(uri: "/product/${productModel?.product?.id}?model=${productModel?.id}")}">
                %{--<p>${productModel?.product?.productTypes?.find {--}%
                    %{--true--}%
                %{--}?.name ?: ""} ${productModel?.product?.type?.title ?: ""} ${productModel?.product?.brand?.name ?: ""} <g:message--}%
                        %{--code="productModel"/> ${productModel?.name ?: ""}</p>--}%
                <p>${productModel}</p>
            </a>
        </div>

        <div class="subtitle">
            <a href="${createLink(uri: "/product/${productModel?.product?.id}?model=${productModel?.id}")}">
                <p>
                    ${productModel?.product?.description}
                </p>
            </a>
        </div>
    </div>

    <div class="price_info">
        <div class="price_block">
            <p class="pre_price">
                <eshop:thumbnailOldPrice productModelId="${productModel?.id}"/>
            </p>

            <p class="our_price">
                <span class="you_pay"><g:message code="price"/></span>
                <span class="red"><eshop:thumbnailPrice productModelId="${productModel?.id}"/></span>
            </p>
        </div>

        <div class="cta_block">
            <div class="btn-cart-loading">
                <eshop:addToBasket prodcutModelId="${productModel?.id}" buttonOnly="${true}" animate="true"/>
                <img width="18"
                     height="18"
                     src="${resource(dir: 'images/felfel', file: 'loading1.gif')}"
                     style="display:none;"
                     id="load-cart-1113409"/>
            </div>

            <div class="quick_view_loading">
                <a onclick="quickViewProduct(${productModel?.product?.id}, ${productModel?.id});" href="javascript://"
                   class="quick_view" id="load-quick-a-${productModel?.id}"></a>
                <img width="18" height="18"
                     src="${resource(dir: 'images/felfel', file: 'loading1.gif')}"
                     style="display:none;position:relative; left:0px;"
                     id="load-quick-${productModel?.id}">
            </div>


            <div class="compare_icon_loading">
                <eshop:addToCompareList prodcutId="${productModel?.product?.id}" buttonOnly="${true}"/>
                <img width="18" height="18" src="${resource(dir: 'images/felfel', file: 'loading1.gif')}"
                     style="display:none;"
                     id="load-wish-1113409"/>
            </div>

            <div class="wishlist_icon_loading">
                <eshop:addToWishList prodcutId="${productModel?.product?.id}" buttonOnly="${true}"/>
                <img width="18" height="18" src="${resource(dir: 'images/felfel', file: 'loading1.gif')}"
                     style="display:none;"
                     id="load-wish-1113409"/>
            </div>

        </div>

        <div class="clearfix">

        </div>
    </div>
</div>

