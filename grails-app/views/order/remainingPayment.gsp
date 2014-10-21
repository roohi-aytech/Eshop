<%@ page import="eshop.City" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 9/1/13
  Time: 12:24 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site"/>
    <title><g:message code="controlPanel.orders.actions.payment.label"/></title>
    <link href="${resource(dir: 'css', file: 'jquery.msdropdown.css')}" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.msdropdown.js')}" type="text/javascript"></script>
    <style type="text/css">
    label {
        margin-bottom: 5px;
    }
    </style>
    <link href="${resource(plugin: 'jquery-ui', dir: 'jquery-ui/themes/' + grailsApplication.config.admin.theme , file: 'jquery-ui-1.8.15.custom.css')}"
          type="text/css" rel="stylesheet" media="screen, projection" id="jquery-ui-theme"/>
    <script src="${resource(plugin: 'jquery-ui', dir: 'jquery-ui/js', file: 'jquery-ui-1.8.15.custom.min.js')}"
            type="text/javascript"></script>
    <link href="${resource(plugin: 'rapid-grails', dir: 'css/datepicker', file: 'ui.datepicker.css')}"/>
    <script src="${resource(plugin: 'rapid-grails', dir: 'js/datepicker', file: 'jquery.ui.datepicker-cc.js')}"
            type="text/javascript"></script>
    <script src="${resource(plugin: 'rapid-grails', dir: 'js/datepicker', file: 'calendar.js')}"
            type="text/javascript"></script>
    <script src="${resource(plugin: 'rapid-grails', dir: 'js/datepicker', file: 'jquery.ui.datepicker-cc-fa.js')}"
            type="text/javascript"></script>
</head>

<body>
<div class="page-content">
    <g:if test="${flash.message}">
        <div class="info">
            <div>
                ${flash.message}
            </div>
        </div>
    </g:if>
    <h2><g:message code="controlPanel.orders.actions.payment.label"></g:message> ${order.trackingCode}</h2>
    <g:if test="${customer}">
        <div class="info">
            <div>
                <g:message code="order.usedAccountValue"/> : <b><g:formatNumber number="${order.usedAccountValue}"
                                                                                type="number"/></b> <eshop:currencyLabel/><br/>
                <a class="btn btn-primary" href="${createLink(action: 'payment', params: [id: params.id])}"><g:message code="order.usedAccountValue.changes"/></a>
            </div>
        </div>
    </g:if>
    <g:message code="order.payment.description"/>

    <ul class="nav nav-tabs" style="margin-top:10px;">
        <li class="active">
            <a href="#tabOnline" data-toggle="tab">
                <g:message code="payment.types.online"></g:message>
            </a>
        </li>
        <g:if test="${!grailsApplication.config.disablebankReceipt}">
            <li>
                <a href="#tabBankReceipt" data-toggle="tab">
                    <g:message code="payment.types.bankReceipt"></g:message>
                </a>
            </li>
        </g:if>
        <g:if test="${order.sendingAddress.city == City.findByTitle(message(code: 'city.homeTown'))}">
            <li>
                <a href="#tabPayInPlace" data-toggle="tab">
                    <g:message code="payment.types.payInPlace"></g:message>
                </a>
            </li>
        </g:if>
    </ul>

    <div class="tab-content">
        <div id="tabOnline" class="tab-pane active">
            <g:render template="payment/online"></g:render>
        </div>
        <g:if test="${!grailsApplication.config.disablebankReceipt}">
            <div id="tabBankReceipt" class="tab-pane">
                <g:render template="payment/bankReceipt"></g:render>
            </div>
        </g:if>
        <g:if test="${order.sendingAddress.city == City.findByTitle(message(code: 'city.homeTown'))}">
            <div id="tabPayInPlace" class="tab-pane">
                <g:render template="payment/inPlace"></g:render>
            </div>
        </g:if>
    </div>
</div>
<script language="javascript" type="text/javascript">

    $(document).ready(function (e) {
        try {
            $("body select").msDropDown();
        } catch (e) {
        }
    });
</script>
</body>
</html>