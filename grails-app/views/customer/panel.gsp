<%@ page import="eshop.OrderHelper; eshop.RoleHelper" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="site"/>
    <title><g:message code="controlPanel.title" default="Control Panel"/></title>
</head>

<body>
<div class="control-panel">
    <h2><g:message code="controlPanel.title" default="Control Panel"/></h2>
    <g:if test="${!customer?.registrationLevel || customer?.registrationLevel == 'basic'}">
        <div class="info">
            <div>
                <g:message code="springSecurity.completeRegistration.description"></g:message>

            </div>
            <a href="${createLink(controller: 'customer', action: 'profile')}" class="btn btn-primary"><g:message
                    code="springSecurity.completeRegistration.label"></g:message></a>
        </div>
    </g:if>
    <g:if test='${flash.message}'>
        <div class='info'><div>${flash.message}</div></div>
    </g:if>
    <ul>
        <li>
            <div class="group">
                <div class="groupHeader">
                    <img src="../images/box.png">

                    <h3><g:message code="controlPanel.orders.label"></g:message></h3>

                    <div class="comment"><g:message code="controlPanel.orders.description"></g:message></div>
                </div>

                <div class="column1 items">
                    <h4><g:message code="controlPanel.orders.yourOrders.label"></g:message></h4>
                    <ul class="master">
                        <li><g:link controller="order" action="list"
                                    params="${[status: OrderHelper.STATUS_CREATED]}"><g:message
                                    code="orders"/> <g:message
                                    code="order.status.${OrderHelper.STATUS_CREATED}"/></g:link></li>
                        <li><g:link controller="order" action="list"
                                    params="${[status: OrderHelper.STATUS_INCORRECT]}"><g:message
                                    code="orders"/> <g:message
                                    code="order.status.${OrderHelper.STATUS_INCORRECT}"/></g:link></li>
                        <li><g:link controller="order" action="list"
                                    params="${[status: OrderHelper.STATUS_UPDATING]}"><g:message
                                    code="orders"/> <g:message
                                    code="order.status.${OrderHelper.STATUS_UPDATING}"/></g:link></li>
                        <li><g:link controller="order" action="list"
                                    params="${[status: OrderHelper.STATUS_INQUIRED]}"><g:message
                                    code="orders"/> <g:message
                                    code="order.status.${OrderHelper.STATUS_INQUIRED}"/></g:link></li>
                        <li><g:link controller="order" action="list"
                                    params="${[status: OrderHelper.STATUS_PAID]}"><g:message
                                    code="orders"/> <g:message
                                    code="order.status.${OrderHelper.STATUS_PAID}"/></g:link></li>
                        <li><g:link controller="order" action="list"
                                    params="${[status: OrderHelper.STATUS_INCOMPLETE]}"><g:message
                                    code="orders"/> <g:message
                                    code="order.status.${OrderHelper.STATUS_INCOMPLETE}"/></g:link></li>
                        <li><g:link controller="order" action="list"
                                    params="${[status: OrderHelper.STATUS_TRANSMITTED]}"><g:message
                                    code="orders"/> <g:message
                                    code="order.status.${OrderHelper.STATUS_TRANSMITTED}"/></g:link></li>
                        <li><g:link controller="order" action="list"
                                    params="${[status: OrderHelper.STATUS_DELIVERED]}"><g:message
                                    code="orders"/> <g:message
                                    code="order.status.${OrderHelper.STATUS_DELIVERED}"/></g:link></li>
                    </ul>
                </div>

                <div class="column2 items">
                    <h4><g:message code="controlPanel.orders.payments.label"></g:message></h4>
                    <ul class="slave">
                    </ul>
                </div>
            </div>
        </li>
        <li>
            <div class="group">
                <div class="groupHeader">
                    <img src="../images/settings.png">

                    <h3><g:message code="controlPanel.settings.label"></g:message></h3>

                    <div class="comment"><g:message
                            code="controlPanel.settings.description"></g:message></div>
                </div>

                <div class="column1 items">
                    <h4><g:message code="controlPanel.settings.profile.label"></g:message></h4>
                    <ul class="master">
                        <li><g:link controller="customer" action="profile"><g:message
                                code="controlPanel.settings.profile.info.label"></g:message></g:link></li>
                        <li><g:link controller="customer" action="changePassword"><g:message
                                code="controlPanel.settings.profile.changePassword.label"></g:message></g:link></li>
                        <li><common:logoutLink></common:logoutLink></li>
                    </ul>
                </div>

                <div class="column2 items">
                    <h4><g:message
                            code="controlPanel.settings.preferences.label"></g:message></h4>
                    <ul class="slave">
                        <li><g:link controller="customer" action="profile" params="${[tab:'address']}"><g:message
                                code="springSecurity.register.sendingAddress.label"></g:message></g:link></li>
                        <li><g:link controller="customer" action="profile" params="${[tab:'reagent']}"><g:message
                                code="customer.reagent.label"></g:message></g:link></li>
                        <li><g:link controller="customer" action="profile" params="${[tab:'favorites']}"><g:message
                                code="customer.favorites.label"></g:message></g:link></li>
                        <li><g:link controller="customer" action="profile" params="${[tab:'newsLetter']}"><g:message
                                code="controlPanel.settings.profile.newsLetters.label"></g:message></g:link></li>
                    </ul>
                </div>
            </div>
        </li>
    </ul>
</div>
</body>
</html>
