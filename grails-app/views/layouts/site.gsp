<%@ page import="eshop.ProductService" %>
<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js" ng-app='eshop'><!--<![endif]-->
<head>
    <title><g:layoutTitle></g:layoutTitle></title>
    <canonical:show/>
    <meta name="robots" content="index, follow"/>
    <meta name="google-site-verification" content="mH1bB8PXNP_Qn0W29M_XLwI2aFf5EuHhkPRfTJCEW8M"/>
    <!--[if lte IE 8]>
    <script language="javascript" type="text/javascript" src="${resource(dir: 'js', file: 'ieFix.js')}"></script>
    <script language="javascript" type="text/javascript" src="${resource(dir: 'js', file: 'json3.js')}"></script>
    <script>
        document.createElement('ng-include');
        document.createElement('ng-pluralize');
        document.createElement('ng-view');

        // Optionally these for CSS
        document.createElement('ng:include');
        document.createElement('ng:pluralize');
        document.createElement('ng:view');
      </script>
    <![endif]-->
    <g:javascript library="jquery"></g:javascript>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'siteUI.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap.min.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet"
          href="${resource(dir: 'bootstrap/css', file: 'bootstrap-responsive.min.css', plugin: 'rapid-grails')}"/>
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-amazon.css')}"/>--}%
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-rtl.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'site.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.rollbar.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.msgGrowl.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.tipsy.css')}"/>

    <r:layoutResources/>
    <script type="text/javascript"
            src="${resource(plugin: 'rapid-grails', dir: 'js', file: 'angular.min.js')}"></script>
    <script type="text/javascript">
        var basketCounter = ${session.getAttribute("basketCounter") ?: 0};
        var basket = ${(session.getAttribute("basket")?: []) as grails.converters.JSON};
        var compareListCounter = ${session.getAttribute("compareListCounter") ?: 0};
        var compareList = ${(session.getAttribute("compareList")?: []) as grails.converters.JSON};
        <sec:ifLoggedIn>
        <% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
        <g:set var="wishList" value="${eshop.Customer.findByUsername(sec.username())?.wishList?.collect{[id:it.id, title: it.toString(), price: priceService.calcProductPrice(it.id).showVal]}?:[]}"></g:set>
        var wishListCounter = ${wishList? wishList.count {it}: 0};
        var wishList = ${(wishList?: []) as grails.converters.JSON};
        var wishListEnabled = true;
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
        var wishListCounter = 0;
        var wishList = ${[] as grails.converters.JSON};
        var wishListEnabled = false;
        var wishListNotEnabledMessage = '${message(code:'wishList.notEnabled.message')}';
        </sec:ifNotLoggedIn>
        var contextRoot = "${createLink(uri: '/')}";
        var mainSlides = [];
        var mainSlideSize = 0;
        var specialSaleSlides = [];
        var specialSaleSlideSize = 0;
        var mainSlideSize = 0;
        var mainSlideWidth = 0;
        var mainSlideHeight = 0;
        var specialSaleSlideWidth = 0;
        var specialSaleSlideHeight = 0;
        var specialSaleSlideSize = 0;
    </script>
    <g:javascript src="jquery.rollbar.js"></g:javascript>
    <g:javascript src="jquery.mousewheel.js"></g:javascript>
    <g:javascript src="jquery.msgGrowl.js"></g:javascript>
    <g:javascript src="jquery.tipsy.js"></g:javascript>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'eshopCtrl.js')}"></script>
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.tpl_layout1.1.6.min.js')}"
            type="text/javascript"></script>
    <g:layoutHead/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'zanbil.css')}"/>

    <g:javascript src="jquery.hoverIntent.js"></g:javascript>
    <g:javascript src="common.js"></g:javascript>
</head>

<body dir="rtl">
<div id="main-container" ng-controller="eshopCtrl">
    <g:render template="/layouts/header"></g:render>
    <div id="body-container">
        <g:layoutBody/>
        <g:render template="/layouts/footer"></g:render>
    </div>
    <r:layoutResources/>
</div>
<g:javascript library="jquery"/>
<script src="${resource(dir: 'bootstrap/js', file: 'bootstrap.min.js', plugin: 'rapid-grails')}"></script>

</body>
</html>
