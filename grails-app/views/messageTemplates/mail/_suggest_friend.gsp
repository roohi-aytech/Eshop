<a href="<g:createLink uri="/product/${product?.id}" absolute="true"/>">
    <img src="<g:createLink controller="image" action="index" absolute="true"
                                 params="[id: product?.id, wh: size?:'200x200']"/>">

    <div class="title">
        <h4>${product?.manualTitle ? product?.pageTitle : "<span>${product?.productTypes?.find { true }?.name ?: ""} ${product?.type?.title ?: ""} ${product?.brand?.name ?: ""}</span><br/> ${product?.name ?: ""}"}</h4>
    </div>
</a>
<p>
    دوست شما ${name}، ${product?.manualTitle ? product?.pageTitle : "<span>${product?.productTypes?.find { true }?.name ?: ""} ${product?.type?.title ?: ""} ${product?.brand?.name ?: ""}</span><br/> ${product?.name ?: ""}"} در <g:link uri="/" absolute="true">فروشگاه اینترنتی <g:message code="name"/></g:link> را به شما توصیه نموده است.
</p>
