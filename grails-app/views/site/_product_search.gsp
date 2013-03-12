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
                        <a class="btn btn-success btn-shop" href="#"><g:message code="add-to-basket"/></a>
                    </p>
                    <g:if test="${product.details}">
                        <p class="details">
                            ${product.details}
                        </p>
                    </g:if>
                </div>
            </div>
        </div>
    </div>
</li>