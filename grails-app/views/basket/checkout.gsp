<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title><g:message code="site.title"/></title>
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

    <g:javascript>
        function updateBasketItemCount(id, count) {
            var scope = angular.element(document.getElementById('main-container')).scope();

            var fount = false;
            for (var i = 0; i < scope.basket.length; i++) {
                if (parseInt(id) == scope.basket[i].id) {
                    scope.basket[i].count = count;
                    scope.$apply();
                    found = true;
                }
            }

            if (found)
                scope.changeCount(id, count);
        }

        function updateCityList(provinceCombo, cityCombo){
            var currentCityId = '${customerInstance?.address?.city?.id}';

            var $el = $("#" + cityCombo);
            $el.empty(); // remove old options
            $.ajax({
                type:"GET",
                url:"<g:createLink controller="province" action="getProvinceCities"/>",
                data:{id: $('#' + provinceCombo).val()}
            }).done(function (response) {
                $el = $("#" + cityCombo);
                $el.empty(); // remove old options
                for(var i = 0; i < response.length; i++)
                    if(response[i].id.toString() == currentCityId)
                      $el.append($("<option selected></option>")
                         .attr("value", response[i].id).text(response[i].title));
                     else
                      $el.append($("<option></option>")
                         .attr("value", response[i].id).text(response[i].title));
            });
        }

        $(document).ready(function(){
           updateCityList('province1', 'city1');
           updateCityList('province2', 'city2');
        });
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
                    ng-href="{{contextRoot}}site/product/{{basketItem.productId}}">{{basketItem.name}}</a>
            </h3>
            </span>
            <span class="price"><g:message code="price"></g:message>: <b>{{basketItem.price}}</b></span>
            <span class="count"><g:message code="count"></g:message>: <input type="text"
                                                                             value="{{basketItem.count}}"
                                                                             onkeyup="updateBasketItemCount('{{basketItem.id}}', this.value)"/>
            </span>
            <span class="delete">[ <a type="button"
                                      ng-click="removeFromBasket(basketItem.id)"><g:message
                        code="application_delete"></g:message></a> ]</span>
        </li>
    </ul>

    <div class="check-out">
        <g:message code="basket.totalPrice"></g:message>: <span
            class="totalPrice">{{calculateBasketTotalPrice()}}</span>
    </div>
</div>

