<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title>${product}</title>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link rel="stylesheet" href="${resource(dir: 'css/templates', file: 'firstPage.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap.min.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-rtl.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'zanbil.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'site.css')}"/>
    <style>
    body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
    }
    </style>
    <link rel="stylesheet"
          href="${resource(dir: 'bootstrap/css', file: 'bootstrap-responsive.min.css', plugin: 'rapid-grails')}"/>
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
    <g:javascript src="common.js"></g:javascript>
    <g:javascript src="browse.js"></g:javascript>
    <g:javascript src="jquery.raty.js"></g:javascript>
</head>

<body>

<div class="layout-container table">
    <div class="table-cell product-rightColumn">
        <div class="well">
        </div>
    </div>

    <div class="table-cell">
        <div class="table">
            <div class="table-row">
                <div class="table">
                    <div class="table-cell">
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

                        <div class="white-panel">

                            <h2>${product}</h2>

                            <p class="brand-badge">
                                <span><g:message code="brand"/>:</span>
                                <b>${product?.brand}</b>
                            </p>

                            <p>
                                <g:message code="price"/>:
                                <b><g:render template="price"/></b>
                            </p>

                            <p>
                                <g:message code="rate"/>:
                                <eshop:rate identifier="hidProductRate" currentValue="3" readOnly="true"/>
                            </p>


                            <div class="product-description">${product?.details}</div>

                            <g:render template="product/variation"/>

                            <p>
                                <% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
                                <g:set var="price" value="${priceService.calcProductPrice(product.id).mainVal}"></g:set>
                                <eshop:addToBasket prodcutId="${product.id}"
                                                   productTitle="${product}"
                                                   productPrice="price"></eshop:addToBasket>
                                <eshop:addToCompareList prodcutId="${product.id}"
                                                        productTitle="${product.toString()}"
                                                        productPrice="price"></eshop:addToCompareList>
                                <eshop:addToWishList prodcutId="${product.id}"
                                                     productTitle="${product.toString()}"
                                                     productPrice="price"></eshop:addToWishList>
                            </a>
                            </p>
                        </div>
                    </div>

                    <div class="table-cell product-imageColumn">
                        <div><g:render template="product/zoom"/></div>
                    </div>

                </div>
            </div>

            <div class="table-row">
                <div class="table-cell">
                    <div class="white-panel">
                        <h3><g:message code="product.specifications"></g:message></h3>
                        <ul class="attribute-list">
                            <g:each in="${product.attributes}">
                                <g:if test="${it.value.toString().compareTo("N/A") != 0}">
                                    <li><b>${it.attributeType}:</b> ${it.value}</li>
                                </g:if>
                            </g:each>
                        </ul>
                        <hr/>
                        <g:if test="${product.description}">
                            <h3><g:message code="product.description"></g:message></h3>

                            <div>
                                ${product.description}
                            </div>
                            <hr/>
                        </g:if>
                        <g:render template="../customerReview/list" model="${['product': product]}"></g:render>
                        <g:render template="../customerReview/create" model="${['product': product]}"></g:render>
                        <g:render template="common/productCarousel"
                                  model="${[title: message(code: 'product.mostVisited.list', args: [breadCrumb.last().name]), productList: mostVisitedProducts]}"></g:render>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<g:javascript library="jquery"/>
<script src="${resource(dir: 'bootstrap/js', file: 'bootstrap.min.js', plugin: 'rapid-grails')}"></script>
</body>
</html>