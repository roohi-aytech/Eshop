<div class="thumbnail mediaholder small" id="productThumbnail_${product?.id}">
    <a href="<g:createLink uri="/product/${product.id}"/>">
        <img src="${resource(dir: '/images/goldaan', file: 'loadinfo.net.gif')}"
             data-src="<g:createLink controller="image" action="index"
                                     params="[id: product?.id, wh: '100x100']"/>"
             class="lazy" id="lazy-${product?.id}">

        <div class="title">
            <h4>${product.manualTitle ? product.pageTitle : "<span>${product.productTypes?.find {true}?.name?:""} ${product.type?.title?:""} ${product.brand?.name?:""}</span><br/> ${product.name?:""}"}</h4>
            <eshop:thumbnailPrice productId="${product.id}" hideLastUpdate="true"/>
            %{--<eshop:statusFlag productId="${product.id}"/>--}%
        </div>
    </a>
</div>