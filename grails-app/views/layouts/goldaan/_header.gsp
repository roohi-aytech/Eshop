%{--<%@ page import="eshop.Order; eshop.OrderHelper; eshop.RoleHelper; eshop.Customer; eshop.User; eshop.ProductType" %>--}%

<header id="page_header">
    <div class="nav" id="top_bar">
        <div class="container">
            <div class="row">
                <nav class="clearfix">


                    <div class="header_user_info clearfix pull-right" id="header_user_info">
                        <a title="Login to your customer account" rel="nofollow"
                           href="#" class="terms_and_conditions">
                            <g:message code="terms-and-conditions-goldaan"/>
                        </a>
                        <a title="Login to your customer account" rel="nofollow"
                           href="#" class="sing_up">
                            <g:message code="register-goldaan"/>
                        </a>
                        <a title="Login to your customer account" rel="nofollow"
                           href="#" class="login">
                            <g:message code="login-goldaan"/>
                        </a>

                    </div>
                    <dl class="stlinkgroups_top pull-right dropdown_wrap first-item  hidden-xs " id="multilink_1">
                        <dt class="dropdown_tri">

                        <div class="dropdown_tri_inner">
                            <b></b>
                            <g:message code="goldaan-help"/>
                        </div>
                    </dt>
                        <dd class="dropdown_list dropdown_right">
                            <ul>
                                <li>
                                    <a rel="nofollow" title="Contact us"
                                       href="#">
                                        <g:message code="contact.label"/>
                                    </a>
                                </li>
                                <li>
                                    <a rel="nofollow" title="Delivery"
                                       href="#">
                                        <g:message code="buy-help-goldaan"/>
                                    </a>
                                </li>
                            </ul>
                        </dd>
                    </dl>

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
