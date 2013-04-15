<%@ page import="eshop.Product" %>

<div class="thumbnail mediaholder">
    <a class="thumbnail-link" href="<g:createLink controller="site" action="product" params="[id: product.id]"/>" class="title">
        <div class="content">
            <div class="main">
                <span class="image">
                    <span>
                        <span>
                            <img src="<g:createLink controller="site" action="image" params="[id: product?.id, wh: '150x150']"/>"/>
                        </span>
                    </span>
                </span>
                <h4>${product}</h4>
                <eshop:thumbnailPrice productId="${product.id}"></eshop:thumbnailPrice>
            </div>

            <div class="extended">
                <div>
                    <div class="attributes scrollable"
                         onmousedown="event.preventDefault ? event.preventDefault() : event.returnValue = false">
                        <div class="attribute-list">
                            <g:each in="${product.attributes}">
                                <g:if test="${it.value.toString().compareTo("N/A") != 0}">
                                    <div><b>${it.attributeType}:</b> ${it.value}</div>
                                </g:if>
                            </g:each>
                        </div>
                    </div>

                    <div>
                        <eshop:addToBasket prodcutId="${product.id}"
                                           productTitle="${product.toString()}"></eshop:addToBasket>
                        <eshop:addToCompareList prodcutId="${product.id}"
                                           productTitle="${product.toString()}"></eshop:addToCompareList>
                        <eshop:addToWishList prodcutId="${product.id}"
                                                productTitle="${product.toString()}"></eshop:addToWishList>
                    </div>
                </div>
            </div>
        </div>
    </a>
</div>
