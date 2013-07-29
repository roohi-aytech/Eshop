<link rel="stylesheet" href="${resource(dir: 'css', file: 'zanbil.css')}"/>

<div>
    <ul>
    %{--<div class="span" style="display: none;"></div>--}%
        <g:each in="${productIds}" status="i" var="productId">
            <g:set var="product" value="${eshop.Product.get(productId)}"/>
            <g:if test="${product}">
                <li>
                    <a href="${createLink(controller: 'site', action: 'product', params: [id: product.id])}">
                        <table>
                            <tr>
                                <td rowspan="2">
                                    <img src="${createLink(controller: 'image', params: [id: product.id, wh: '50x50'])}"/>
                                </td>
                                <td>
                                    <h4>${product.manualTitle ? product.pageTitle : product.toString()}</h4>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <eshop:thumbnailPrice productId="${product.id}"></eshop:thumbnailPrice>
                                </td>
                            </tr>
                        </table>
                    </a>
                </li>
            </g:if>
        </g:each>
    </ul>
</div>