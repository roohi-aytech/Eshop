<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 4/11/13
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site"/>
    <title></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.msdropdown.css')}"/>
    <g:javascript src="jquery.msdropdown.js"></g:javascript>
    <style>
    label {
        margin-bottom: 5px;
    }
    </style>
</head>

<body>
<div class="control-panel">
    <h2><g:message code="controlPanel.orders.actions.payment.label"></g:message></h2>
    <g:if test="${flash.message}">
        <div class="info">
            <div>
                ${flash.message}
            </div>
        </div>
    </g:if>

    <ul class="nav nav-tabs">
        <li class="active">
            <a href="#tabOnline" data-toggle="tab">
                <g:message code="payment.types.online"></g:message>
            </a>
        </li>
        <li>
            <a href="#tabBankReceipt" data-toggle="tab">
                <g:message code="payment.types.bankReceipt"></g:message>
            </a>
        </li>
        <li>
            <a href="#tabAccount" data-toggle="tab">
                <g:message code="payment.types.account"></g:message>
            </a>
        </li>
    </ul>

    <div class="tab-content">
        <div id="tabOnline" class="tab-pane active">
            <g:render template="payment/online"></g:render>
        </div>

        <div id="tabBankReceipt" class="tab-pane">
            <g:render template="payment/bankReceipt"></g:render>
        </div>

        <div id="tabAccount" class="tab-pane">
            <g:render template="payment/account"></g:render>
        </div>
    </div>
    <g:javascript>

    %{--function selectBank(value){--}%
    %{--window.location.href = "${createLink(controller: 'order', action: 'payment', params: [id: params.id])}" + "?bank=" + value;--}%
    %{--}--}%

        $(document).ready(function (e) {
            try {
                $("body select").msDropDown();
            } catch (e) {
            }
        });
    </g:javascript>
</div>
</body>
</html>