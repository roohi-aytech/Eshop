%{--<%@ page import="eshop.Order; eshop.OrderHelper; eshop.RoleHelper; eshop.Customer; eshop.User; eshop.ProductType" %>--}%


%{--<div class="navbar navbar-fixed-top header">--}%
%{--<div class="navbar-inner">--}%
%{--<table class="table-simulated" id="header">--}%
%{--<tr class="table-row header-links-row">--}%
%{--<td class="table-cell logo-cell" rowspan="3">--}%
%{--<h1 id="logo"><a href="${createLink(uri: '/')}"><g:message code="title"/></a></h1>--}%
%{--</td>--}%
%{--<td class="link-list" colspan="2">--}%
%{--<ul>--}%
%{--<li><g:link uri="/"><g:message code="home"/></g:link></li>--}%
%{--<li id="link-compare">--}%
%{--<g:link controller="comparison" action="show">--}%
%{--<b ng-show="compareListCounter" class="ng-cloak">--}%
%{--<g:message code="compare"/><span ng-show="compareListCounter">&nbsp;({{compareListCounter}})</span>--}%
%{--</b>--}%
%{--<span ng-hide="compareListCounter" class="ng-cloak"><g:message code="compare"/></span>--}%
%{--</g:link>--}%
%{--</li>--}%
%{--<li>--}%
%{--<g:link controller="wishList" action="show">--}%
%{--<b ng-show="wishListCounter" class="ng-cloak">--}%
%{--<g:message code="wishList"/><span ng-show="wishListCounter">&nbsp;({{wishListCounter}})</span>--}%
%{--</b>--}%
%{--<span ng-hide="wishListCounter" class="ng-cloak"><g:message code="wishList"/></span>--}%
%{--</g:link>--}%
%{--</li>--}%
%{--<li><a href="javascript:void(window.open('http://support.zanbil.ir:81/chat.php?acid=26617','','width=590,height=760,left=0,top=0,resizable=yes,menubar=no,location=no,status=yes,scrollbars=yes'))"><g:message--}%
%{--code="support.label"/></a></li>--}%
%{--<li><g:link uri="/contactUs"><g:message code="contact.label"/></g:link></li>--}%
%{--</ul>--}%
%{--<span class="user-links">--}%
%{--<sec:ifLoggedIn>--}%
%{--<g:set var="currentUser" value="${User.findByUsername(sec.username())}"/>--}%
%{--<g:if test="${currentUser.authorities.any {--}%
%{--it.authority in [--}%
%{--RoleHelper.ROLE_USER_ADMIN--}%
%{--]--}%
%{--}}">--}%
%{--<a tabindex="-1"--}%
%{--href="<g:createLink uri="/admin"/>"><g:message--}%
%{--code="admin.controlpanel.label"/></a> ---}%
%{--</g:if>--}%
%{--<g:if test="${currentUser instanceof Customer}">--}%
%{--<a tabindex="-1"--}%
%{--href="<g:createLink controller="Customer" action="panel"/>"><g:message--}%
%{--code="user.controlpanel.label"/></a> ---}%
%{--</g:if>--}%
%{--<common:logoutLink/>--}%
%{--</sec:ifLoggedIn>--}%
%{--<sec:ifNotLoggedIn>--}%
%{--<common:loginLink/> ---}%
%{--<common:registerLink/>--}%
%{--</sec:ifNotLoggedIn>--}%
%{--</span>--}%
%{--</td>--}%
%{--</tr>--}%
%{--<tr class="header-box-row">--}%
%{--<td>--}%
%{--<g:render template="/layouts/${grailsApplication.config.eShop.instance}/search"/>--}%
%{--</td>--}%
%{--<td class="basket-cell">--}%
%{--<g:render template="/layouts/${grailsApplication.config.eShop.instance}/shoppingBasket"/>--}%
%{--</td>--}%
%{--</tr>--}%
%{--<tr class="header-menu-row">--}%
%{--<td colspan="2">--}%
%{--<g:render template="/layouts/${grailsApplication.config.eShop.instance}/menu"/>--}%
%{--</td>--}%
%{--</tr>--}%
%{--</table>--}%
%{--</div>--}%
%{--</div>--}%

