<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title><g:message code="wishList"/></title>
    <meta name="layout" content="mobile">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

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

<div id="youraccount">
    <div>
        <h2 class="ib"><g:message code="wishList.mobile.title"/></h2>
        <h4 class="ib gray">(<span id="wishlist_item_cnt">{{wishListCounter}}</span> <g:message
                code="alerts.compare.items.item"/>)</h4>

        <div class="clear"></div>
    </div>
</div>

<div class="filter-products">
    <ul id="listing-container" class="product-list">
        <li style="height: 415px;" ng-repeat="wishListItem in wishList">
            <a ng-href="{{contextRoot}}site/product/{{wishListItem.id}}">
                <div class="product-info">
                    <img border="0" style="display: inline-block;" ng-src="{{contextRoot}}site/image/{{wishListItem.id}}?wh=100x100"/>

                    <h2 href="#">{{wishListItem.title}}</h2>

                    <div class="price">
                        <h5>
                            <span class="price">

                                <span class="current" itemtype="http://schema.org/Offer" itemscope="" itemprop="offers">
                                    <span itemprop="price">
                                        <g:message code="price"/>: <b>{{wishListItem.price}} <eshop:currencyLabel/></b>
                                    </span>
                                </span>

                            </span>

                        </h5>
                    </div>
                </div>
            </a>
            <div ng-click="removeFromWishList(wishListItem.id);" class="close close_item">x</div>
        </li>
    </ul>
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