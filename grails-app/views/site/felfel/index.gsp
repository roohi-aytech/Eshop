<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title><g:message code="site.mainPage.title"/></title>
    <!-- E7zma1ATwR6TvWerhh0l7txRVh0 -->
    <meta name="description" content="${message(code: 'site.mainPage.description')}">
    <meta name="keywords" content="${message(code: 'site.mainPage.keywords')}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5" type="text/javascript"/>
    <![endif]-->

</head>

<body>

<div id="top-banners">
    <ehcache:render template="banners/rightsideBanners"/>
    <ehcache:render template="banners/leftsideBanners"/>
    <g:render template="/site/felfel/templates/slider"/>
    <div class="clearfix"></div>
</div>
<ehcache:render template="/site/felfel/templates/testimonials"/>
<eshop:mostSoldProductTypes/>
<eshop:mostVisitedProductTypes/>
<ehcache:render template="/site/common/specialSalesRowList"/>
<g:if test="${filters?.brands}">
    <g:render template="common/brandList" model="${[brands: filters.brands?.size() > 10 ? filters.brands[0..10] : filters.brands , productType : null]}"/>
</g:if>
</body>
</html>