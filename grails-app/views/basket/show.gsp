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
    <g:javascript>
        function updateBasketItemCount(id, count) {
            var scope = angular.element(document.getElementById('main-container')).scope();

            var fount = false;
            for (var i = 0; i < scope.basket.length; i++) {
                if (id == scope.basket[i].id) {
                    scope.basket[i].count = count;
                    scope.$apply();
                    found = true;
                }
            }

            if (found)
                scope.changeCount(id, count);
        }
    </g:javascript>
</head>

<body>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="shopping-basket">
                <h2><g:message code="basket.content"/></h2>

                <div class="group">
                    <ul>
                        <li ng-repeat="basketItem in basket">
                            <span class="image"><img ng-src="{{contextRoot}}site/image/{{basketItem.id}}?wh=100x100"/>
                            </span>
                            <span class="name"><h3><a
                                    ng-href="{{contextRoot}}site/product/{{basketItem.id}}">{{basketItem.title}}</a>
                            </h3>
                            </span>
                            <span class="price"><g:message code="price"></g:message>: <b>{{basketItem.price}}</b></span>
                            <span class="count"><g:message code="count"></g:message>: <input type="text"
                                                                                             value="{{basketItem.count}}"
                                                                                             onkeyup="updateBasketItemCount({{basketItem.id}},this.value)"/>
                            </span>
                            <span class="delete">[ <a type="button"
                                                      ng-click="removeFromBasket(basketItem.id)"><g:message
                                        code="application_delete"></g:message></a> ]</span>
                        </li>
                    </ul>

                    <div class="check-out">
                        <g:message code="basket.totalPrice"></g:message>: <span
                            class="totalPrice">{{calculateBasketTotalPrice()}}</span>
                        <g:link action="invoice" class="btn btn-primary"><g:message
                                code="basket.checkout"/></g:link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- /container -->

<script type="text/javascript">
    (function ($) {
        $('.row-fluid ul.thumbnails li.span6:nth-child(2n + 3)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span4:nth-child(3n + 4)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span3:nth-child(4n + 5)').css('margin-right', '0px');
    })(jQuery);
</script>
</body>
</html>