<%@ page import="eshop.Order; eshop.OrderHelper; eshop.RoleHelper; eshop.Customer; eshop.User; eshop.ProductType" %>


<div class="top_menu">
    <div class="top_menu_main">
        <div class="right_links">
            <ul class="links">
                <li><g:link uri="/"><g:message code="home"/></g:link> |</li>
                <li id="link-compare">
                    <g:link controller="comparison" action="show">
                        <b ng-show="compareListCounter" class="ng-cloak">
                            <g:message code="compare"/><span
                                ng-show="compareListCounter">&nbsp;({{compareListCounter}})</span>
                        </b>
                        <span ng-hide="compareListCounter" class="ng-cloak"><g:message code="compare"/></span>
                    </g:link> |
                </li>
                <li>
                    <g:link controller="wishList" action="show">
                        <b ng-show="wishListCounter" class="ng-cloak">
                            <g:message code="wishList"/><span
                                ng-show="wishListCounter">&nbsp;({{wishListCounter}})</span>
                        </b>
                        <span ng-hide="wishListCounter" class="ng-cloak"><g:message code="wishList"/></span>
                    </g:link> |
                </li>
                <li><a href="javascript:void(window.open('http://support.zanbil.ir:81/chat.php?acid=26617','','width=590,height=760,left=0,top=0,resizable=yes,menubar=no,location=no,status=yes,scrollbars=yes'))"><g:message
                        code="support.label"/></a> |</li>
                <li><g:link uri="/contactUs"><g:message code="contact.label"/></g:link></li>
            </ul>

            <div class="clearfix"></div>
        </div>

        <div class="left_links">
            <ul>
                <sec:ifLoggedIn>
                    <g:set var="currentUser" value="${User.findByUsername(sec.username())}"/>
                    <li class="user_name"><g:message code="welcome" args="${[currentUser]}"/></li>
                    <li class="needhelp" id="menu-account"><a href="<g:createLink controller="Customer" action="panel"/>"><g:message
                            code="account.title"/></a>

                        <div id="accountTooltipContainer">
                            <ul>

                                <g:if test="${currentUser.authorities.any {
                                    it.authority in [
                                            RoleHelper.ROLE_USER_ADMIN
                                    ]
                                }}">
                                    <li><a tabindex="-1"
                                           href="<g:createLink uri="/admin"/>"><g:message
                                                code="admin.controlpanel.label"/></a></li>
                                </g:if>
                                <g:if test="${currentUser instanceof Customer}">
                                    <li><a tabindex="-1"
                                           href="<g:createLink controller="Customer" action="panel"/>"><g:message
                                                code="user.controlpanel.label"/></a></li>
                                </g:if>
                                <li><common:logoutLink/></li>
                            </ul>
                        </div>
                    </li>
                    <script language="javascript" type="text/javascript">

                        $('#menu-account').qtip({
                            id: 'accountTooltip',
                            content: {
                                text: $('#accountTooltipContainer')
                            },
                            style: {
                                classes: 'qtip-bootstrap',
                                width: 120
                            },
                            position: {
                                my: 'top center',
                                at: 'bottom center'
                            },
                            show: {
                                effect: function (offset) {
                                    $(this).slideDown(100);
                                }
                            },
                            hide: {
                                fixed: true,
                                delay: 1000
                            },
                            metadata: {
                                type: 'html5'
                            }
                        });
                    </script>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <li>
                        <g:message code="header.links.loginOrRegister"
                                   args="${[common.loginLink(class: "red underline"), common.registerLink(class: "red underline")]}"/>
                    </li>
                </sec:ifNotLoggedIn>
                <li>
                    <g:render template="/layouts/${grailsApplication.config.eShop.instance}/shoppingBasket"/>
                </li>
            </ul>

            <div class="clearfix"></div>
        </div>

        <div class="clearfix"></div>
    </div>

    <div class="clearfix"></div>
</div>

<div class="header">
    <div class="header_middle">
        <div class="logo">
            <a href="${createLink(uri: '/')}"><g:message code="title"/></a>
        </div>

        <div class="search_container">
            <g:render template="/layouts/${grailsApplication.config.eShop.instance}/search"/>
        </div>

        <div class="clearfix"></div>
    </div>

    <div class="navigation">
        <g:render template="/layouts/${grailsApplication.config.eShop.instance}/menu"/>
        <div class="clearfix"></div>
    </div>

    <div class="clearfix"></div>
</div>

