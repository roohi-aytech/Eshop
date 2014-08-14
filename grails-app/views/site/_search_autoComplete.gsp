<div>
    <ul>
    %{--<div class="span" style="display: none;"></div>--}%
        <g:each in="${productIds}" status="i" var="productId">
            <g:set var="productModel" value="${eshop.ProductModel.get(productId)}"/>
            <g:if test="${productModel}">
                <li>
                    <a href="${createLink(uri: "/product/${productModel?.product?.id}?model=${productModel?.id}")}">
                        <table>
                            <tr>
                                <td rowspan="2">
                                    <img src="${createLink(controller: 'image', params: [id: productModel?.id, wh: '50x50', type: 'productModel'])}"/>
                                </td>
                                <td>
                                    <h4>${productModel}</h4>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <eshop:thumbnailPrice productModelId="${productModel.id}" hideLastUpdate="true"/>
                                </td>
                            </tr>
                        </table>
                    </a>
                </li>
            </g:if>
        </g:each>
    </ul>
</div>