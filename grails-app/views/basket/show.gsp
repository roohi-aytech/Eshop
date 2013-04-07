<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title>Bootstrap, from Twitter</title>
    <meta name="layout" content="site">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap.min.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet"
          href="${resource(dir: 'bootstrap/css', file: 'bootstrap-responsive.min.css', plugin: 'rapid-grails')}"/>
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-amazon.css')}"/>--}%
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-rtl.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'site.css')}"/>
    <style>
    body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
    }
    </style>

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

    <g:javascript src="thumbnails.js"></g:javascript>
    <g:javascript src="common.js"></g:javascript>
</head>

<body>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span2">

        </div>

        <div class="span8">
            <div>
                <h2><g:message code="your.basket"/></h2>
                <ul>
                    <li ng-repeat="basketItem in basket">
                        <span>{{basketItem.name}}</span>
                        <span>{{basketItem.count}}</span>
                        <input type="button" ng-click="removeFromBasket(basketItem.id)" value="delete"/>
                    </li>
                </ul>
                <g:link action="checkout"><g:message code="basket.checkout"/></g:link>
            </div>
        </div>

        <div class="span2">
            <div class="well">
            </div>
        </div>
    </div>
</div> <!-- /container -->

<g:javascript library="jquery"/>
<script src="${resource(dir: 'bootstrap/js', file: 'bootstrap.min.js', plugin: 'rapid-grails')}"></script>
<script type="text/javascript">
    (function ($) {
        $('.row-fluid ul.thumbnails li.span6:nth-child(2n + 3)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span4:nth-child(3n + 4)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span3:nth-child(4n + 5)').css('margin-right', '0px');
    })(jQuery);
</script>
</body>
</html>