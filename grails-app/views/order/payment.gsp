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
    label{
        margin-bottom:5px;
    }
    </style>
</head>

<body>
<div class="control-panel">
    <h2><g:message code="controlPanel.orders.actions.payment.label"></g:message></h2>

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

            <div class="info">
                <div>
                    <g:message code="underConstruction"></g:message>
                </div>
            </div>
            %{--<g:message--}%
                    %{--code="order.payment.bankSelect.description"></g:message><br/><br/>--}%
            %{--<g:form action="onlinePayment">--}%
                %{--<select name="account">--}%
                    %{--<g:each in="${accountsForOnlinePayment}" var="account">--}%
                        %{--<option value="${account.id}"--}%
                                %{--data-image="${createLink(controller: 'image', params: [type: 'account', id: account.id])}">${account.bankName}</option>--}%
                    %{--</g:each>--}%
                %{--</select>--}%
                %{--<input type="submit" class="btn btn-primary" style="height:44px"--}%
                       %{--value="<g:message code="controlPanel.orders.actions.payment.label"></g:message>"/>--}%
            %{--</g:form>--}%
        </div>

        <div id="tabBankReceipt" class="tab-pane">

            <g:form action="savePaymentRequest">

                <label><g:message
                        code="order.payment.bank"></g:message></label>
                <select name="account" style="margin-bottom:10px;">
                    <g:each in="${accounts}" var="account">
                        <option value="${account.id}"
                                data-image="${createLink(controller: 'image', params: [type: 'account', id: account.id])}">${account.bankName}</option>
                    </g:each>
                </select>
                <label><g:message code="order.payment.value"></g:message></label>
                <input type="text" name="value" id="value"/>
                <label><g:message code="order.payment.trackingCode"></g:message></label>
                <input type="text" name="trakingCode" id="trakingCode"/>
                <div class="toolbar" style="margin-top:10px;">
                <input type="submit" class="btn btn-primary"
                       value="<g:message code="controlPanel.orders.actions.payment.label"></g:message>"/>
                </div>
            </g:form>
        </div>

        <div id="tabAccount" class="tab-pane">
            value : ${customerAccoutnValue}
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
                alert(e.message);
            }
        });
    </g:javascript>
</div>
</body>
</html>