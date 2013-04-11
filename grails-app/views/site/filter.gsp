<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title>Bootstrap, from Twitter</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'coin-slider.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'zanbil.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'site.css')}"/>
    <style>
    body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
    }
    </style>

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

    <g:javascript src="thumbnails.js"></g:javascript>
    <g:javascript src="common.js"></g:javascript>
    <g:javascript src="coin-slider.js"></g:javascript>
</head>

<body>

<div class="layout-container">
        <div class="span180">
            <div class="well sidebar-nav">
                <div id="navigator_root">
                    <a href="/EShop/site/browse/${message(code:"applicances")}" id="navigator_appliance"><g:message code="applicances"></g:message></a>
                    <a href="/EShop/site/browse/${message(code:"digital")}" id="navigator_digital"><g:message code="digital"></g:message></a>
                </div>
                <ul class="nav nav-list">
                    <g:if test="${filters.productTypes}">
                        <li class="nav-header"><g:message code="site.selectSubcategory" default="Select SubProductType"></g:message></li>
                        <g:each in="${filters.productTypes}" var="productType">
                            <li>
                                <eshop:filterAddProductType id="${productType._id.id}" name="${productType._id.name}" f="${params.f}"/>
                            </li>
                        </g:each>
                        <li class="divider"></li>
                    </g:if>
                    %{--Brands Filters--}%
                    <g:if test="${filters?.brands}">
                        <li class="nav-header sidebarBrandGroup"><g:message code="site.selectBrand" default="Select Brand"></g:message></li>
                        <g:each in="${filters.brands}" var="brand">
                            <g:if test="${filters.selecteds["b"]?.contains(brand._id?.id)}">
                                <li class="active checkable">
                                    <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}" f="${params.f}" remove="true"></eshop:filterAddBrand>
                                </li>
                            </g:if>
                            <g:else>
                                <li class="checkable">
                                    <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}" f="${params.f}"></eshop:filterAddBrand>
                                </li>
                            </g:else>
                        </g:each>
                    </g:if>
                    <li class="divider"></li>
                    %{--Attribute Filters--}%
                    <g:if test="${filters?.attributes}">
                        <g:each in="${filters.attributes}" var="attribute">
                            <li class="nav-header sidebarAttributeGroup">${attribute.value.name}</li>
                            <g:each in="${attribute.value.countsByValue}" var="attributeValueCount">
                                <g:if test="${filters.selecteds[attribute.key]?.contains(attributeValueCount._id)}">
                                    <li class="active checkable">
                                        <eshop:filterAddAttribute id="${attribute.key}" value="${attributeValueCount._id}" f="${params.f}" remove="true"></eshop:filterAddAttribute>
                                    </li>
                                </g:if>
                                <g:else>
                                    <li class="checkable">
                                        <eshop:filterAddAttribute id="${attribute.key}" value="${attributeValueCount._id}" f="${params.f}"></eshop:filterAddAttribute>                                    </li>
                                </g:else>
                            </g:each>
                        </g:each>
                    </g:if>
                </ul>
            </div>
        </div>

        <div class="span200">
            <div class="well">
            </div>
        </div>

        <div class="span600">
            <ul class="breadcrumb">
                <li>
                    <a href="#"><g:message code="home"/></a>
                    <span class="divider">${">"}</span>
                </li>
                <g:if test="${filters.breadcrumb.size() > 1}">
                    <g:each in="${filters.breadcrumb[0..-2]}">
                        <li>
                            <a href="${commonLink}/${it.linkTail}">${it.linkTitle}</a>
                            <span class="divider">${">"}</span>
                        </li>
                    </g:each>
                </g:if>
                <li class="active">${filters.breadcrumb[-1].linkTitle}</li>
            </ul>

            <g:render template="common/slideshowMain"></g:render>

            <div>
                <ul class="thumbnails">
                    %{--<div class="span" style="display: none;"></div>--}%
                    <g:each in="${filters.products.productIds}" status="i" var="productId">
                        <g:set var="product" value="${eshop.Product.get(productId)}"/>
                        <g:if test="${product}">
                            <li class="span3">
                            <g:render template="product_search" model="[product: product]"/>
                            </li>
                        </g:if>
                    </g:each>
                </ul>
                <g:if test="${filters.products.totalPages > 1}">
                    <div class="pagination pagination-centered">
                        <ul>
                            <g:each in="${(0..<filters.products.totalPages + 1)}">
                                <li ${(params.page?:"0") == it.toString() ? 'class="active"' : ''}>
                                    <g:link action="filter" params="${params + [page: it]}">${it + 1}</g:link></li>
                            </g:each>
                        </ul>
                    </div>
                </g:if>
            </div>
        </div>
</div> <!-- /container -->

<script type="text/javascript">
    (function ($) {
        $('.row-fluid ul.thumbnails li.span6:nth-child(2n + 3)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span4:nth-child(3n + 4)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span3:nth-child(4n + 5)').css('margin-right', '0px');
    })(jQuery);
</script>
</body>
</html>