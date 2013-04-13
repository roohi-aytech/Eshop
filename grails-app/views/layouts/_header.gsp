<div class="navbar navbar-fixed-top header">
    <div class="table navbar-inner">
        <div class="table-row">
            <div class="table-cell category-cell">
                <div class="pull-right" style="margin-right: 0;">
                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
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
                                   href="${createLink(controller: 'site', action: 'browse', params: [productType: rootProductType.name])}">${rootProductType.name}</a>
                                <ul class="dropdown-menu">
                                    <g:each in="${rootProductType.children}" var="secondLevelProductType">
                                        <li>
                                        <a href="${createLink(controller: 'site', action: 'browse', params: [productType: secondLevelProductType.name])}" >${secondLevelProductType.name}</a>
                                    </g:each>
                                </ul>
                            </li>
                        </g:each>
                    </ul>
                </div>
            </div>

            <div class="table-cell action-cell">

                <div class="btn-group pull-right topNavigationItem" id="link-basket">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span><g:message code="basket"></g:message></span>
                        <span id="basketCounter" class="counter">{{basketCounter}}</span>
                    </a>

                    <div id="basketItems" class="dropdown-menu content">
                        <ul class="scrollable">
                            <li ng-repeat="basketItem in basket">
                                <span class="basket-item-image">
                                    <img src="<g:createLink controller="image"
                                                            action="index"/>/{{basketItem.id}}?wh=50x50"/>
                                </span>
                                <span class="basket-item-title">{{basketItem.name}}<br/>
                                    <g:message code="basket-items-count"></g:message>: <span
                                        class="basket-item-count">{{basketItem.count}}
                                </span>
                                </span>
                            </li>
                        </ul>
                        <g:link class="btn btn-warning" controller="basket" action="checkout"><g:message
                                code="basket.show"></g:message></g:link>
                    </div>
                </div>

                <div class="btn-group pull-right topNavigationItem" id="link-compareList">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span><g:message code="compareList"></g:message></span>
                        <span class="counter">0</span>
                    </a>

                    <div class="dropdown-menu content">
                        <g:message code="underConstruction"></g:message>
                    </div>
                </div>

                <div class="btn-group pull-right topNavigationItem" id="link-wishList">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span><g:message code="wishList"></g:message></span>
                        <span class="counter">0</span>
                    </a>

                    <div class="dropdown-menu content">
                        <g:message code="underConstruction"></g:message>
                    </div>
                </div>

                <div class="btn-group pull-right topNavigationItem" id="link-userMenu">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span><g:message code="user.controlpanel.label"></g:message></span>
                    </a>

                    <sec:ifLoggedIn>
                        <ul class="dropdown-menu">
                            <li class="dropdown">
                                <a tabindex="-1"
                                   href="<g:createLink controller="Customer" action="panel"></g:createLink>"><g:message
                                        code="user.controlpanel.label"></g:message></a></li>
                            <li class="divider"></li>
                            <li class="dropdown">
                                <a tabindex="-1"
                                   href="<g:createLink controller="Customer"
                                                       action="profile"></g:createLink>"><g:message
                                        code="profile"></g:message></a></li>
                            <li class="dropdown">
                                <a tabindex="-1"
                                   href="<g:createLink controller="Customer"
                                                       action="changePassword"></g:createLink>"><g:message
                                        code="password.change.label"></g:message></a></li>
                            <li class="divider"></li>
                            <li class="dropdown">
                                <common:logoutLink tabindex="-1"></common:logoutLink>
                            </li>
                        </ul>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <ul class="dropdown-menu">
                            <li class="dropdown">
                                <common:loginLink tabindex="-1"></common:loginLink></li>
                            <li class="dropdown">
                                <common:registerLink tabindex="-1"></common:registerLink></li>
                        </ul>
                    </sec:ifNotLoggedIn>
                </div>

            </div>

            <div class="table-cell">
                <div class="search-box table">
                    <div class="table-cell category-select">
                    <div class="btn-group pull-right" style="margin-top: 5px;">
                        <a class="btn btn-inverse-grey dropdown-toggle" data-toggle="dropdown" href="#">
                            <span id="searchCategory"><g:message code="category.all"></g:message></span>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <g:set var="rootProductTypes" value="${productService.findRootProductTypes()}"></g:set>
                            <g:each in="${rootProductTypes}" var="rootProductType">
                            %{--<li><a href="#">${rootProductType.name}</a></li>--}%
                                <li class="dropdown-submenu">
                                    <a tabindex="-1"
                                       href="#"
                                       onclick="$('#searchCategory').html('${rootProductType.name}')">${rootProductType.name}</a>
                                    <ul class="dropdown-menu">
                                        <g:each in="${rootProductType.children}" var="secondLevelProductType">
                                            <li>
                                            <a href="#" onclick="$('#searchCategory').html('${secondLevelProductType.name}')">${secondLevelProductType.name}</a>
                                        </g:each>
                                    </ul>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                    </div>
                    <form class="navbar-search pull-right table-cell">
                        <input type="text" class="input-large search-query" placeholder="<g:message code="search"/>">
                    </form>

                    <div id="btn-search" class="btn-group pull-right table-cell" style="margin-right: 0;">
                        <a class="btn btn-inverse dropdown-toggle" data-toggle="dropdown" href="#">
                            <span></span></a>
                    </div>
                </div>
            </div>

            <div class="table-cell logo-cell">
                <a id="logo" href="${createLink(controller: 'site')}"><h1><g:message code="title"></g:message></h1></a>
            </div>

            <div class="table-cell support-cell">
                <span id="support-number"><g:message code="support.number"></g:message></span>
                <a href="#"><g:message code="support.label"></g:message></a>
            </div>
        </div>
    </div>
</div>
