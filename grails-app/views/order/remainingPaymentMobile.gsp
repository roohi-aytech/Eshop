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
    <meta name="layout" content="mobile"/>
    <title><g:message code="controlPanel.orders.actions.payment.label"/></title>
    <link href="${resource(dir: 'css', file: 'jquery.msdropdown.css')}" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.msdropdown.js')}"
            type="text/javascript"></script>
    <style type="text/css">
    label {
        margin-bottom: 5px;
    }
    .validationError{
        display: block;
        margin-top:10px;
    }
    </style>
    <link href="${resource(plugin: 'jquery-ui', dir: 'jquery-ui/themes/' + grailsApplication.config.admin.theme, file: 'jquery-ui-1.8.15.custom.css')}"
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

    <script language="javascript" type="text/javascript" src="${resource(dir: 'js/mobile', file: 'clip.js')}"></script>
</head>

<body>
<g:if test="${flash.message}">
    <div class="info">
        <div>
            ${flash.message}
        </div>
    </div>
</g:if>
<h2 style="margin-bottom: 10px"><g:message
        code="controlPanel.orders.actions.payment.mobileLabel"/> ${order.trackingCode}</h2>

<g:message code="order.payment.description"/>

<div id="price" class="search-by-price" style="margin-top:10px;">
    <h2 class="dummy_toggler"><g:message code="payment.types.online"/></h2>
    <g:render template="payment/mobile/online"/>
</div>

<div class="tabs">
    <g:if test="${!grailsApplication.config.disablebankReceipt}">
        <div id="brandsname" class="by-brand">
            <h2 id="toggle-bankReceipt" class="toggle-head dummy_toggler"><g:message
                    code="payment.types.bankReceipt"/><span class="grey"></span><span
                    class="up-arrow right">
                dummy</span></h2>

            <div id="toggled-bankReceipt" class="toggle-brand" style="padding:15px;">
                <g:render template="payment/mobile/bankReceipt"/>
            </div>
        </div>
    </g:if>

    <g:if test="${order.sendingAddress.city == City.findByTitle(message(code: 'city.homeTown'))}">
        <div id="brandsname" class="by-brand">
            <h2 id="toggle-tabPayInPlace" class="toggle-head dummy_toggler"><g:message
                    code="payment.types.payInPlace"/><span class="grey"></span><span
                    class="up-arrow right">dummy</span></h2>

            <div id="toggled-tabPayInPlace" class="toggle-brand" style="padding:15px;">
                <g:render template="payment/mobile/inPlace"/>
            </div>
        </div>
    </g:if>
</div>

<g:if test="${customer}">
    <div class="page-content">
        <g:message code="order.usedAccountValue"/> : <b><g:formatNumber number="${order.usedAccountValue}"
                                                                        type="number"/></b> <eshop:currencyLabel/><br/>
        <a class="full cntr reg_cta" style="margin-top:10px;"
           href="${createLink(action: 'payment', params: [id: params.id])}"><g:message
                code="order.usedAccountValue.changes"/></a>

    </div>
</g:if>
</body>
</html>