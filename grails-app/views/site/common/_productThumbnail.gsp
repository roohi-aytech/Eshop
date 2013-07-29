<%@ page import="eshop.Product" %>

<div class="thumbnail mediaholder">
    <a href="<g:createLink uri="/product/${product.id}"/>">
        <img src="<g:createLink controller="site" action="image"
                                params="[id: product?.id, wh: '150x150']"/>"/>

        <div class="title">
            <h4>${product.manualTitle ? product.pageTitle : product.toString()}</h4>
            <eshop:thumbnailPrice productId="${product.id}"></eshop:thumbnailPrice>
        </div>

        <div class="attributes scrollable"
             onmousedown="event.preventDefault ? event.preventDefault() : event.returnValue = false">
            <div class="attribute-list">
                <g:each in="${product.attributes.findAll{it.attributeType.showPositions.contains('productList') && it.value && it.value.toString().compareTo("N/A") != 0}.sort{it.attributeType.sortIndex}}">
                    %{--<g:if test="${it.attributeType.showPositions.contains('productList') && it.value.toString().compareTo("N/A") != 0}">--}%
                        <div><b>${it.attributeType}:</b> ${it.value.toString().contains('\n')? '<br/>' + it.value.toString().replace('\n', '<br/>'): it.value}</div>
                    %{--</g:if>--}%
                </g:each>
            </div>
        </div>
    </a>
    <div class="tips-container"></div>
    <div class="buttons">
        <eshop:addToBasket prodcutId="${product.id}" image="true"></eshop:addToBasket>
        <eshop:addToCompareList prodcutId="${product.id}" image="true"></eshop:addToCompareList>
        <eshop:addToWishList prodcutId="${product.id}" image="true"></eshop:addToWishList>
    </div>
</div>
