<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title>Bootstrap, from Twitter</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
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

<div class="layout-container">
    <div class="span180">
        <div class="well">
        </div>
    </div>

    <div class="span320">
        <div><g:render template="product/zoom"/></div>
    </div>

    <div class="span415">
        <ul class="breadcrumb">
            <li>
                <a href="#"><g:message code="home"/></a>
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
                <eshop:addToBasket prodcutId="${product.id}" productTitle="${product}"></eshop:addToBasket>
                <a class="btn btn-primary btn-compare" href="#"><span>${message(code: 'add-to-compareList')}</span></a>
                <a class="btn btn-danger btn-wish" href="#"><span>${message(code: 'add-to-wishList')}</span></a>
            </p>
        </div>
    </div>

    <div class="span735">
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
            <g:render template="common/mostVisitedProducts"></g:render>
        </div>
    </div>
</div>

<g:javascript library="jquery"/>
<script src="${resource(dir: 'bootstrap/js', file: 'bootstrap.min.js', plugin: 'rapid-grails')}"></script>
</body>
</html>