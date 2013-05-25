<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 4/23/13
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site">
    <title><g:message code="compare"/></title>
</head>

<body>

<div class="tabbable">
    <ul class="nav nav-tabs">
        <g:each in="${productTypeList}" var="productType">
            <li><a href="#tab${productType.item.id}" data-toggle="tab">
                %{--<img src="${createLink(controller: 'image', params:[type:'productType', id:productType.item.id, wh:'50x50'])}"/>--}%
                ${productType.item.name}</a></li>
        </g:each>
    </ul>

    <div class="tab-content">
        <g:each in="${productTypeList}" var="productType">
            <div id="tab${productType.item.id}" class="tab-pane">
                <table class="attribute-list">
                    <tr>
                        <th></th>
                        <g:each in="${productType.products}" var="product">
                            <th>
                                <b>
                                    <a href="${createLink(controller: 'site', action: 'product', params: [id: product.id])}">${product}</a>
                                </b>
                                <span class="delete">
                                    [ <a href="${createLink(controller: 'comparison', action:'remove', params:[id: product.id])}">
                                    <g:message code="application_delete"></g:message>
                                </a> ]
                                </span>
                            </th>
                        </g:each>
                    </tr>
                    <g:each in="${productType.rootAttributeCategories}" var="category">
                        <tr>
                            <td colspan="${productType.products.toList().count { it } + 1}">
                                <h4>${category?.item?.name?:message(code:'otherAttributes')}</h4>
                            </td>
                        </tr>
                        <g:each in="${category.attributeTypes}" var="attributeType">
                            <tr>
                                <td>
                                    <b>${attributeType.item.name}</b>
                                </td>
                                <g:each in="${attributeType.values}" var="attribute">
                                    <td>
                                        ${attribute ? attribute.replace('\n', '<br/>') : '-'}
                                    </td>
                                </g:each>
                            </tr>
                        </g:each>
                    </g:each>
                    <td></td>
                    <g:each in="${productType.products}" var="product">
                        <td>
                            <div class="buttons">
                                <eshop:addToBasket prodcutId="${product.id}"
                                                   productTitle="${product}"
                                                   productPrice="price"></eshop:addToBasket>
                                <eshop:addToWishList prodcutId="${product.id}"
                                                     productTitle="${product.toString()}"
                                                     productPrice="price"></eshop:addToWishList>
                            </div>
                        </td>
                    </g:each>

                </table>
            </div>
        </g:each>
    </div>
</div>
<g:javascript>
    $(document).ready(function () {
        $('ul.nav.nav-tabs li').first().addClass('active');
        $('div.tab-content div.tab-pane').first().addClass('active');
    });
</g:javascript>
</body>
</html>