<%@ page import="eshop.Product" %>

<div class="thumbnail mediaholder small">
    <a href="<g:createLink uri="/product/${product.id}"/>">
        <img src="<g:createLink controller="site" action="image"
                                params="[id: product?.id, wh: '100x100']"/>"/>

        <div class="title">
            <h4>${product.manualTitle ? product.pageTitle : product.toString()}</h4>
            <eshop:thumbnailPrice productId="${product.id}"/>
        </div>
    </a>
</div>