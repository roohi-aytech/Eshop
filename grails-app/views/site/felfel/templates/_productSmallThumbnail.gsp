<div class="more_from_product_block">
    <div class="prod_img">
        <a href="<g:createLink uri="/product/${product.id}"/>">
            <img width="150"
                 height="165"
                 src="${resource(dir: '/images/felfel', file: 'grey.gif')}"
                 class="lazy image" id="lazy-${product?.id}"
                 data-src="<g:createLink controller="image" action="index"
                                    params="[id: product?.id, wh: '150x150']"/>">
        </a>
    </div>

    <p class="prod_title">
        <a href="<g:createLink uri="/product/${product.id}"/>">${product}</a>
    </p>

    <p class="prod_price"><eshop:thumbnailPrice productId="${product.id}" hideLastUpdate="true"/></p>

    <p class="strike_price">
        <span class="strike_through">
        <eshop:thumbnailOldPrice productId="${product.id}"/>
        </span>
    </p>

</div>