<div class="thumbnail mediaholder small pro_first_box" id="productThumbnail_${product?.id}">
    <a href="<g:createLink uri="/product/${product?.id}"/>">
        <img src="${resource(dir: '/images/goldaan', file: 'loadinfo.net.gif')}"
             data-src="<g:createLink controller="image" action="index"
                                     params="[id: product?.id, wh: size?:'100x100']"/>"
             class="lazy" id="lazy-${product?.id}">

        <div class="title">
            <h4>${product?.manualTitle ? product?.pageTitle : "<span>${product?.productTypes?.find { true }?.name ?: ""} ${product?.type?.title ?: ""} ${product?.brand?.name ?: ""}</span><br/> ${product?.name ?: ""}"}</h4>
            <eshop:thumbnailPrice productId="${product?.id}" hideLastUpdate="true"/>
            %{--<eshop:statusFlag productId="${product.id}"/>--}%
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
            <a class="btn-email" href="mailto:?${product.manualTitle ? product.pageTitle : title}&Body=I%20saw%20this%20and%20thought%20of%20you!%20 ${createLink(uri: "/product/${product?.id}", absolute: true)}">
                <span><g:message code="email-to-firend-goldaan" /></span>
            </a>
        </div>
        
    %{--</div>--}%
</div>