<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <g:if test="${title}">
        <title><g:message code="site.title"/>: ${title}</title>
    </g:if>
    <meta charset="utf-8">
    <g:if test="${description}">
        <meta name="description" content="${description}">
    </g:if>
    <g:if test="${keywords}">
        <meta name="keywords" content="${keywords}">
    </g:if>
    <g:render template="common/productGridMeta"
              model="${[productIds: filters.products.productIds]}"/>
    <link href="${resource(dir: 'css', file: 'site.css')}" rel="stylesheet" type="text/css"/>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>

<body>

<ul class="breadcrumb">
    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
        <a class="home" href="${createLink(uri: '/')}" itemprop="url">
            <span itemprop="title">
                <g:message code="home"/>
            </span>
        </a>
    </li>
    <g:if test="${filters.breadcrumb.size() > 0}">
        <g:each in="${filters.breadcrumb[0..-1]}">
            <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                <span class="divider">${"/"}</span>
                <a href="${commonLink}${it.linkTail}"
                   itemprop="url"><span itemprop="title">${it.linkTitle}</span></a>
            </li>
        </g:each>
    </g:if>
</ul>

<h3 class="category_heading top_less bottom_less">
    <div class="right_text">
        <g:message code="menu.startPrice"/> ${eshop.productTypeMinPrice(productTypeId: productTypeId)} <g:message
                code="rial"/>
    </div>
    <g:message code="category.all.products" args="${[productTypeName]}"/>
</h3>

<div class="toolbar_top">
    <g:render template="/site/common/pagination" model="${totalPages = filters.products.totalPages}"/>
    <div class="clearfix"></div>
</div>

<div class="filter_left">
    <div class="filter_float_threshold_start"></div>

    <div class="floating_filter">
        <g:render template="common/filteringTextualMenu"/>
    </div>
</div>

<div class="listing_right">

    <g:render template="common/productRowList"
              model="${[productIds: filters.products.productIds]}"/>
</div>

<div class="clearfix"></div>

<div class="toolbar_bottom">
    <div class="toolbar_top">
        <g:render template="/site/common/pagination" model="${totalPages = filters.products.totalPages}"/>
        <div class="clearfix"></div>
    </div>
</div>

%{--<table class="layout-container table-simulated">--}%
%{--<tr class="table-row">--}%
%{--<td colspan="2">--}%
%{--<g:render template="common/slideshowMain"/>--}%
%{--</td>--}%
%{--</tr>--}%
%{--<tr class="table-row">--}%
%{--<td class="banners table-cell">--}%
%{--<ehcache:render template="common/filteringAccordion" key="${params.f}"/>--}%
%{--<ehcache:render template="banners/rightsideBanners"/>--}%
%{--</td>--}%

%{--<td class="table-cell">--}%
%{--<table class="table-simulated">--}%

%{--<tr class="table-row">--}%
%{--<td class="table-cell">--}%
%{--<ul class="breadcrumb">--}%
%{--<li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">--}%
%{--<a href="${createLink(uri: '/')}" itemprop="url">--}%
%{--<span itemprop="title">--}%
%{--<g:message code="home"/>--}%
%{--</span>--}%
%{--</a>--}%
%{--</li>--}%
%{--<g:if test="${filters.breadcrumb.size() > 0}">--}%
%{--<g:each in="${filters.breadcrumb[0..-1]}">--}%
%{--<li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">--}%
%{--<span class="divider">${">"}</span>--}%
%{--<a href="${commonLink}${it.linkTail}"--}%
%{--itemprop="url"><span itemprop="title">${it.linkTitle}</span></a>--}%
%{--</li>--}%
%{--</g:each>--}%
%{--</g:if>--}%
%{--</ul>--}%

%{--<ehcache:render template="common/filteringGraphicalMenu" key="${params.f}"/>--}%


%{--<g:if test="${filters.productTypes?.isEmpty()}">--}%
%{--<g:render template="common/productGrid"--}%
%{--model="${[productIds: filters.products.productIds]}"/>--}%
%{--</g:if>--}%

%{--</td>--}%
%{--</tr>--}%
%{--</table>--}%
%{--</td>--}%
%{--</tr>--}%
%{--<tr class="table-row">--}%
%{--<td class="table-cell" colspan="2">--}%
%{--<g:render template="common/productCarousel"--}%
%{--key="${productTypeId}"--}%
%{--model="${[title: message(code: 'product.mostVisited.list', args: [productTypeName]), productList: mostVisitedProducts]}"/>--}%
%{--</td>--}%
%{--</tr>--}%
%{--<tr class="table-row">--}%
%{--<td colspan="2" class="table-cell">--}%
%{--<% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>--}%
%{--<g:set var="lastVisitedProducts"--}%
%{--value="${productService.findLastVisitedProducts(cookie(name: 'lastVisitedProducts'))}"/>--}%
%{--<g:if test="${lastVisitedProducts && !lastVisitedProducts.isEmpty()}">--}%
%{--<g:render template="/site/common/productCarousel"--}%
%{--model="${[title: message(code: 'product.lastVisited.list'), productList: lastVisitedProducts, mode: 'large']}"/>--}%
%{--</g:if>--}%
%{--</td>--}%
%{--</tr>--}%
%{--<tr class="table-row">--}%
%{--<td class="table-cell" colspan="2">--}%
%{--<ehcache:render template="news/window" model="${[productTypeId: productTypeId]}"/>--}%
%{--</td>--}%
%{--</tr>--}%
%{--</table>--}%

%{--<script type="text/javascript">--}%
%{--(function ($) {--}%
%{--$('.row-fluid ul.thumbnails li.span6:nth-child(2n + 3)').css('margin-right', '0px');--}%
%{--$('.row-fluid ul.thumbnails li.span4:nth-child(3n + 4)').css('margin-right', '0px');--}%
%{--$('.row-fluid ul.thumbnails li.span3:nth-child(4n + 5)').css('margin-right', '0px');--}%
%{--})(jQuery);--}%
%{--</script>--}%
</body>
</html>