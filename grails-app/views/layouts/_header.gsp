<%@ page import="eshop.Order; eshop.OrderHelper; eshop.RoleHelper; eshop.Customer; eshop.User; eshop.ProductType" %>
<div class="navbar navbar-fixed-top header">
<table class="table-simulated navbar-inner">
<tr class="table-row">
<td class="table-cell category-cell">
    <div class="pull-right" style="margin-right: 0;">
        <a class="btn btn-inverse dropdown-toggle" data-toggle="dropdown" href="#">
            <span><g:message code="category.jump"></g:message></span>
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
            <g:set var="rootProductTypes" value="${productService.findRootProductTypes()}"></g:set>
            <g:each in="${rootProductTypes}" var="rootProductType">
            %{--<li><a href="#">${rootProductType.name}</a></li>--}%
                <li class="dropdown-submenu">
                    <a tabindex="-1"
                       href="${createLink(uri: "/browse/${rootProductType.urlName}")}">${rootProductType.name}</a>
                    <ul class="dropdown-menu">
                        <g:each in="${rootProductType.children}" var="secondLevelProductType">
                            <li>
                            <a href="${createLink(uri: "/browse/${secondLevelProductType.urlName}")}" >${secondLevelProductType.name}</a>
                        </g:each>
                    </ul>
                </li>
            </g:each>
        </ul>
    </div>
</td>