<header id="page_header">
    <div class="nav" id="top_bar">
        <div class="container">
            <div class="row">
                <nav class="clearfix">
                    <dl class="stlinkgroups_top pull-right dropdown_wrap first-item  hidden-xs " id="multilink_1">
                        <dt class="dropdown_tri">

                        <div class="dropdown_tri_inner">
                            Help
                            <b></b>
                        </div>
                    </dt>
                        <dd class="dropdown_list dropdown_right">
                            <ul>
                                <li>
                                    <a rel="nofollow" title="Contact us"
                                       href="#">
                                        Contact us
                                    </a>
                                </li>
                                <li>
                                    <a rel="nofollow" title="Delivery"
                                       href="#">
                                        Delivery
                                    </a>
                                </li>
                            </ul>
                        </dd>
                    </dl>

                    <div class="header_user_info clearfix pull-right" id="header_user_info">
                        <a title="Login to your customer account" rel="nofollow"
                           href="#" class="terms_and_conditions">
                            Terms&Conditions
                        </a>
                        <a title="Login to your customer account" rel="nofollow"
                           href="#" class="sing_up">
                            Sign Up
                        </a>
                        <a title="Login to your customer account" rel="nofollow"
                           href="#" class="login">
                            Login
                        </a>

                    </div>

                    <div class="pull-left">
                        <g:render template="/layouts/${grailsApplication.config.eShop.instance}/search"/>
                    </div>
                    %{--<div class="pull-left">--}%
                        %{----}%
                    %{--</div>--}%
                </nav>
            </div>
        </div>
    </div>
    <section class="" id="header">
        %{--<div class="wide_container">--}%
            %{--<div class="container">--}%
                %{--<div class="row">--}%


                %{--</div>--}%
            %{--</div>--}%
        %{--</div>--}%
    </section>
    <section id="top_extra">
        <g:render template="/layouts/${grailsApplication.config.eShop.instance}/menu"/>
        %{--<div class="wide_container">--}%
        %{--<div class="" id="st_mega_menu_container">--}%
        %{--<div class="container">--}%
        %{--<div class="row">--}%
        %{--<nav class="clearBoth col-xs-12" role="navigation" id="st_mega_menu_wrap">--}%
        %{--<ul class="visible-md visible-lg clearfix" id="st_mega_menu">--}%
        %{--<li class="sttlevel0  m_alignment_0 " id="st_menu_1">--}%
        %{--<a title="" class="ma_level_0 is_icon_menu " style=""--}%
        %{--href="http://transformer.sunnytoo.com/">--}%
        %{--<i class="icon-home"></i>--}%
        %{--</a>--}%
        %{--</li>--}%
        %{--<li class="sttlevel0  m_alignment_0" id="st_menu_11">--}%
        %{--<a title="Fashion" class="ma_level_0 is_parent " style=""--}%
        %{--href="http://transformer.sunnytoo.com/en/3-fashion">--}%
        %{--Fashion--}%
        %{--<i class="icon-down-dir-2"></i>--}%
        %{--</a>--}%

        %{--<div class="stmenu_sub style_wide col-md-12" style="display: none;">--}%
        %{--<div class="row">--}%
        %{--<div class="col-md-12 stmenu_container">--}%
        %{--<ul class="row sttlevel1">--}%
        %{--<li style="" class="mllevel1 col-md-3 pull-right">--}%
        %{--<a title="Women's Clothing" class="ma_level_1" style=""--}%
        %{--href="http://transformer.sunnytoo.com/en/4-women-s-clothing">--}%
        %{--Women's Clothing--}%
        %{--</a>--}%
        %{--<ul class=" sttlevel2">--}%
        %{--<li style="" class="mllevel2">--}%
        %{--<a title="Dresses" class="ma_level_2" style=""--}%
        %{--href="http://transformer.sunnytoo.com/en/5-dresses">--}%
        %{--Dresses--}%
        %{--</a>--}%
        %{--</li>--}%

        %{--</ul>--}%
        %{--</li>--}%

        %{--</ul>--}%

        %{--</div>--}%
        %{--</div>--}%
        %{--</div>--}%
        %{--</li>--}%
        %{--</ul>--}%
        %{--</nav>--}%
        %{--</div>--}%
        %{--</div>--}%
        %{--</div>--}%
        %{--</div>--}%

    </section>

</header>
