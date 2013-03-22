<%@ page import="eshop.Product" %>
<li class="span3">
    <div class="thumbnail">
        <div class="content">
            <div class="main">
                <a href="<g:createLink action="product" params="[id: product.id]"/>" class="title">
                    <span class="image">
                        <span>
                            <img src="<g:createLink action="image" params="[id: product?.id, wh: '150x150']"/>"/>
                        </span>
                    </span>
                    <h4>${product}</h4>
                </a>
                <eshop:thumbnailPrice productId="${product.id}"></eshop:thumbnailPrice>
            </div>

            <div class="extended">
                <div>
                    <p>
                        <eshop:addToBasket prodcutId="${product.id}" productTitle="${product}"></eshop:addToBasket>
                        <a class="btn btn-primary btn-compare" href="#" title="${message(code:'add-to-compareList')}"><span></span></a>
                        <a class="btn btn-danger btn-wish" href="#" title="${message(code:'add-to-wishList')}"><span></span></a>
                    </p>
                    <g:if test="${product.details}">
                        <h5><g:message code="product-details"></g:message></h5>
                        <span class="details">
                            ${product.details}
                        </span>
                    </g:if>
                </div>
            </div>
        </div>
    </div>
</li>