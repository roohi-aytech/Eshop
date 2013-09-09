<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js" ng-app><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(plugin: 'rapid-grails', dir: 'css', file: 'rapidgrails.css')}"
          type="text/css">
    <p:css name="main"/>
    <p:css name="mobile"/>
    <p:css name="css3"/>
    <p:css name="theme"/>
    <p:css name="msgGrowl"/>

    <ckeditor:resources/>
    <g:javascript library="jquery"></g:javascript>
    <g:render template="/events_push"/>
    <r:layoutResources/>
    <jqui:resources theme="cobalt"></jqui:resources>

    <g:javascript plugin="rapid-grails" src="angular.min.js"/>
    <g:javascript plugin="rapid-grails" src="angular.autocomplete.js"/>

    <g:javascript plugin="rapid-grails" src="utils.js"/>
    <g:javascript plugin="rapid-grails" src="grid_utils.js"/>
    <g:javascript plugin="rapid-grails" src="jquery.json-2.3.min.js"/>
    <g:javascript plugin="rapid-grails" src="jquery.form.js"/>
    <p:javascript src="jquery.selectbox"/>

    <link rel="stylesheet"
          href="${resource(dir: 'css/datepicker', file: 'ui.datepicker.css', plugin: 'rapid-grails')}"/>
    <g:javascript src="datepicker/jquery.ui.datepicker-cc.js" plugin="rapid-grails"/>
    <g:javascript src="datepicker/calendar.js" plugin="rapid-grails"/>
    <g:javascript src="datepicker/jquery.ui.datepicker-cc-fa.js" plugin="rapid-grails"/>

    <rg:jqgridResources/>
    <p:javascript src="jquery.labelify"/>
    <p:javascript src="theme"/>

    <p:javascript src="jquery.maskinput"/>


    <g:layoutHead/>
    <rg:jstreeResources/>

    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.msgGrowl.js')}" type="text/javascript"></script>


    %{--easy ui--}%
    <p:css name="jquery.easyui/metro/easyui"/>
    <p:css name="jquery.easyui/easyui-rtl"/>
    <p:javascript src="jquery.easyui/jquery.panel"/>
    <p:javascript src="jquery.easyui/jquery.parser"/>
    <p:javascript src="jquery.easyui/jquery.validatebox"/>
    <p:javascript src="jquery.easyui/jquery.tree"/>
    <p:javascript src="jquery.easyui/jquery.combo"/>
    <p:javascript src="jquery.easyui/jquery.combotree"/>
</head>

<body dir="rtl">
<div id="bokeh"><div id="container">
    <div id="header" role="banner">
        <h1 id="logo">Admin Control Panel</h1>
    </div><!-- end #header -->

    <div id="content">
        <div class="panel-controls nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/admin')}"><g:message code="default.home.label"/></a></li>
                <sec:ifLoggedIn>
                    <sec:ifAllGranted roles="${eshop.RoleHelper.ROLE_USER}">
                        <li><a class="profile" href="<g:createLink controller="user" action="profile"
                                                                   params="[redirect: request.requestURI]"/>"><g:message
                                code="profile"/></a></li>
                    </sec:ifAllGranted>
                    <li>
                        <common:logoutLink class="logout"></common:logoutLink>
                        %{--<a class="logout" href="<g:createLink controller="logout"/>"><g:message code="logout"/></a>--}%
                    </li>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <li>
                        <common:loginLink class="login"></common:loginLink>
                        %{--<a class="login" href="<g:createLink controller="login"/>"><g:message code="login"/></a>--}%
                    </li>
                </sec:ifNotLoggedIn>
            </ul>
        </div>
        <g:layoutBody/>
    </div>
</div>
</div>


<div id="footer" role="contentinfo">
    <g:message code="application.name" default="EShop"/> | <g:message code="application.copyRight"
                                                                      default="© AGAH-IT 2012"/> | <g:message
            code="version"/>
</div><!-- end #footer -->

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt"
                                                                   default="Loading&hellip;"/></div>
<g:javascript library="application"/>
<r:layoutResources/>

<script>

    function msgSuccess(text) {
        $.msgGrowl({
            type: 'success', 'text': text, position: 'bottom-left'
        });
    }

    function msgInfo(text) {
        $.msgGrowl({
            type: 'info', 'text': text, position: 'bottom-left'
        });
    }

    function msgWarning(text) {
        $.msgGrowl({
            type: 'warning', 'text': text, position: 'bottom-left'
        });
    }

    function msgError(text) {
        $.msgGrowl({
            type: 'error', 'text': text, position: 'bottom-left'
        });
    }
</script>
</body>
</html>
