<li style="height: 455px;">
    <a href="${createLink(uri: "/product/${productModel?.product?.id}?model=${productModel?.id}")}">
        <div class="product-info">
            <img border="0"
                 src="${grailsApplication.config.eShop.instance=='goldaan'?resource(dir: '/images/goldaan', file: 'loadinfo.net.gif'):resource(dir: '/images/felfel', file: 'loading1.gif')}"
                 data-src="${createLink(controller: 'image', params: [id: productModel?.id, wh: '300x300', type: 'productModel'])}"
                 class="lazy" id="lazy-${productModel?.id}" style="display: inline-block;">

            <h2 href="#">${productModel?.product}</h2>

            <div class="price">
                <h5><del><eshop:thumbnailOldPrice productModelId="${productModel?.id}"/></del></h5>
                <h5><eshop:thumbnailPrice productModelId="${productModel?.id}" hideLastUpdate="true"/></h5>
            </div>
        </div>
    </a>
</li>