<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title>Bootstrap, from Twitter</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${resource(dir: 'css/templates', file: 'firstPage.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap.min.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-rtl.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'site.css')}"/>
    <style>
    body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
    }
    </style>
    <link rel="stylesheet"
          href="${resource(dir: 'bootstrap/css', file: 'bootstrap-responsive.min.css', plugin: 'rapid-grails')}"/>
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-amazon.css')}"/>--}%

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

</head>

<body>
<g:javascript src="browse.js"></g:javascript>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="<g:createLink action="index2"/>">Zanbil</a>

            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li><a href="#"><g:message code="support"/></a></li>
                    <li><a href="#"><g:message code="wishList"/></a></li>
                    <li><a href="#"><g:message code="compareList"/></a></li>
                    <li><a href="#"><g:message code="basket"/></a></li>
                    <li><a href="#"><g:message code="profile-title"/></a></li>
                </ul>
            </div><!--/.nav-collapse -->
        %{--<ul class="nav pull-right">--}%
        %{--<li class="dropdown">--}%
        %{--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--}%
        %{--Account--}%
        %{--<b class="caret"></b>--}%
        %{--</a>--}%
        %{--<ul class="dropdown-menu">--}%
        %{--<li><a href="#">a</a></li>--}%
        %{--<li><a href="#">b</a></li>--}%
        %{--<li><a href="#">c</a></li>--}%
        %{--<li class="dropdown-submenu">--}%
        %{--<a tabindex="-1" href="#">More options</a>--}%
        %{--<ul class="dropdown-menu">--}%
        %{--<li><a href="#">a</a></li>--}%
        %{--<li><a href="#">b</a></li>--}%
        %{--<li><a href="#">c</a></li>--}%
        %{--<li class="dropdown-submenu">--}%
        %{--<a tabindex="-1" href="#">More options</a>--}%
        %{--<ul class="dropdown-menu">--}%
        %{--<li><a href="#">a</a></li>--}%
        %{--<li><a href="#">b</a></li>--}%
        %{--<li><a href="#">c</a></li>--}%
        %{--</ul>--}%
        %{--</li>--}%
        %{--</ul>--}%
        %{--</li>--}%
        %{--</ul>--}%
        %{--</li>--}%
        %{--</ul>--}%
            <div class="btn-group pull-right" style="margin-right: 0px; margin-left: 10px;">
                <a class="btn btn-inverse dropdown-toggle" data-toggle="dropdown" href="#">
                    <g:message code="site.selectCategory"></g:message>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <g:each in="${rootProductTypes}" var="rootProductType">
                    %{--<li><a href="#">${rootProductType.name}</a></li>--}%
                        <li class="dropdown-submenu">
                            <a tabindex="-1" href="#">${rootProductType.name}</a>
                            <ul class="dropdown-menu">
                                <g:each in="${rootProductType.children}" var="secondLevelProductType">
                                    <li><a href="javascript:topProductTypeSelect(${secondLevelProductType.id})">${secondLevelProductType.name}</a>
                                    </li>
                                </g:each>
                            </ul>
                        </li>
                    </g:each>
                </ul>
            </div>

            <form class="navbar-search pull-right">
                <input type="text" class="input-large search-query" placeholder="<g:message code="search"/>">
            </form>
        </div>
    </div>
</div>

<div class="content container-fluid">
    <div class="row-fluid">

        <div class="span6">
            <div class="well">

                <div class="btn-group">
                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                        <g:message code="request"/>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><g:message code="send-to-compare"/></a></li>
                        <li><a href="#"><g:message code="send-to-wish-list"/></a></li>
                        <li class="divider"></li>
                        <li><a href="#"><g:message code="send-to-friend"/></a></li>
                    </ul>
                    <a class="btn btn-primary"><g:message code="more-details"/></a>
                    <a class="btn btn-success"><g:message code="buy"/></a>

                </div>

                <h3>${product?.name}</h3>

                <p>
                    <g:message code="price"/>
                    <strong>
                        <g:render template="price"/>
                    </strong>
                </p>

                <p>
                    <g:message code="brand"/>:
                    <strong>${product?.brand}</strong>
                </p>

                <div class="product-description">${product?.description}</div>

                <g:render template="product/variation"/>
            </div>
        </div>

        <div class="span6">
            <div class="product-images well"><g:render template="product/zoom"/></div>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <div class="well">
                <p>
                    <g:render template="product/description" model="[product: product]"/>
                </p>
            </div>
        </div>
    </div>


</div>
<g:javascript library="jquery"/>
<script src="${resource(dir: 'bootstrap/js', file: 'bootstrap.min.js', plugin: 'rapid-grails')}"></script>
</body>
</html>