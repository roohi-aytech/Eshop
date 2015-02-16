<div class="home_cms_best_sellers ${className}">
    <a href="${href}">
        <img border="0" alt="${name}"
        src="${createLink(controller: 'image', params: [type: 'productType', id: id, wh: '300x300'])}" title="${name}"/>
    </a>

    <div class="details">
        <div class="title">
            <a href="${href}">${name}</a>
        </div>

        <div class="subtitle">${description}</div>
    </div>

    <div class="price_info">
        <p><g:message code="menu.startPrice"/> <span class="red"><eshop:productTypeMinPrice productTypeId="${id}"/> <eshop:currencyLabel/></span></p>
        <a href="${href}" class="shop_now">
            <img width="64" height="18" alt="" src="${resource(dir:'/images/felfel', file: 'shop_icon.jpg')}"/>
        </a>

        <div style="height: 1px;" class="clearfix">&nbsp;</div>
    </div>
</div>