<td class="table-cell action-cell">

    <div class="btn-group pull-right topNavigationItem ${session.getAttribute("basketCounter")?.toInteger() > 0 ? 'full' : ''}"
         id="link-basket">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"
           original-title="${message(code: "basket")}">
            <span><g:message code="basket"></g:message></span>
            <span id="basketCounter" class="counter">{{basketCounter}}</span>
        </a>

        <div id="basketItems" class="dropdown-menu content">
            <ul class="scrollable">
                <li ng-repeat="basketItem in basket">
                    <span class="basket-item-image">
                        <img src="<g:createLink controller="image"
                                                action="index"/>/{{basketItem.id}}?type=productModel&wh=50x50"/>
                    </span>
                    <span class="basket-item-title">{{basketItem.name}}<br/>
                        <g:message code="basket-items-count"></g:message>: <span
                            class="basket-item-count">{{basketItem.count}}
                    </span><br/>
                        <g:message code="price"></g:message>: <span
                            class="basket-item-count">{{basketItem.price}}
                    </span>
                    </span>
                </li>
                <li ng-show="!basket.length"><g:message code="basket.empty"></g:message></li>
            </ul>

            <common:link class="btn btn-warning" controller="basket" action="checkout" https="false"><g:message
                    code="basket.show"></g:message></common:link>
        </div>
    </div>

    <div class="btn-group pull-right topNavigationItem" id="link-compareList">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"
           original-title="${message(code: "compareList")}">
            <span><g:message code="compareList"></g:message></span>
            <span class="counter">{{compareListCounter}}</span>
        </a>

        <div id="compareListItems" class="dropdown-menu content">
            <ul class="scrollable">
                <li ng-repeat="compareListItem in compareList">
                    <span class="basket-item-image">
                        <img src="<g:createLink controller="image"
                                                action="index"/>/{{compareListItem.id}}?wh=50x50"/>
                    </span>
                    <span class="basket-item-title">{{compareListItem.title}}<br/>
                        <g:message code="price"></g:message>: <span
                            class="basket-item-count">{{compareListItem.price}}
                    </span>
                    </span>
                </li>
                <li ng-show="!compareList.length"><g:message code="compareList.empty"></g:message></li>
            </ul>
            <g:link class="btn btn-warning" controller="comparison" action="show"><g:message
                    code="compareList.show"></g:message></g:link>
        </div>
    </div>

    <div class="btn-group pull-right topNavigationItem" id="link-wishList">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"
           original-title="${message(code: "wishList")}">
            <span><g:message code="wishList"></g:message></span>
            <span class="counter">{{wishListCounter}}</span>
        </a>

        <div id="wishListItems" class="dropdown-menu content">
            <ul class="scrollable">
                <li ng-repeat="wishListItem in wishList">
                    <span class="basket-item-image">
                        <img src="<g:createLink controller="image"
                                                action="index"/>/{{wishListItem.id}}?wh=50x50"/>
                    </span>
                    <span class="basket-item-title">{{wishListItem.title}}<br/>
                        <g:message code="price"></g:message>: <span
                            class="basket-item-count">{{wishListItem.price}}
                    </span>
                    </span>
                </li>
                <li ng-show="!wishList.length"><g:message code="wishList.empty"></g:message></li>
            </ul>
            <g:link class="btn btn-warning" controller="wishList" action="show"><g:message
                    code="wishList.show"></g:message></g:link>
        </div>
    </div>

    <sec:ifLoggedIn>
        <g:set var="currentUser" value="${User.findByUsername(sec.username())}"/>
        <div class="btn-group pull-right topNavigationItem" id="link-userMenu-loggedIn">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"
               original-title="${message(code: "userMenu")} [ ${currentUser} ]">
                <span><g:message code="user.controlpanel.label"/></span>
            </a>
            <ul class="dropdown-menu">
                <g:if test="${currentUser.authorities.any {
                    it.authority in [
                            RoleHelper.ROLE_USER_ADMIN
                    ]
                }}">
                    <li class="dropdown">
                        <a tabindex="-1"
                           href="<g:createLink uri="/admin"/>"><g:message
                                code="admin.controlpanel.label"/></a></li>
                </g:if>
                <g:if test="${currentUser instanceof Customer}">
                    <li class="dropdown">
                        <a tabindex="-1"
                           href="<g:createLink controller="Customer" action="panel"/>"><g:message
                                code="user.controlpanel.label"/></a></li>
                </g:if>
                <li class="divider"></li>
                <g:if test="${currentUser instanceof Customer}">
                    <g:set var="inquiredOrders"
                           value="${Order.findAllByCustomerAndStatusAndTrackingCodeNotIsNull(currentUser as Customer, OrderHelper.STATUS_INQUIRED)}"/>
                    <g:if test="${inquiredOrders?.size() > 0}">
                        <g:each in="${inquiredOrders}">
                            <li class="group-title"><g:message code="order.actions.completion"/></li>
                            <li class="dropdown">
                                <a tabindex="-1"
                                   href="<g:createLink controller="order"
                                                       action="completion" params="${[id: it.id]}"/>"><g:message
                                        code="order.trackingCode"/>: ${it.trackingCode}</a></li>
                        </g:each>
                        <li class="divider"></li>
                    </g:if>
                    <li class="dropdown">
                        <a tabindex="-1"
                           href="<g:createLink controller="Customer"
                                               action="profile"/>"><g:message
                                code="profile"/></a></li>
                </g:if>
                <li class="dropdown">
                    <a tabindex="-1"
                       href="<g:createLink controller="Customer"
                                           action="changePassword"/>"><g:message
                            code="password.change.label"/></a></li>
                <li class="dropdown">
                    <common:logoutLink tabindex="-1"/>
                </li>
            </ul>
        </div>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>

        <div class="btn-group pull-right topNavigationItem" id="link-userMenu-notLoggedIn">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"
               original-title="${message(code: "logInOrRegister")}">
                <span><g:message code="user.controlpanel.label"/></span>
            </a>
            <ul class="dropdown-menu">
                <li class="dropdown">
                    <common:loginLink tabindex="-1"/></li>
                <li class="dropdown">
                    <common:registerLink tabindex="-1"/></li>
            </ul>
        </div>
    </sec:ifNotLoggedIn>


    <div class="btn-group pull-right topNavigationItem" id="link-contactus">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <span><g:message code="wishList"></g:message></span>
        </a>

        <div id="contactusItems" class="dropdown-menu content">

            <div class="support-cell">
                <span id="support-number"><g:message code="support.number"></g:message></span>
                <a href="javascript:void(window.open('http://support.zanbil.ir:81/chat.php?acid=26617','','width=590,height=760,left=0,top=0,resizable=yes,menubar=no,location=no,status=yes,scrollbars=yes'))">پشتیبانی آنلاین</a>
            </div>
        </div>
    </div>

