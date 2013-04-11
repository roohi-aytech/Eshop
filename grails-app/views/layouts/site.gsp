<%@ page import="eshop.ProductService" %>
<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js" ng-app='eshop'><!--<![endif]-->
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'siteUI.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap.min.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet"
          href="${resource(dir: 'bootstrap/css', file: 'bootstrap-responsive.min.css', plugin: 'rapid-grails')}"/>
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-amazon.css')}"/>--}%
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-rtl.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'zanbil.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'site.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.rollbar.css')}"/>
    %{--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--}%
    %{--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--}%
    %{--<title><g:layoutTitle default="Grails"/></title>--}%
    %{--<meta name="viewport" content="width=device-width, initial-scale=1.0">--}%
    %{--<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">--}%
    %{--<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">--}%
    %{--<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(plugin: 'rapid-grails', dir: 'css', file: 'rapidgrails.css')}"--}%
    %{--type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'css3.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'reset.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'theme.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'msgGrowl.css')}" type="text/css">--}%
    %{----}%
    %{--<ckeditor:resources/>--}%
    <g:javascript library="jquery"></g:javascript>

    <r:layoutResources/>
    <script type="text/javascript"
            src="${resource(plugin: 'rapid-grails', dir: 'js', file: 'angular.min.js')}"></script>
    <script type="text/javascript">
        var basketCounter = ${session.getAttribute("basketCounter") ?: 0};
        var basket = ${(session.getAttribute("basket")?: []) as grails.converters.JSON};
        var contextRoot = "${createLink(uri: '/')}";
    </script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'eshopCtrl.js')}"></script>
    <g:javascript src="jquery.rollbar.js"></g:javascript>
    %{--<jqui:resources theme="cobalt"></jqui:resources>--}%
    %{----}%
    %{--<g:javascript plugin="rapid-grails" src="utils.js"></g:javascript>--}%
    %{--<g:javascript plugin="rapid-grails" src="grid_utils.js"></g:javascript>--}%
    %{--<g:javascript plugin="rapid-grails" src="jquery.json-2.3.min.js"></g:javascript>--}%
    %{--<g:javascript plugin="rapid-grails" src="jquery.form.js"></g:javascript>--}%
    %{----}%
    %{--<link rel="stylesheet"--}%
    %{--href="${resource(dir: 'css/datepicker', file: 'ui.datepicker.css', plugin: 'rapid-grails')}"/>--}%
    %{--<g:javascript src="datepicker/jquery.ui.datepicker-cc.js" plugin="rapid-grails"/>--}%
    %{--<g:javascript src="datepicker/calendar.js" plugin="rapid-grails"/>--}%
    %{--<g:javascript src="datepicker/jquery.ui.datepicker-cc-fa.js" plugin="rapid-grails"/>--}%
    %{----}%
    %{--<rg:jqgridResources></rg:jqgridResources>--}%
    %{--<g:javascript src="jquery.labelify.js"></g:javascript>--}%
    %{--<g:javascript src="theme.js"></g:javascript>--}%
    %{----}%
    %{--<rg:jstreeResources/>--}%

    %{--<script language="javascript" src="${resource(dir: 'js', file: 'msgGrowl.js')}" type="text/javascript"></script>--}%
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.tpl_layout1.1.6.min.js')}"
            type="text/javascript"></script>
    <g:layoutHead/>
</head>

<body dir="rtl">
<div id="main-container" ng-controller="eshopCtrl">
    <div class="navbar navbar-fixed-top">
        <div id="header1">
            <a id="logo" href="${createLink(controller: 'site')}"><h1><g:message code="title"></g:message></h1></a>

            <div id="top-links">
                <a href="${createLink(controller: 'site')}"><g:message code="home.label"></g:message></a> |
                <a href="#"><g:message code="support.label"></g:message></a> |
                <a href="#"><g:message code="help.label"></g:message></a> |
                <a href="#"><g:message code="contact.label"></g:message></a>
            </div>
            <span id="support-number"><g:message code="support.number"></g:message></span>

                <sec:ifLoggedIn>
                    <div class="btn-group pull-left" id="profile-menu">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <sec:username/>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="dropdown">
                                <a tabindex="-1"
                                   href="<g:createLink controller="Customer" action="panel"></g:createLink>"><g:message code="user.controlpanel.label"></g:message></a></li>
                            <li class="divider"></li>
                            <li class="dropdown">
                                <a tabindex="-1"
                                   href="<g:createLink controller="Customer" action="profile"></g:createLink>"><g:message code="profile"></g:message></a></li>
                            <li class="dropdown">
                                <a tabindex="-1"
                                   href="<g:createLink controller="Customer" action="changePassword"></g:createLink>"><g:message code="password.change.label"></g:message></a></li>
                            <li class="divider"></li>
                            <li class="dropdown">
                                <common:logoutLink tabindex="-1"></common:logoutLink>
                            </li>
                        </ul>
                    </div>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <div class="btn-group pull-left" id="login-menu">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <g:message code="login"></g:message>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="dropdown">
                                <common:loginLink tabindex="-1"></common:loginLink></li>
                            <li class="dropdown">
                                <common:registerLink tabindex="-1"></common:registerLink></li>
                        </ul>
                    </div>
                </sec:ifNotLoggedIn>

        </div>

        <div class="navbar-inner" id="header2">
            <div class="container">
                <a id="logo-small"><span><g:message code="title"></g:message></span></a>

                <div class="search-box">
                    <div class="btn-group pull-right" style="margin-right: 0;">
                        <a class="btn btn-inverse-grey dropdown-toggle" data-toggle="dropdown" href="#">
                            <span id="searchCategory"><g:message code="category.all"></g:message></span>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
                            <g:set var="rootProductTypes" value="${productService.findRootProductTypes()}"></g:set>
                            <g:each in="${rootProductTypes}" var="rootProductType">
                            %{--<li><a href="#">${rootProductType.name}</a></li>--}%
                                <li class="dropdown-submenu">
                                    <a tabindex="-1"
                                       href="#"
                                       onclick="$('#searchCategory').html('${rootProductType.name}')">${rootProductType.name}</a>
                                    <ul class="dropdown-menu">
                                        <g:each in="${rootProductType.children}" var="secondLevelProductType">
                                            <li>
                                            <a href="#" onclick="$('#searchCategory').html('${secondLevelProductType.name}')">${secondLevelProductType.name}</a>
                                        </g:each>
                                    </ul>
                                </li>
                            </g:each>
                        </ul>
                    </div>

                    <form class="navbar-search pull-right">
                        <input type="text" class="input-large search-query" placeholder="<g:message code="search"/>">
                    </form>

                    <div id="btn-search" class="btn-group pull-right" style="margin-right: 0;">
                        <a class="btn btn-inverse dropdown-toggle" data-toggle="dropdown" href="#">
                            <span></span></a>
                    </div>
                </div>

                <div class="btn-group pull-right topNavigationItem" id="link-compareList">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span><g:message code="compareList"></g:message></span>
                        <span class="counter">0</span>
                    </a>

                    <div class="dropdown-menu content">
                        <g:message code="underConstruction"></g:message>
                    </div>
                </div>

                <div class="btn-group pull-right topNavigationItem" id="link-wishList">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span><g:message code="wishList"></g:message></span>
                        <span class="counter">0</span>
                    </a>

                    <div class="dropdown-menu content">
                        <g:message code="underConstruction"></g:message>
                    </div>
                </div>

                <div class="btn-group pull-right topNavigationItem" id="link-basket">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span><g:message code="basket"></g:message></span>
                        <span id="basketCounter" class="counter">{{basketCounter}}</span>
                    </a>

                    <div id="basketItems" class="dropdown-menu content">
                        <ul>
                            <li ng-repeat="basketItem in basket">
                                <span class="basket-item-image">
                                    <img src="<g:createLink controller="image"
                                                            action="index"/>/{{basketItem.id}}?wh=50x50"/>
                                </span>
                                <span class="basket-item-title">{{basketItem.name}}<br/>
                                    <g:message code="basket-items-count"></g:message>: <span
                                        class="basket-item-count">{{basketItem.count}}
                                </span>
                                </span>
                            </li>
                        </ul>
                        <g:link class="btn btn-warning" controller="basket" action="checkout"><g:message
                                code="basket.show"></g:message></g:link>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="body-container">
        <g:layoutBody/>
    </div>
    <r:layoutResources/>
</div>
<g:javascript library="jquery"/>
<script src="${resource(dir: 'bootstrap/js', file: 'bootstrap.min.js', plugin: 'rapid-grails')}"></script>
<g:javascript src="jquery.mousewheel.js"></g:javascript>
<g:javascript src="jcarousellite.js"></g:javascript>

</body>
</html>
