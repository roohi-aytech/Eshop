<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'siteUI.css')}" type="text/css">
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
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.tpl_layout1.1.6.min.js')}" type="text/javascript"></script>
    <g:layoutHead/>
</head>

<body dir="rtl">


<div class="navbar navbar-fixed-top">
    <div id="header1">
        <a id="logo"><h1><g:message code="title"></g:message></h1></a>

        <div id="top-links">
            <a href="#"><g:message code="home.label"></g:message></a> |
            <a href="#"><g:message code="support.label"></g:message></a> |
            <a href="#"><g:message code="help.label"></g:message></a> |
            <a href="#"><g:message code="contact.label"></g:message></a>
        </div>
        <span id="support-number"><g:message code="support.number"></g:message></span>
    </div>

    <div class="navbar-inner" id="header2">
        <div class="container">
            <a id="logo-small"><span><g:message code="title"></g:message></span></a>
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <div class="search-box">
                <div class="btn-group pull-right" style="margin-right: 0;">
                    <a class="btn btn-inverse-grey dropdown-toggle" data-toggle="dropdown" href="#">
                        <span id="searchCategory"><g:message code="category.all"></g:message></span>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
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
                    <g:message code="compareList"></g:message>
                </a>
                <div class="dropdown-menu content">
                    content
                </div>
            </div>
            <div class="btn-group pull-right topNavigationItem" id="link-wishList">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <g:message code="wishList"></g:message>
                </a>
                <div class="dropdown-menu content">
                    content
                </div>
            </div>
            <div class="btn-group pull-right topNavigationItem" id="link-basket">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <g:message code="basket"></g:message>
                </a>
                <div class="dropdown-menu content">
                    content
                </div>
            </div>
            <div class="btn-group pull-right topNavigationItem" id="link-profile">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <g:message code="profile-title"></g:message>
                </a>
                <div class="dropdown-menu content">
                    content
                </div>
            </div>
        </div>
    </div>
</div>
<g:layoutBody/>
<r:layoutResources/>
</body>
</html>
