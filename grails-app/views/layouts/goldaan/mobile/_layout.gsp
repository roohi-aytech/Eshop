<%@ page import="grails.converters.JSON" %>
<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js" ng-app='eshop'><!--<![endif]-->
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta charset="UTF-8">
    <meta http-equiv="x-dns-prefetch-control" content="on">
    <title><g:layoutTitle/></title>
    <canonical:show/>
    <!--[if lte IE 8]>
    <script language="javascript" src="${resource(dir: 'js', file: 'ieFix.js')}" type="text/javascript"></script>
    <script language="javascript" src="${resource(dir: 'js', file: 'json3.js')}" type="text/javascript"></script>
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
    <script type="text/javascript"
            src="${resource(plugin: 'rapid-grails', dir: 'js', file: 'angular.min.js')}"></script>
    <script type="text/javascript">
        var basketCounter = ${session.getAttribute("basketCounter") ?: 0};
        var basket = ${(session.getAttribute("basket")?: []) as JSON};
        <sec:ifLoggedIn>
        <% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
        <g:set var="wishList" value="${eshop.Customer.findByUsername(sec.username())?.wishList?.collect{[id:it.id, title: it.toString(), price: priceService.calcProductPrice(it.id).showVal]}?:[]}"/>
        var wishListCounter = ${wishList? wishList.count {it}: 0};
        var wishList = ${(wishList?: []) as JSON};
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
        var wishListCounter = 0;
        var wishList = ${[] as JSON};
        </sec:ifNotLoggedIn>
        var contextRoot = "${createLink(uri: '/')}";
    </script>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css/mobile', file: 'style.css')}">
    <script type="text/javascript"
            src="${resource(plugin: 'jquery', dir: 'js/jquery', file: 'jquery-1.7.2.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/mobile', file: 'jquery.ba-bbq.js')}"></script>
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.dotdotdot.js')}"
            type="text/javascript"></script>
    <script language="javascript" src="${resource(dir: "js/mobile", file: 'eshopCtrl.js')}"
            type="text/javascript"></script>

    <r:layoutResources/>
    <g:layoutHead/>
</head>

<body ng-controller="eshopCtrl">

<div id="p_main_wrapper">
    <g:render template="/layouts/goldaan/mobile/header"/>
</div>
<script type="text/javascript" src="${resource(dir: 'js/mobile', file: 'unslider.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/mobile', file: 'menu.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/mobile', file: 'transit.js')}"></script>

<div class="main-width">
    <g:layoutBody/>
    <g:render template="/layouts/felfel/mobile/footer"/>
</div>

<script language="javascript" src="${resource(dir: 'js', file: 'jquery.lazyLoad.js')}" type="text/javascript"></script>
<script type="text/javascript" src="${resource(dir: 'js/mobile', file: 'common.js')}"></script>
<r:layoutResources/>
</body>
</html>