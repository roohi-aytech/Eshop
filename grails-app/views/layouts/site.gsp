<%@ page import="eshop.ProductService" %>
<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js" ng-app='eshop'><!--<![endif]-->
<head>
    <title><g:layoutTitle/></title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <canonical:show/>
    <meta name="robots" content="index, follow"/>
    <meta name="google-site-verification" content="mH1bB8PXNP_Qn0W29M_XLwI2aFf5EuHhkPRfTJCEW8M"/>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <!--[if lte IE 8]>
    <p:javascript src="ieFix"/>
    <p:javascript src="json3"/>
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
    <g:javascript library="jquery"/>
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap.min.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet"
          href="${resource(dir: 'bootstrap/css', file: 'bootstrap-responsive.min.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-rtl.css', plugin: 'rapid-grails')}"/>
    <p:css name="siteUI"/>
    <p:css name="site"/>
    <p:css name="jquery.rollbar"/>
    <p:css name="jquery.msgGrowl"/>
    <p:css name="jquery.tipsy"/>

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
        <g:set var="wishList" value="${eshop.Customer.findByUsername(sec.username())?.wishList?.collect{[id:it.id, title: it.toString(), price: priceService.calcProductPrice(it.id).showVal]}?:[]}"/>
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

        var searchAutoCompleteUrl = '${createLink(controller: 'site', action: 'searchAutoComplete')}';
    </script>
    <p:javascript src="jquery.rollbar"/>
    <p:javascript src="jquery.mousewheel"/>
    <p:javascript src="jquery.msgGrowl"/>
    <p:javascript src="jquery.tipsy"/>
    <p:javascript src="eshopCtrl"/>
    <p:javascript src="jquery.tpl_layout1.1.6.min"/>
    <g:layoutHead/>
    <p:css name="zanbil"/>
    <p:javascript src="jquery.watch"/>
    <p:javascript src="jquery.hoverIntent"/>
    <p:javascript src="common"/>
    <p:javascript src="search-auto-complete"/>
    <p:javascript src="jquery.maskinput"/>
</head>

<body class="main" ng-controller="eshopCtrl">
<g:render template="/layouts/header"></g:render>
<table id="main-container" class="table-simulated">
    <tr>
        <td id="body-container">
            <div id="body-container-inner">
                <div id="body-size-watch">
                    <g:layoutBody/>
                </div>
            </div>

            <g:render template="/inquired_payments"/>
            <r:layoutResources/>
        </td>
    </tr>
    <tr>
        <td class="totalFooter">
            <g:render template="/layouts/footer"></g:render>
        </td>
    </tr>
</table>
<g:javascript library="jquery"/>
<script src="${resource(dir: 'bootstrap/js', file: 'bootstrap.min.js', plugin: 'rapid-grails')}"></script>

</body>
</html>
