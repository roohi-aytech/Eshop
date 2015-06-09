<%@ page import="eshop.Order; eshop.OrderHelper; eshop.RoleHelper; eshop.Customer; eshop.User; eshop.ProductType" %>


<div class="navbar header">
<div class="navbar-inner">
<table class="table-simulated" id="header">
<tr class="table-row header-links-row">
    <td class="table-cell logo-cell" rowspan="3">
        <h1 id="logo"><a href="${createLink(uri: '/')}"><g:message code="title"/></a></h1>
    </td>
    <td class="link-list" colspan="2">
        <cache:block>
        <ul>
            <li><g:link uri="/"><g:message code="home"/></g:link></li>
            <li id="link-compare">
                <g:link controller="comparison" action="show">
                    <b ng-show="compareListCounter" class="ng-cloak">
                        <g:message code="compare"/><span ng-show="compareListCounter">&nbsp;({{compareListCounter}})</span>
                    </b>
                    <span ng-hide="compareListCounter" class="ng-cloak"><g:message code="compare"/></span>
                </g:link>
            </li>
            <li>
                <g:link controller="wishList" action="show">
                    <b ng-show="wishListCounter" class="ng-cloak">
                        <g:message code="wishList"/><span ng-show="wishListCounter">&nbsp;({{wishListCounter}})</span>
                    </b>
                    <span ng-hide="wishListCounter" class="ng-cloak"><g:message code="wishList"/></span>
                </g:link>
            </li>
            <li><a href="javascript:void(window.open('http://support.zanbil.ir:81/chat.php?acid=26617','','width=590,height=760,left=0,top=0,resizable=yes,menubar=no,location=no,status=yes,scrollbars=yes'))"><g:message
                    code="support.label"/></a></li>
            <li><g:link uri="/contactUs"><g:message code="contact.label"/></g:link></li>
        </ul>
        </cache:block>
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
%{--<cache:block>--}%
    <tr class="header-box-row">
        <td>
            <ehcache:render template="/layouts/${grailsApplication.config.eShop.instance}/search"/>
        </td>
        <td class="basket-cell">
            <ehcache:render template="/layouts/${grailsApplication.config.eShop.instance}/shoppingBasket"/>
        </td>
    </tr>
    <tr class="header-menu-row">
        <td colspan="2">
            <g:if test="${grailsApplication.config.menu.twoLevel}">
                <ehcache:render template="/layouts/${grailsApplication.config.eShop.instance}/menuTwoLevel"/>
            </g:if>
            <g:else>
                <ehcache:render template="/layouts/${grailsApplication.config.eShop.instance}/menu"/>
            </g:else>
        </td>
    </tr>
%{--</cache:block>--}%
</table>
</div>
</div>