<sec:ifLoggedIn>
    <h2><g:message code="order.owner.info"/></h2>
    <g:form action="invoice" method="post">
    <div class="group form">
        <div class="table">
            <div class="table-row">
                <div class="table-cell">
                    <h4><g:message code="invoice.specification"></g:message> </h4>
                    <div class="content">
                    <div class="field">
                        <label for="ownerName"><g:message code="invoice.owner.name"></g:message></label>
                        <input type="text" id="ownerName" name="ownerName" value="${customer}"
                               class="block full"/>
                    </div>

                    <div class="field">
                        <label for="ownerEmail"><g:message
                                code="invoice.owner.email"></g:message></label>
                        <input type="text" id="ownerEmail" name="ownerEmail" value="${customer.email}"
                               class="block full"/>
                    </div>

                    <div class="field">
                        <label for="ownerMobile"><g:message
                                code="invoice.owner.mobile"></g:message></label>
                        <input type="text" id="ownerMobile" name="ownerMobile"
                               value="${customer.mobile}" class="block full"/>
                    </div>

                    <div class="field">
                        <label for="ownerTelephone"><g:message
                                code="invoice.owner.telephone"></g:message></label>
                        <input type="text" id="ownerTelephone" name="ownerTelephone"
                               value="${customer.telephone}" class="block full"/>
                    </div>
                    </div>
                </div>

                <div class="table-cell">
                    <h4><g:message code="invoice.sendingAddress"></g:message> </h4>

                    <div class="table auto content">
                        <div class="table-row">
                            <div class="table">
                                <div class="table-row">
                                    <div class="table-cell">
                                        <div>
                                            <label for='province1'><g:message
                                                    code="springSecurity.register.province.label"/>:</label> *
                                            <select name="province1" id="province1"
                                                    onchange="updateCityList('province1', 'city1');" class="block half">
                                                <g:set var="provinceList"
                                                       value="${eshop.Province.findAll()}"></g:set>
                                                <g:each in="${provinceList}" var="province">
                                                    <option ${customer?.address?.city?.province?.id == province.id ? 'selected' : ''}
                                                            value="${province.id}">${province.title}</option>
                                                </g:each>
                                            </select>
                                        </div>

                                        <div>
                                            <label for='postalCode1'><g:message
                                                    code="springSecurity.register.postalCode.label"/>:</label>
                                            <input type='text' name='postalCode1' id='postalCode1'
                                                   value="${customer?.address?.postalCode}"
                                                   class="block half"/>
                                        </div>
                                    </div>

                                    <div class="table-cell">

                                        <div>
                                            <label for='city1'><g:message
                                                    code="springSecurity.register.city.label"/>:</label> *
                                            <select name="city1" id="city1" class="block half">
                                            </select>
                                        </div>

                                        <div>
                                            <label for='telephone1'><g:message
                                                    code="springSecurity.register.telephone.label"/>:</label>
                                            <input type='text' name='telephone1' id='telephone1'
                                                   value="${customer?.address?.telephone}"
                                                   class="block half"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="table-row">
                            <div class="table-cell">
                                <label for='addressLine1'><g:message
                                        code="springSecurity.register.address.label"/>:</label>
                                <textarea type='text' name='addressLine1'
                                          id='addressLine1'
                                          class="block full">${customer?.address?.addressLine1}</textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="table-cell">

                    <h4><g:message code="invoice.billingAddress"></g:message></h4>
                    <div class="table auto content">
                        <div class="table-row">
                            <div class="table">
                                <div class="table-row">
                                    <div class="table-cell">
                                        <div>
                                            <label for='province2'><g:message
                                                    code="springSecurity.register.province.label"/>:</label> *
                                            <select name="province2" id="province2"
                                                    onchange="updateCityList('province2', 'city2');" class="block half">
                                                <g:set var="provinceList"
                                                       value="${eshop.Province.findAll()}"></g:set>
                                                <g:each in="${provinceList}" var="province">
                                                    <option ${customer?.address?.city?.province?.id == province.id ? 'selected' : ''}
                                                            value="${province.id}">${province.title}</option>
                                                </g:each>
                                            </select>
                                        </div>

                                        <div>
                                            <label for='postalCode2'><g:message
                                                    code="springSecurity.register.postalCode.label"/>:</label>
                                            <input type='text' name='postalCode2' id='postalCode2'
                                                   value="${customer?.address?.postalCode}"
                                                   class="block half"/>
                                        </div>
                                    </div>

                                    <div class="table-cell">

                                        <div>
                                            <label for='city2'><g:message
                                                    code="springSecurity.register.city.label"/>:</label> *
                                            <select name="city2" id="city2" class="block half">
                                            </select>
                                        </div>

                                        <div>
                                            <label for='telephone2'><g:message
                                                    code="springSecurity.register.telephone.label"/>:</label>
                                            <input type='text' name='telephone2' id='telephone2'
                                                   value="${customer?.address?.telephone}"
                                                   class="block half"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="table-row">
                            <div class="table-cell">
                                <label for='addressLine2'><g:message
                                        code="springSecurity.register.address.label"/>:</label>
                                <textarea type='text' name='addressLine2'
                                          id='addressLine2'
                                          class="block full">${customer?.address?.addressLine1}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="check-out">
            <input type="submit" class="btn btn-primary" value="<g:message code="basket.invoice"/>" />
        </div>
    </div>
    </g:form>
</sec:ifLoggedIn>

<sec:ifNotLoggedIn>
    <div class="info">
        <div><g:message code="basket.checkout.loginRequired"></g:message></div>
        <common:loginLink class="btn btn-success"></common:loginLink>
        <common:registerLink class="btn btn-primary"></common:registerLink>
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