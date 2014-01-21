<%@ page import="eshop.Order; eshop.OrderHelper; eshop.RoleHelper; eshop.Customer; eshop.User; eshop.ProductType" %>


<div class="navbar navbar-fixed-top header">
<div class="navbar-inner">
<table class="table-simulated" id="header">
<tr class="table-row header-links-row">
    <td class="table-cell logo-cell" rowspan="3">
        <h1 id="logo"><a href="${createLink(uri: '/')}"><g:message code="title"/></a></h1>
    </td>
    <td class="link-list" colspan="2">
        <ul>
            <li><g:link uri="/"><g:message code="home"/></g:link></li>
            <li><g:link controller="comparison" action="show"><g:message code="compare"/><span
                    ng-show="compareListCounter" class="ng-cloak">&nbsp;({{compareListCounter}})</span></g:link></li>
            <li><g:link controller="wishList" action="show"><g:message code="wishList"/><span
                    ng-show="wishListCounter" class="ng-cloak">&nbsp;({{wishListCounter}})</span></g:link></li>
            <li><a href="javascript:void(window.open('http://support.zanbil.ir:81/chat.php?acid=26617','','width=590,height=760,left=0,top=0,resizable=yes,menubar=no,location=no,status=yes,scrollbars=yes'))"><g:message
                    code="support.label"/></a></li>
            <li><g:link uri="/contactUs"><g:message code="contact.label"/></g:link></li>
        </ul>
        <span class="user-links">
            <sec:ifLoggedIn>
                <g:set var="currentUser" value="${User.findByUsername(sec.username())}"/>
                <g:if test="${currentUser.authorities.any {
                    it.authority in [
                            RoleHelper.ROLE_USER_ADMIN
                    ]
                }}">
                    <a tabindex="-1"
                       href="<g:createLink uri="/admin"/>"><g:message
                            code="admin.controlpanel.label"/></a> -
                </g:if>
                <g:if test="${currentUser instanceof Customer}">
                    <a tabindex="-1"
                       href="<g:createLink controller="Customer" action="panel"/>"><g:message
                            code="user.controlpanel.label"/></a> -
                </g:if>
                <common:logoutLink/>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <common:loginLink/> -
                <common:registerLink/>
            </sec:ifNotLoggedIn>
        </span>
    </td>
</tr>
<tr class="header-box-row">
    <td>
        <g:render template="/layouts/search_zanbil"/>
    </td>
    <td class="basket-cell">
        <g:render template="/layouts/shoppingBasket_zanbil"/>
    </td>
</tr>
<tr class="header-menu-row">
    <td colspan="2">
        <g:render template="/layouts/menu_zanbil"/>
    </td>
</tr>
%{--<td class="table-cell category-cell">--}%
%{--<div class="pull-right" style="margin-right: 0;">--}%
%{--<a class="btn btn-inverse dropdown-toggle" data-toggle="dropdown" href="#">--}%
%{--<span><g:message code="category.jump"></g:message></span>--}%
%{--<span class="caret"></span>--}%
%{--</a>--}%
%{--<ul class="dropdown-menu">--}%
%{--<% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>--}%
%{--<g:set var="rootProductTypes" value="${productService.findRootProductTypes()}"></g:set>--}%
%{--<g:each in="${rootProductTypes}" var="rootProductType">--}%
%{--<li><a href="#">${rootProductType.name}</a></li>--}%
%{--<li class="dropdown-submenu">--}%
%{--<a tabindex="-1"--}%
%{--href="${createLink(uri: "/browse/${rootProductType.urlName}")}">${rootProductType.name}</a>--}%
%{--<ul class="dropdown-menu">--}%
%{--<g:each in="${rootProductType.children}" var="secondLevelProductType">--}%
%{--<li>--}%
%{--<a href="${createLink(uri: "/browse/${secondLevelProductType.urlName}")}" >${secondLevelProductType.name}</a>--}%
%{--</g:each>--}%
%{--</ul>--}%
%{--</li>--}%
%{--</g:each>--}%
%{--</ul>--}%
%{--</div>--}%
%{--</td>--}%

%{--<td class="table-cell action-cell">--}%

%{--<div class="btn-group pull-right topNavigationItem ${session.getAttribute("basketCounter")?.toInteger() > 0 ? 'full' : ''}"--}%
%{--id="link-basket">--}%
%{--<a class="dropdown-toggle" data-toggle="dropdown" href="#"--}%
%{--original-title="${message(code: "basket")}">--}%
%{--<span><g:message code="basket"></g:message></span>--}%
%{--<span id="basketCounter" class="counter">{{basketCounter}}</span>--}%
%{--</a>--}%

