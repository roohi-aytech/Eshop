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

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <script language="JavaScript" type="text/javascript" src="${resource(dir:'js', file: 'jquery.transform.js')}"></script>
</head>

<body>

<ul class="breadcrumb">
    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
        <a href="${createLink(uri: '/')}" itemprop="url" class="home">
            <span itemprop="title">
                <g:message code="home"/>
            </span>
        </a>
    </li>
    <g:if test="${breadCrumb.size() > 0}">
        <g:each in="${breadCrumb[0..-1]}">
            <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                <span class="divider">${"/"}</span>
                <a href="${it.href}" itemprop="url">
                    <span itemprop="title">${it.name}</span></a>
            </li>
        </g:each>
    </g:if>
</ul>
<g:render template="common/browsingMixedMenu"/>

<eshop:selectedProductsList productTypeId="${productType.id}"/>

<g:if test="${filters?.brands}">
    <g:render template="common/brandList" model="${[brands: filters.brands?.size() > 10 ? filters.brands[0..10] : filters.brands ]}"/>
</g:if>
%{--<g:render template="common/productGrid"--}%
%{--model="${[productIds: filters.products.productIds]}"/>--}%
%{--<g:render template="common/productCarousel"--}%
%{--key="${productTypeId}"--}%
%{--model="${[title: message(code: 'product.mostVisited.list', args: [productTypeName]), productList: mostVisitedProducts]}"/>--}%

%{--<% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>--}%
%{--<g:set var="lastVisitedProducts"--}%
%{--value="${productService.findLastVisitedProducts(cookie(name: 'lastVisitedProducts'))}"/>--}%
%{--<g:if test="${lastVisitedProducts && !lastVisitedProducts.isEmpty()}">--}%
%{--<g:render template="/site/common/productCarousel"--}%
%{--model="${[title: message(code: 'product.lastVisited.list'), productList: lastVisitedProducts, mode: 'large']}"/>--}%
%{--</g:if>--}%


<script type="text/javascript">
    (function ($) {
        $('.row-fluid ul.thumbnails li.span6:nth-child(2n + 3)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span4:nth-child(3n + 4)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span3:nth-child(4n + 5)').css('margin-right', '0px');
    })(jQuery);
</script>
</body>
</html>