<%@ page import="eshop.OrderHelper; eshop.RoleHelper" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="site"/>
    <title><g:message code="controlPanel.title" default="Control Panel"/></title>
</head>

<body>
<g:javascript src="jquery.maskinput.js"/>
<div class="control-panel">
    <h2><g:message code="controlPanel.title" default="Control Panel"/></h2>
    <g:render template="inquired_payments"/>
    <g:if test="${customer?.registrationLevel != 'full'}">
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
                        <g:if test="${grailsApplication.config.eShop.instance=='goldaan'}">
                            <li><g:link controller="order" action="list"><g:message
                                        code="order.status.All"/></g:link></li>
                        </g:if>
                        <g:else>
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
                                        params="${[status: OrderHelper.STATUS_PAYMENT_APPROVED]}"><g:message
                                        code="orders"/> <g:message
                                        code="order.status.${OrderHelper.STATUS_PAYMENT_APPROVED}"/></g:link></li>
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
                        </g:else>
                    </ul>
                </div>

                <div class="column2 items">
                    <g:if test="${grailsApplication.config.eShop.instance=='goldaan'}">
                        <h4><g:message code="order.takhfifyab"></g:message></h4>
                        <div class="orderTracking">
                            <g:form method="post" controller="basket" action="takhfifyab">
                                <div style="float: right">
                                    ${message(code:'dicountSerial')}<br>
                                    <g:textField name="discountSerial" id="discountSerial" placeholder="${message(code:'dicountSerial')}"/>
                                </div>
                                <div style="float: right">
                                    ${message(code:'dicountCode')}<br>
                                    <g:textField name="discountCode" id="discountCode" placeholder="${message(code:'dicountCode')}"/>
                                    <g:submitButton name="submit" class="btn btn-primary"
                                                value="${message(code: 'submit')}"/>
                                </div>

                                <div style="clear: both"></div>
                            </g:form>
                        </div>
                        <br/>
                        <br/>
                    </g:if>

                    <h4><g:message code="order.tracking"></g:message></h4>
                    <div class="orderTracking">
                        <g:form method="post" controller="order" action="track">
                            <g:textField name="trackingCode" id="trackingCodePanel" place-holder="test"/>
                            <g:submitButton name="submit" class="btn btn-primary"
                                            value="${message(code: 'order.tracking.button')}"/>
                        </g:form>
                    </div>
                    <script type="text/javascript" language="javascript">
                        $('#trackingCodePanel').maskInput('9999999999');
                        $('#discountSerial').maskInput('999999999');
                        $('#discountCode').maskInput('********');
                    </script>
                </div>

                <div class="clearfix"></div>
            </div>
        </li>
        <li>
            <div class="group">
                <div class="groupHeader">
                    <img src="../images/points.png">

                    <h3><g:message code="controlPanel.points.label"></g:message></h3>

                    <div class="comment"><g:message
                            code="controlPanel.points.description"></g:message></div>
                </div>

                <div class="column1 items">
                    <h4><g:message code="controlPanel.points.gathering.label"></g:message></h4>
                    <ul class="master">
                        <li><g:link controller="customer" action="invite"><g:message
                                code="controlPanel.points.invite.label"></g:message></g:link></li>

                    </ul>
                </div>

                <div class="column2 items">
                    <h4><g:message
                            code="controlPanel.points.reports.label"></g:message></h4>
                    <ul class="slave">
                        <g:if test="${grailsApplication.config.customCheckout}">
                            <li>
                                <h3>
                                    <g:message code="golbon-value" args="${[eshop.accountValue()]}"/>
                                </h3>
                            </li>
                        </g:if>
                    </ul>
                </div>

                <div class="clearfix"></div>
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
                        <li><g:link controller="customer" action="profile" params="${[tab: 'reagent']}"><g:message
                                code="customer.reagent.label"></g:message></g:link></li>
                        <li><g:link controller="customer" action="profile" params="${[tab: 'favorites']}"><g:message
                                code="customer.favorites.label"></g:message></g:link></li>
                        <li><g:link controller="customer" action="profile" params="${[tab: 'newsLetters']}"><g:message
                                code="controlPanel.settings.profile.newsLetters.label"></g:message></g:link></li>
                        <li><g:link controller="customer" action="profile"
                                    params="${[tab: 'personalEvents']}"><g:message
                                    code="controlPanel.settings.personalEvents.label"></g:message></g:link></li>
                    </ul>
                </div>

                <div class="clearfix"></div>
            </div>
        </li>
    </ul>
</div>
</body>
</html>
