%{--<%@ page import="eshop.Order; eshop.OrderHelper; eshop.RoleHelper; eshop.Customer; eshop.User; eshop.ProductType" %>--}%

<header id="page_header">
    %{--<div class="nav" id="top_bar">--}%
        %{--<div class="container">--}%
            %{--<div class="row">--}%
                %{--<nav class="clearfix">--}%


                    %{--<div class="header_user_info clearfix pull-right" id="header_user_info">--}%
                        %{--<a rel="nofollow" href="<g:createLink controller="site" action="shoppingRules" />" class="terms_and_conditions">--}%
                            %{--<g:message code="rules.shoppingRules"/>--}%
                        %{--</a>--}%
                        %{--<sec:ifLoggedIn>--}%
                            %{--<a rel="nofollow" href="<g:createLink controller="logout" action="index" />" class="logout">--}%
                                %{--<g:message code="logout"/>--}%
                            %{--</a>--}%
                            %{--<g:link controller="customer" action="panel">--}%
                                    %{--<g:message code="profile"/>--}%
                            %{--</g:link>--}%
                            %{--<span>--}%
                                %{--<common:userFullName/>--}%
                            %{--</span>--}%
                        %{--</sec:ifLoggedIn>--}%
                        %{--<sec:ifNotLoggedIn>--}%
                            %{--<a rel="nofollow" href="<g:createLink controller="customer" action="register" />" class="sing_up">--}%
                                %{--<g:message code="register-goldaan"/>--}%
                            %{--</a>--}%
                            %{--<a rel="nofollow" href="<g:createLink controller="login" action="auth" />" class="login">--}%
                                %{--<g:message code="login-goldaan"/>--}%
                            %{--</a>--}%
                        %{--</sec:ifNotLoggedIn>--}%


                    %{--</div>--}%
                    %{--<dl class="stlinkgroups_top pull-right dropdown_wrap first-item  hidden-xs " id="multilink_1">--}%
                        %{--<dt class="dropdown_tri">--}%

                        %{--<div class="dropdown_tri_inner">--}%
                            %{--<b></b>--}%
                            %{--<g:message code="goldaan-help"/>--}%
                        %{--</div>--}%
                    %{--</dt>--}%
                        %{--<dd class="dropdown_list dropdown_right">--}%
                            %{--<ul>--}%
                                %{--<li>--}%
                                    %{--<a rel="nofollow" title="Contact us"--}%
                                       %{--href="<g:createLink controller="site" action="contactUs" />">--}%
                                        %{--<g:message code="contact.label"/>--}%
                                    %{--</a>--}%
                                %{--</li>--}%
                                %{--<li>--}%
                                    %{--<a rel="nofollow" title="Delivery"--}%
                                       %{--href="<g:createLink controller="site" action="shoppingSteps" />">--}%
                                        %{--<g:message code="buy-help-goldaan"/>--}%
                                    %{--</a>--}%
                                %{--</li>--}%
                            %{--</ul>--}%
                        %{--</dd>--}%
                    %{--</dl>--}%

                    %{--<div class="pull-left">--}%
                        %{--<g:render template="/layouts/${grailsApplication.config.eShop.instance}/search"/>--}%
                    %{--</div>--}%
                    %{--<div class="pull-left">--}%
                        %{----}%
                    %{--</div>--}%
                %{--</nav>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</div>--}%

    <section id="top_extra">
        <g:if test="${controllerName!='basket' && actionName!='checkout' }">
            %{--<table><tr><td>--}%
                <g:render template="/layouts/${grailsApplication.config.eShop.instance}/menu"/>

            %{--</td><td>--}%
                %{--<g:if test="${controllerName=='site' && actionName=='index'}">--}%
                %{--<div style="">--}%
                    %{--<ehcache:render template="/site/banners/enamad"/>--}%
                    %{--<iframe src="/eNamadLogo.htm" frameborder="0" scrolling="no" allowtransparency="true" style="width: 150px; height:150px;"></iframe>--}%
                %{--</div>--}%
                %{--</g:if>--}%
            %{--</td></tr></table>--}%
        </g:if>


    </section>

</header>
