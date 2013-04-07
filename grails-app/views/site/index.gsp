<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title>Bootstrap, from Twitter</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'coin-slider.css')}"/>
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
    <g:javascript src="coin-slider.js"></g:javascript>
</head>

<body>
<div class="layout-container">
    <div class="span180">
        <div class="well sidebar-nav home">
            <div id="navigator_root">
                <a href="/EShop/site/browse/${message(code: "applicances")}" id="navigator_appliance"><g:message
                        code="applicances"></g:message></a>
                <a href="/EShop/site/browse/${message(code: "digital")}" id="navigator_digital"><g:message
                        code="digital"></g:message></a>
            </div>
        </div>
    </div>

    <div class="span200">
        <div class="well">
        </div>
    </div>

    <div class="span600">

        <g:render template="browse/slideshowMain"></g:render>

        <g:render template="browse/slideshowSpecialSales" model="[discounts: discounts]"></g:render>

    </div>
</div>
<script type="text/javascript">
    (function ($) {
        $('.row-fluid ul.thumbnails li.span6:nth-child(2n + 3)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span4:nth-child(3n + 4)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span3:nth-child(4n + 5)').css('margin-right', '0px');
    })(jQuery);
</script>
</body>
</html>