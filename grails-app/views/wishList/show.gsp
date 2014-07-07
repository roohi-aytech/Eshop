<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title><g:message code="wishList"/></title>
    <meta name="layout" content="site">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap.min.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet"
          href="${resource(dir: 'bootstrap/css', file: 'bootstrap-responsive.min.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-rtl.css', plugin: 'rapid-grails')}"/>
    <link href="${resource(dir: 'css', file: 'site.css')}" rel="stylesheet" type="text/css"/>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <script language="javascript" type="text/javascript">
        function addToBasket(id, title, price) {
            var scope = angular.element(document.getElementById('main-container')).scope();
            scope.addToBasket(id, title, price, [], 1, 'product');
            scope.$apply();
        }
        function addToCompareList(id, title, price) {
            var scope = angular.element(document.getElementById('main-container')).scope();
            scope.addToCompareList(id, title, price);
            scope.$apply();
        }


        function removeWishList(id) {
            var scope = angular.element(document.getElementById('main-container')).scope();
            scope.removeFromWishList(id);
        }
    </script>
</head>

<body>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="shopping-basket wish-list">
                <h2><g:message code="wishList"/></h2>

                <div class="group">
                    <ul>
                        <li ng-repeat="wishListItem in wishList">
                            <span class="image"><img ng-src="{{contextRoot}}site/image/{{wishListItem.id}}?wh=100x100"/>
                            </span>
                            <span class="name"><h3><a
                                    ng-href="{{contextRoot}}site/product/{{wishListItem.id}}">{{wishListItem.title}}</a>
                            </h3>
                            </span>
                            <span class="price"><g:message code="price"></g:message>: <b>{{wishListItem.price}} <g:message code="rial"/></b>
                            </span>
                            <span>
                                <a href="" class="btn-buy"
                                   onclick="addToBasket({{wishListItem.id}}, '{{wishListItem.title}}', '{{wishListItem.price}}')"><span><g:message code="add-to-basket"></g:message></span>
                                </a>
                                <a href="" class="btn-compare"
                                   onclick="addToCompareList({{wishListItem.id}}, '{{wishListItem.title}}', '{{wishListItem.price}}')"><span><g:message code="add-to-compareList"></g:message></span>
                                </a>
                            </span>
                            <span class="delete">[ <a type="button"
                                                      onclick="removeWishList({{wishListItem.id}})"><g:message
                                        code="application_delete"></g:message></a> ]</span>
                        </li>
                    </ul>
                </div>
                <sec:ifNotLoggedIn>
                    <div class="info">
                        <div><g:message code="wishList.notEnabled.message"/></div>
                        <common:loginLink class="btn btn-success"/>
                        <common:registerLink class="btn btn-primary"/>
                    </div>
                </sec:ifNotLoggedIn>
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