<!-- HEADER STARTS -->


<div id="menu_overlay"></div>
<header>
    <div class="top-nav">
        <div class="right logo">
            <a href="${createLink(uri: '/')}" id="toggle" class="menuexpand" data-ref="toggle-categories">
                <img src="${resource(dir: 'images/mobile', file: "logo-${grailsApplication.config.eShop.instance}.png")}"
                     class="logo-img" width="47" border="0"/>
            </a>

        </div>

        <div class="left user-info">
            <ul>
                <li>
                    <div class="cart menuexpand" id="cart-div" data-ref="cartheader">
                        <img src="${resource(dir: 'images/mobile', file: 'cart-icon.png')}" width="24">
                        <span class="cart-quantity" id='mshow_item_total'>{{basketCounter}}</span>
                    </div>

                </li>
                <li>
                    <a href="${createLink(controller: 'login', action: 'auth')}">
                        <sec:ifLoggedIn>
                            <div class="user menuexpand" data-ref="notification">
                        </sec:ifLoggedIn>
                        <sec:ifNotLoggedIn>
                            <div class="user" data-ref="notification">
                        </sec:ifNotLoggedIn>
                        <h2 id="user-not">
                            <img src="${resource(dir: 'images/mobile', file: 'user-icon.png')}" height="23"
                                 border="0"/>
                            <sec:ifLoggedIn>
                                <span class="online"><img src="${resource(dir:'/images/mobile', file:'online.png')}" width="11"
                                                          height="11" border="0"></span>
                            </sec:ifLoggedIn>
                        </h2>
                    </div>
                    </a>
                </li>
                <li>
                    <div class="serach-icon menuexpand" data-ref="toggle-search">
                        <h2 id="search">
                            <img src="${resource(dir: 'images/mobile', file: 'search-icon.png')}" height="23"
                                 border="0"/>
                        </h2>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div id="toggle-categories" class="menucollapse" style="display:none;">
        <div class="cat_scroll">
            <div class="department-head">
                <h1><span class="red"><g:message code="category"/></span> <g:message code="products"/></h1>
            </div>
            <%@ page import="grails.converters.JSON; eshop.MenuConfig; eshop.ProductType" %>
            <% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
            <g:set var="rootProductTypes" value="${productService.findRootProductTypes()}"/>
            <ul>
                <a href="${createLink(uri: "/")}"><div
                        class="back-btn"><g:message code="home"/></div></a>
                <g:each in="${rootProductTypes}" var="productType">
                    <a href="${createLink(uri: "/browse/${productType.urlName}")}">
                        <li>${productType.name}</li>
                    </a>
                </g:each>
            </ul>
        </div>

        <div class="browse_asset">
            <ul>
                <li>
                    <a href="${createLink(uri: '/')}"><img
                            src="${resource(dir: 'images/mobile', file: 'home_mini.png')}"
                            align="absmiddle" width="40"
                            border="0"><span><g:message code="home"/></span></a>
                    <a href="${createLink(controller: 'order', action: 'track')}"><img
                            src="${resource(dir: 'images/mobile', file: 'track-mini.png')}" align="absmiddle" width="40"
                            border="0"><span><g:message code="order.tracking.link"/></span></a>
                    <a href="${createLink(controller: 'customer', action: 'panel')}"><img
                            src="${resource(dir: 'images/mobile', file: 'panel-mini.png')}" align="absmiddle"
                            width="40"
                            border="0"><span><g:message code="customer.panel.link"/> (<g:message code="commingSoon"/>)</span></a>
                    <a href="#"><img
                            src="${resource(dir: 'images/mobile', file: 'help-mini.png')}" align="absmiddle" width="40"
                            border="0"><span><g:message code="help.link"/> (<g:message code="commingSoon"/>)</span></a>

                </li>
            </ul>
        </div>

    </div>

    <div id="notification" class="menucollapse" style="display: none;">
        <div class="notification_scroll">
            <div class="department-head">
                <h1><span class="gray"> <sec:username/></span></h1>
            </div>
            <div class="notif">

                <a href="${createLink(controller: 'order', action: 'list')}">
                    <div class="acnt-btn">
                        <h3><g:message code="yourOrders"/><span class="icon-arrowRight"></span></h3>
                    </div>
                </a>
                <a href="${createLink(controller: 'wishList', action: 'show')}">
                    <div class="acnt-btn">
                        <h3><g:message code="wishList.mobile.button"/><span class="icon-arrowRight"></span></h3>
                    </div>
                </a>

                <a href="${createLink(controller: 'logout')}">
                    <div class="logout-btn">
                        <a href="${createLink(controller: 'logout')}"><h3><g:message code="logout"/></h3></a>
                    </div>
                </a>
            </div>
        </div>

    </div>

    <script language="javascript" type="text/javascript">
        function searchFormSubmit() {
            if ($.trim($('#search-text-top').val()).length < 3) {
                return false;
            } else {
                $(this).find('input:hidden').val($('#search-text-top').val());
                _gaq.push(['_trackEvent', 'Search Box', 'Click', 'Submit']);
                return true;
            }
        }
    </script>

    <div id="toggle-search" class="menucollapse" style="display: none;">
        <form name="toggle-search" method="get" action="${createLink(uri: '/search')}"
              id="toggle-search-form" onsubmit="searchFormSubmit()">
            <input type="text" name="phrase" id="search-text-top" placeholder="${message(code: 'search')}"/>
            <g:hiddenField name="f" id="hidCategory" value="p${productTypeId ? productTypeId.toString() : '0'}"/>
            <g:if test="${params.f}">
                <g:hiddenField name="f" id="hidFilter" value="${params.f?.toString()?.split(',')?.findAll {
                    !it.toString().startsWith('p')
                }?.join(',')}"/>
            </g:if>
            <input type="submit" id="search-submit" value="${message(code: 'search.btn')}"/>
        </form>


        <div class="tags_wrapper_menu">
            <div class="wrapper_heading_container"><div class="wrapper_heading"><g:message
                    code="search.sample.title"/></div></div>

            <div class="tag_container">

                <a class="p_btn"
                   href="${createLink(uri: "/search?phrase=${message(code: 'search.sample.1')}&f=p0")}"><g:message
                        code="search.sample.1"/></a>
                <a class="p_btn"
                   href="${createLink(uri: "/search?phrase=${message(code: 'search.sample.2')}&f=p0")}"><g:message
                        code="search.sample.2"/></a>
                <a class="p_btn"
                   href="${createLink(uri: "/search?phrase=${message(code: 'search.sample.3')}&f=p0")}"><g:message
                        code="search.sample.3"/></a>
            </div>
        </div>

    </div>

    <div id="cartheader" class="menucollapse">
        <div id="order-summ" class="header_cart">
            <g:render template="/layouts/${grailsApplication.config.eShop.instance}/mobile/basket"/>
        </div>

    </div>

</header>



<!-- HEADER ENDS -->