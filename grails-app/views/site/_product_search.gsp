<%@ page import="eshop.Product" %>

<div class="thumbnail mediaholder">
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
                <div class="attributes">
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
                    <a class="btn btn-compare" title="${message(code: 'add-to-compareList')}"><span>${message(code: 'add-to-compareList')}</span>
                    </a>
                    <a class="btn btn-wish" title="${message(code: 'add-to-wishList')}"><span>${message(code: 'add-to-wishList')}</span></a>
                </div>
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