%{--<div id="basketItems" class="dropdown-menu content">--}%
%{--<ul class="scrollable">--}%
%{--<li ng-repeat="basketItem in basket">--}%
%{--<span class="basket-item-image">--}%
%{--<img src="<g:createLink controller="image"--}%
%{--action="index"/>/{{basketItem.id}}?type=productModel&wh=50x50"/>--}%
%{--</span>--}%
%{--<span class="basket-item-title">{{basketItem.name}}<br/>--}%
%{--<g:message code="basket-items-count"></g:message>: <span--}%
%{--class="basket-item-count">{{basketItem.count}}--}%
%{--</span><br/>--}%
%{--<g:message code="price"></g:message>: <span--}%
%{--class="basket-item-count">{{basketItem.price}}--}%
%{--</span>--}%
%{--</span>--}%
%{--</li>--}%
%{--<li ng-show="!basket.length"><g:message code="basket.empty"></g:message></li>--}%
%{--</ul>--}%

%{--<common:link class="btn btn-warning" controller="basket" action="checkout" https="${false}"><g:message--}%
%{--code="basket.show"></g:message></common:link>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="btn-group pull-right topNavigationItem" id="link-compareList">--}%
%{--<a class="dropdown-toggle" data-toggle="dropdown" href="#"--}%
%{--original-title="${message(code: "compareList")}">--}%
%{--<span><g:message code="compareList"></g:message></span>--}%
%{--<span class="counter">{{compareListCounter}}</span>--}%
%{--</a>--}%

%{--<div id="compareListItems" class="dropdown-menu content">--}%
%{--<ul class="scrollable">--}%
%{--<li ng-repeat="compareListItem in compareList">--}%
%{--<span class="basket-item-image">--}%
%{--<img src="<g:createLink controller="image"--}%
%{--action="index"/>/{{compareListItem.id}}?wh=50x50"/>--}%
%{--</span>--}%
%{--<span class="basket-item-title">{{compareListItem.title}}<br/>--}%
%{--<g:message code="price"></g:message>: <span--}%
%{--class="basket-item-count">{{compareListItem.price}}--}%
%{--</span>--}%
%{--</span>--}%
%{--</li>--}%
%{--<li ng-show="!compareList.length"><g:message code="compareList.empty"></g:message></li>--}%
%{--</ul>--}%
%{--<g:link class="btn btn-warning" controller="comparison" action="show"><g:message--}%
%{--code="compareList.show"></g:message></g:link>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="btn-group pull-right topNavigationItem" id="link-wishList">--}%
%{--<a class="dropdown-toggle" data-toggle="dropdown" href="#"--}%
%{--original-title="${message(code: "wishList")}">--}%
%{--<span><g:message code="wishList"></g:message></span>--}%
%{--<span class="counter">{{wishListCounter}}</span>--}%
%{--</a>--}%

%{--<div id="wishListItems" class="dropdown-menu content">--}%
%{--<ul class="scrollable">--}%
%{--<li ng-repeat="wishListItem in wishList">--}%
%{--<span class="basket-item-image">--}%
%{--<img src="<g:createLink controller="image"--}%
%{--action="index"/>/{{wishListItem.id}}?wh=50x50"/>--}%
%{--</span>--}%
%{--<span class="basket-item-title">{{wishListItem.title}}<br/>--}%
%{--<g:message code="price"></g:message>: <span--}%
%{--class="basket-item-count">{{wishListItem.price}}--}%
%{--</span>--}%
%{--</span>--}%
%{--</li>--}%
%{--<li ng-show="!wishList.length"><g:message code="wishList.empty"></g:message></li>--}%
%{--</ul>--}%
%{--<g:link class="btn btn-warning" controller="wishList" action="show"><g:message--}%
%{--code="wishList.show"></g:message></g:link>--}%
%{--</div>--}%
%{--</div>--}%

%{--<sec:ifLoggedIn>--}%
%{--<g:set var="currentUser" value="${User.findByUsername(sec.username())}"/>--}%
%{--<div class="btn-group pull-right topNavigationItem" id="link-userMenu-loggedIn">--}%
%{--<a class="dropdown-toggle" data-toggle="dropdown" href="#"--}%
%{--original-title="${message(code: "userMenu")} [ ${currentUser} ]">--}%
%{--<span><g:message code="user.controlpanel.label"/></span>--}%
%{--</a>--}%
%{--<ul class="dropdown-menu">--}%
%{--<g:if test="${currentUser.authorities.any {--}%
%{--it.authority in [--}%
%{--RoleHelper.ROLE_USER_ADMIN--}%
%{--]--}%
%{--}}">--}%
%{--<li class="dropdown">--}%
%{--<a tabindex="-1"--}%
%{--href="<g:createLink uri="/admin"/>"><g:message--}%
%{--code="admin.controlpanel.label"/></a></li>--}%
%{--</g:if>--}%
%{--<g:if test="${currentUser instanceof Customer}">--}%
%{--<li class="dropdown">--}%
%{--<a tabindex="-1"--}%
%{--href="<g:createLink controller="Customer" action="panel"/>"><g:message--}%
%{--code="user.controlpanel.label"/></a></li>--}%
%{--</g:if>--}%
%{--<li class="divider"></li>--}%
%{--<g:if test="${currentUser instanceof Customer}">--}%
%{--<g:set var="inquiredOrders"--}%
%{--value="${Order.findAllByCustomerAndStatusAndPaymentTimeoutGreaterThanEquals(currentUser as Customer, OrderHelper.STATUS_INQUIRED, new Date())}"/>--}%
%{--<g:if test="${inquiredOrders?.size() > 0}">--}%
%{--<li class="group-title"><g:message code="order.actions.completion"/></li>--}%
%{--<g:each in="${inquiredOrders}">--}%
%{--<li class="dropdown">--}%
%{--<a tabindex="-1"--}%
%{--href="<g:createLink controller="order"--}%
%{--action="completion" params="${[id: it.id]}"/>"><g:message--}%
%{--code="order.trackingCode"/>: ${it.trackingCode}</a></li>--}%
%{--</g:each>--}%
%{--<li class="divider"></li>--}%
%{--</g:if>--}%
%{--<li class="dropdown">--}%
%{--<a tabindex="-1"--}%
%{--href="<g:createLink controller="Customer"--}%
%{--action="profile"/>"><g:message--}%
%{--code="profile"/></a></li>--}%
%{--</g:if>--}%
%{--<li class="dropdown">--}%
%{--<a tabindex="-1"--}%
%{--href="<g:createLink controller="Customer"--}%
%{--action="changePassword"/>"><g:message--}%
%{--code="password.change.label"/></a></li>--}%
%{--<li class="dropdown">--}%
%{--<common:logoutLink tabindex="-1"/>--}%
%{--</li>--}%
%{--</ul>--}%
%{--</div>--}%
%{--</sec:ifLoggedIn>--}%
%{--<sec:ifNotLoggedIn>--}%

%{--<div class="btn-group pull-right topNavigationItem" id="link-userMenu-notLoggedIn">--}%
%{--<a class="dropdown-toggle" data-toggle="dropdown" href="#"--}%
%{--original-title="${message(code: "logInOrRegister")}">--}%
%{--<span><g:message code="user.controlpanel.label"/></span>--}%
%{--</a>--}%
%{--<ul class="dropdown-menu">--}%
%{--<li class="dropdown">--}%
%{--<common:loginLink tabindex="-1"/></li>--}%
%{--<li class="dropdown">--}%
%{--<common:registerLink tabindex="-1"/></li>--}%
%{--</ul>--}%
%{--</div>--}%
%{--</sec:ifNotLoggedIn>--}%


%{--<div class="btn-group pull-right topNavigationItem" id="link-contactus">--}%
%{--<a class="dropdown-toggle" data-toggle="dropdown" href="#">--}%
%{--<span><g:message code="wishList"></g:message></span>--}%
%{--</a>--}%

%{--<div id="contactusItems" class="dropdown-menu content">--}%

%{--<div class="support-cell">--}%
%{--<span id="support-number"><g:message code="support.number"></g:message></span>--}%
%{--<a href="javascript:void(window.open('http://support.zanbil.ir:81/chat.php?acid=26617','','width=590,height=760,left=0,top=0,resizable=yes,menubar=no,location=no,status=yes,scrollbars=yes'))">پشتیبانی آنلاین</a>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

%{--</td>--}%

%{--<td class="table-cell">--}%

%{--</td>--}%



%{--<div class="table-cell support-cell">--}%
%{--<span id="support-number"><g:message code="support.number"></g:message></span>--}%
%{--<script type="text/javascript" id="lz_textlink" src="http://support.zanbil.ir:81/image.php?acid=fc474&amp;tl=1&amp;srv=aHR0cDovLzkxLjk5Ljk4LjcwOjgxL2NoYXQucGhwP2FjaWQ9MjY2MTc_&amp;tlont=2b7YtNiq24zYqNin2YbbjCDYotmG2YTYp9uM2YY_&amp;tloft=2b7YtNiq24zYqNin2YbbjCDYotmG2YTYp9uM2YY_&amp;xhtml=1"></script>--}%
%{--</div>--}%
</table>
</div>
</div>