</td>

<td class="table-cell">
    <div class="search-box">
        <g:form url="${createLink(uri: '/search')}" method="get" id="searchForm">
            <g:hiddenField name="f" id="hidCategory" value="p${productTypeId ? productTypeId.toString() : '0'}"/>
        %{--<g:if test="${params.f}">--}%
        %{--<g:hiddenField name="f" id="hidFilter" value="${params.f}"/>--}%
        %{--</g:if>--}%
            <table class="table-simulated">
                <tr class="table-row">
                    <td class="table-cell category-select">
                        <div class="btn-group pull-right" style="margin-top: 5px;">
                            <a class="btn btn-inverse-grey dropdown-toggle" data-toggle="dropdown" href="#">
                                <span id="searchCategory">
                                    ${params.category && params.category != "0" ? ProductType.get(params.category)?.name : productTypeId ? productTypeName.toString() : message(code: 'category.all')}
                                </span>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <g:set var="rootProductTypes" value="${productService.findRootProductTypes()}"></g:set>
                                <g:each in="${rootProductTypes}" var="rootProductType">
                                %{--<li><a href="#">${rootProductType.name}</a></li>--}%
                                    <li class="dropdown-submenu">
                                        <a tabindex="-1"
                                           href="#"
                                           onclick="$('#hidCategory').val('p${rootProductType.id}');
                                           $('#searchCategory').html('${rootProductType.name}')">${rootProductType.name}</a>
                                        <ul class="dropdown-menu">
                                            <g:each in="${rootProductType.children}" var="secondLevelProductType">
                                                <li>
                                                <a href="#" onclick="$('#hidCategory').val('p${secondLevelProductType.id}');$('#searchCategory').html('${secondLevelProductType.name}')">${secondLevelProductType.name}</a>
                                            </g:each>
                                        </ul>
                                    </li>
                                </g:each>
                            </ul>
                        </div>
                    </td>

                    <td class="navbar-search pull-right table-cell search-input-box">
                        <input name="phrase" id="searchPhrase" type="text" class="input-large search-query"
                               autocomplete="off"
                               value="${params.phrase ? params.phrase : ''}" placeholder="<g:message code="search"/>">
                    </td>

                    <td id="btn-search" class="btn-group pull-right table-cell" style="margin-right: 0;">
                        <g:submitButton name="s" class="btn btn-inverse dropdown-toggle" value=""
                                        onclick="\$(this).attr('disabled', true);return \$('searchPhrase').val() != '';"/>
                    </td>
                </tr>
            </table>
        </g:form>
    </div>
</td>

<td class="table-cell logo-cell">
    <a id="logo" href="${createLink(uri: '/')}"><h1><g:message code="title"></g:message></h1></a>
</td>

%{--<div class="table-cell support-cell">--}%
%{--<span id="support-number"><g:message code="support.number"></g:message></span>--}%
%{--<script type="text/javascript" id="lz_textlink" src="http://support.zanbil.ir:81/image.php?acid=fc474&amp;tl=1&amp;srv=aHR0cDovLzkxLjk5Ljk4LjcwOjgxL2NoYXQucGhwP2FjaWQ9MjY2MTc_&amp;tlont=2b7YtNiq24zYqNin2YbbjCDYotmG2YTYp9uM2YY_&amp;tloft=2b7YtNiq24zYqNin2YbbjCDYotmG2YTYp9uM2YY_&amp;xhtml=1"></script>--}%
%{--</div>--}%
</tr>
</table>
</div>

