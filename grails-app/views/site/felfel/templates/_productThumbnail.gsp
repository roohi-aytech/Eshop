<div class="product_block four_column">
    <div class="image">
        <a title="${product}" href="${createLink(uri: "/product/${product?.id}")}">
            <img width="236px" height="260px" border="0"
                 src="${resource(dir: '/images/felfel', file: 'grey.gif')}"
                 data-src="${createLink(controller: 'image', params: [id: product?.id, wh: '300x300'])}"
                 class="lazy" id="lazy-${product?.id}"></a></div>

    <div class="details">
        <div class="product-name">
            <a title="${product}"
               href="${createLink(uri: "/product/${product?.id}")}">
                <p>${product}</p>
            </a>
        </div>

        <div class="subtitle">
            <a href="${createLink(uri: "/product/${product?.id}")}">
                <p>
                    ${product.description}
                </p>
            </a>
        </div>
    </div>

    <div class="price_info">
        <div class="price_block">
            <p class="pre_price">
                <eshop:thumbnailOldPrice productId="${product.id}"/>
            </p>

            <p class="our_price">
                <span class="you_pay"><g:message code="price"/></span>
                <span class="red"><eshop:thumbnailPrice productId="${product.id}"/></span>
            </p>
        </div>

        <div class="cta_block">
            <div class="btn-cart-loading">
                <eshop:addToBasket prodcutId="${product.id}" buttonOnly="${true}"/>
                <img width="18"
                     height="18"
                     src="${resource(dir:'images/felfel', file: 'loading1.gif')}"
                     style="display:none;"
                     id="load-cart-1113409"/>
            </div>

            <div class="wishlist_icon_loading">
                <eshop:addToWishList prodcutId="${product.id}" buttonOnly="${true}"/>
                <img width="18" height="18" src="${resource(dir:'images/felfel', file: 'loading1.gif')}" style="display:none;"
                     id="load-wish-1113409"/>
            </div>

            <div class="quick_view_loading">
                <a onclick="javascript:quick_view(1113409);" href="javascript://"
                   class="quick_view" id="load-quick-a-1113409"
                   title="Quick View"></a>
                <img width="18" height="18"
                     src="${resource(dir:'images/felfel', file: 'loading1.gif')}"
                     style="display:none;position:relative; left:0px;"
                     id="load-quick-1113409"></div></div>

        <div class="clearfix">

        </div>
    </div>
</div>

