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
    <title>
        <g:if test="${bankName == 'mellat'}">
            <g:message code="order.payment.mellat.title"></g:message>
        </g:if>
    </title>
    <g:if test="${bankName == 'mellat'}">
        <g:if test="${!flash.message}">
            <script language="javascript" type="text/javascript">
                function postRefId(refIdValue) {
                    var form = document.createElement("form");
                    form.setAttribute("method", "POST");
                    form.setAttribute("action", "https://pgw.bpm.bankmellat.ir/pgwchannel/startpay.mellat");
                    form.setAttribute("target", "_self");
                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("name", "RefId");
                    hiddenField.setAttribute("value", refIdValue);
                    form.appendChild(hiddenField);
                    document.body.appendChild(form);
                    form.submit();
                    document.body.removeChild(form);
                }

                $(document).ready(function () {
                    postRefId('${refId}');
                });
            </script>
        </g:if>
    </g:if>
    <g:elseif test="${bankName == 'saman'}">
        <g:if test="${!flash.message}">
            <script language="javascript" type="text/javascript">
                function postRefId() {
                    var form = document.createElement("form");
                    form.setAttribute("method", "POST");
                    form.setAttribute("action", "https://acquirer.samanepay.com/Payment.aspx");
                    form.setAttribute("target", "_self");

                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("name", "Amount");
                    hiddenField.setAttribute("value", ${amount});
                    form.appendChild(hiddenField);

                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("name", "MID");
                    hiddenField.setAttribute("value", ${merchantId});
                    form.appendChild(hiddenField);

                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("name", "ResNum");
                    hiddenField.setAttribute("value", ${reservationNumber});
                    form.appendChild(hiddenField);

                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("name", "RedirectURL");
                    hiddenField.setAttribute("value", "http://www.zanbil.ir/order/onlinePaymentResultSaman");
                    form.appendChild(hiddenField);

                    document.body.appendChild(form);
                    form.submit();
                    document.body.removeChild(form);
                }

                $(document).ready(function () {
                    postRefId();
                });
            </script>
        </g:if>
    </g:elseif>
</head>

<body>
<div class="control-panel">
    <g:if test="${bankName == 'mellat'}">
        <h2><g:message code="order.payment.mellat.title"/></h2>

        <g:if test="${!flash.message}">
            <div class="info">
                <div><g:message code="order.payment.mellat.waitingMessage"/></div>
            </div>
        </g:if>
        <g:else>
            <div class="error">
                <div><g:message code="order.payment.error"/>: <b>${flash.message}</b></div>
            </div>
        </g:else>
    </g:if>
    <g:if test="${bankName == 'saman'}">
        <h2><g:message code="order.payment.saman.title"/></h2>

        <g:if test="${!flash.message}">
            <div class="info">
                <div><g:message code="order.payment.saman.waitingMessage"/></div>
            </div>
        </g:if>
        <g:else>
            <div class="error">
                <div><g:message code="order.payment.error"/>: <b>${flash.message}</b></div>
            </div>
        </g:else>
    </g:if>
    <g:if test="${bankName == 'pasargad'}">
        <h3><g:message code="underConstruction"/></h3>
    </g:if>
</div>
</body>
</html>