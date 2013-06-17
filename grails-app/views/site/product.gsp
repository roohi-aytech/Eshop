<%@ page import="eshop.ProductModel" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title>${product.manualTitle ? product.pageTitle : title}</title>
    <meta charset="utf-8">
    <meta name="description" content="${description}">
    <meta name="keywords" content="">
    <link rel="stylesheet" href="${resource(dir: 'css/templates', file: 'firstPage.css')}" type="text/css">
    %{--<link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap.min.css', plugin: 'rapid-grails')}"/>--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-rtl.css', plugin: 'rapid-grails')}"/>--}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'zanbil.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'site.css')}"/>
    <style>
    body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
    }
    </style>
    <link rel="stylesheet"
          href="${resource(dir: 'bootstrap/css', file: 'bootstrap.min.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet"
%{--href="${resource(dir: 'bootstrap/css', file: 'bootstrap-responsive.min.css', plugin: 'rapid-grails')}"/>--}%
%{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-amazon.css')}"/>--}%

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    %{--<link rel="shortcut icon" href="../assets/ico/favicon.ico">--}%
    %{--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">--}%
    %{--<link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">--}%
    %{--<link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">--}%
    %{--<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">--}%
    <g:javascript src="browse.js"></g:javascript>
    <g:javascript src="jquery.raty.js"></g:javascript>
</head>

<body>

<table class="layout-container table-simulated">
    <tr class="table-row">
        <td class="table-cell product-rightColumn">
            <div class="product-card">
                <div class="product-card-content" id="product-card">
                    <g:render template="product/card"
                              model="${[product: product, productModel: ProductModel.findByProductAndIsDefaultModel(product, true)]}"/>
                </div>

                <div class="product-card-footer">
                    <eshop:addToCompareList prodcutId="${product.id}"
                                            productTitle="${product.toString()}"></eshop:addToCompareList>
                    <eshop:addToWishList prodcutId="${product.id}"
                                         productTitle="${product.toString()}"></eshop:addToWishList>
                </div>
            </div>
        </td>

        <td class="table-cell">
            <table class="table-simulated">
                <tr class="table-row">
                    <td class="table-cell" style="padding-left:5px;">
                        <ul class="breadcrumb">
                            <li>
                                <a href="${createLink(uri: '/')}"><g:message code="home"/></a>
                            </li>
                            <g:if test="${breadCrumb.size() > 1}">
                                <g:each in="${breadCrumb[0..-1]}">
                                    <li>
                                        <span class="divider">${">"}</span>
                                        <a href="${it.href}">${it.name}</a>
                                    </li>
                                </g:each>
                            </g:if>
                        </ul>
                    </td>
                </tr>

                <tr class="table-row">
                    <td class="table-cell">
                        <table class="table-simulated">
                            <tr class="table-row">
                                <td class="table-cell" id="product-description-area">

                                    <div class="white-panel">

                                        <g:if test="${product?.pageTitle}">
                                            <h1>${product?.pageTitle}</h1>
                                        </g:if>
                                        <g:else>
                                            <h1 class="font-koodak">${product?.productTypes?.find { true }?.name ?: ""} ${product?.type?.title ?: ""} ${product?.brand?.name ?: ""}</h1>

                                            <h2 class="small"><span class="font-koodak"><g:message
                                                    code="productModel"/></span> <span
                                                    class="font-calibri">${product?.name ?: ""}</span></h2>
                                        </g:else>

                                        <p>
                                            <g:message code="rate"/>:
                                            <eshop:rate identifier="hidProductRate" currentValue="3" readOnly="true"/>
                                        </p>

                                        <p class="brand-badge">
                                            <img width="80px" height="80px"
                                                 src="${createLink(controller: 'image', params: [id: product?.brand?.id, type: 'brand'])}"
                                                 alt="${product?.brand}"/>
                                        </p>

                                        <g:render template="product/variation"/>

                                        <p>
                                            <% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
                                            <g:set var="price"
                                                   value="${priceService.calcProductPrice(product.id).showVal}"></g:set>
                                        </a>
                                        </p>
                                    </div>
                                </td>

                                <td class="table-cell product-imageColumn">
                                    <div><g:render template="product/zoom"/></div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr class="table-row">
                    <td class="table-cell">
                        <div class="white-panel">
                            <h3><g:message code="product.specifications"></g:message></h3>
                            <g:render template="product/attributes"
                                      model="${[categories: rootAttributeCategories]}"></g:render>

                            <hr/>
                            <g:render template="product/description"/>
                            <g:render template="../customerReview/resources"
                                      model="${['product': product]}"></g:render>
                            <g:render template="../customerReview/list"
                                      model="${['product': product]}"></g:render>
                            <g:render template="../customerReview/create"
                                      model="${['product': product]}"></g:render>
                            <hr/>
                            <g:render template="common/productCarousel"
                                      model="${[title: message(code: 'product.mostVisited.list', args: [breadCrumb.last().name]), productList: mostVisitedProducts]}"></g:render>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>