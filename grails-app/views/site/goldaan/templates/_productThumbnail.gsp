<div itemscope itemtype="http://schema.org/Product" class="thumbnail mediaholder small pro_first_box"
     id="productThumbnail_${product?.id}">
    <a itemprop="url" href="<g:createLink uri="/product/${product?.id}"/>">
        <img src="${resource(dir: '/images/goldaan', file: 'loadinfo.net.gif')}"
             data-src="<g:createLink controller="image" action="index"
                                     params="[id: product?.id, wh: size ?: '200x200']"/>"
             class="lazy" id="lazy-${product?.id}">
        <meta itemprop="image"
              content="${createLink(controller: "image", action: "index", params: [id: product?.id, wh: size ?: '300x300'])}">

        <div class="title">
            <g:set var="modelCount" value="${product?.models?.findAll { it.status == 'exists' }.size()}"/>
            <h4 class="no-margin" itemprop="name">
                ${product?.manualTitle ? product?.pageTitle : "<span>${product?.productTypes?.find { true }?.name ?: ""} ${product?.type?.title ?: ""} ${product?.brand?.name ?: ""}</span><br/> ${product?.name ?: ""}"}
            <span class="smaller">(<g:message code="modelCount-flag" args="[modelCount]"/>)</span>
            </h4>


            <g:if test="${modelCount>1}">
                <span class="price">
                    <g:message code="start-from"/>
                </span>
            </g:if>
            <eshop:thumbnailPrice productId="${product?.id}" hideLastUpdate="true" />
            %{--<eshop:statusFlag productId="${product.id}"/>--}%
        </div>

        <div class="hidden">
            <span itemprop="brand" itemscope itemtype="http://schema.org/Brand">
                <span itemprop="name">${product?.brand}</span>
            </span>
        </div>
    </a>
    %{--<div class="pro_first_box" style="height: 40px">--}%
    <g:set var="classes" value="hover_fly  fly_2 clearfix"/>
    <g:if test="${hideActionLabels}">
        <g:set var="classes" value="top-left-actions"/>
    </g:if>

    <div class="${classes}">
        <eshop:addToBasket prodcutId="${product.id}" angular="false" buttonOnly="${true}"
                           useLongText="${true}"/>
        %{--<eshop:addToCompareList prodcutId="${product.id}" productTitle="${product.toString()}" useLongText="${true}"/>--}%
        <a class="btn-email" href="javascript:suggestFriend(${product.id})">
            <span><g:message code="email-to-firend-goldaan"/></span>
        </a>
    </div>

    %{--</div>--}%
</div>