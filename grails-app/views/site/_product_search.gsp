<%@ page import="eshop.Product" %>
<li class="span3">
    <div class="thumbnail" style="overflow:hidden;">
        <div>
            <div style="height:278px;">
                <img src="<g:createLink action="image" params="[id: product?.id, wh: '150x150']"/>"/>

                <div class="caption">
                    <h4>${product.name}</h4>
                    <g:if test="${mainVal}">
                        <p>
                            <small>
                                <span class="badge">
                                    <strike><g:formatNumber number="${mainVal}" type="number"/></strike>
                                </span>
                            </small>
                            <span class="badge badge-success"><g:formatNumber number="${showVal}" type="number"/></span>
                        </p>
                    </g:if>
                    <p>
                        <a class="btn btn-primary" href="#"><g:message code="buy"/></a>
                        <a class="btn" href="<g:createLink action="product" params="[id: product.id]"/>"><g:message
                                code="details"/></a>
                    </p>
                </div>
            </div>

            <div style="height: 278px;">
                Product Description:
                ${product.details}
                <p>
                    <a class="btn btn-primary" href="#"><g:message code="buy"/></a>
                    <a class="btn" href="<g:createLink action="product" params="[id: product.id]"/>"><g:message
                            code="details"/></a>
                </p>
            </div>
        </div>
    </div>
</li>