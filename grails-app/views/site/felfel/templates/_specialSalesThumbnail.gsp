<div class="home_cms_best_sellers four_column">
    <a href="${createLink(controller: 'site', action: 'product', params: [id: slide.product.id])}" class="image_bdr">
        <img width="237" height="234" border="0" alt="${slide.product}" src="${createLink(controller: "image", action: "index")}/${slide.id}?type=specialSale" title="${slide.product}">
    </a>
    <div class="details">
        <div class="title">
            <a href="${createLink(controller: 'site', action: 'product', params: [id: slide.product.id])}">${slide.product}</a>
        </div>
    </div>
    <div class="price_info">
        <p>
            <span class="pre_price"><eshop:thumbnailOldPrice productId="${slide.product.id}"/></span>
            <br/>
            <span class="red"><eshop:thumbnailPrice productId="${slide.product.id}" hideLastUpdate="true"/></span>
        </p>
        <a href="${createLink(controller: 'site', action: 'product', params: [id: slide.product.id])}" class="shop_now">
            <img width="64" height="18" alt="" src="${resource(dir: 'images/felfel', file: 'shop_icon.jpg')}">
        </a>
        <div style="height: 1px;" class="clearfix">&nbsp;</div>
    </div>
</div>