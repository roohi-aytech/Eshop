<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 4/11/13
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="grails.util.Environment" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mobile"/>
    <title>
        <g:if test="${bankName == 'mellat'}">
            <g:message code="order.payment.mellat.title"/>
        </g:if>
    </title>
    <g:if test="${bankName == 'mellat'}">
        <g:if test="${!flash.message}">
            <script language="javascript" type="text/javascript">
                function postRefId(refIdValue) {
                    var form = document.createElement("form");
                    form.setAttribute("method", "POST");
                    form.setAttribute("action", "https://bpm.shaparak.ir/pgwchannel/startpay.mellat");
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
                    form.setAttribute("action", "https://sep.shaparak.ir/Payment.aspx");
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
                    <g:if test="${grails.util.Environment.current == Environment.DEVELOPMENT}">
                    hiddenField.setAttribute("value", "http://localhost:8080/eshop/order/onlinePaymentResultSaman");
                    </g:if>
                    <g:else>
                    hiddenField.setAttribute("value", "${createLink(uri: '/order/onlinePaymentResultSaman', absolute: true)}");
                    </g:else>
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
<g:if test="${bankName == 'mellat'}">
    <h2 style="margin-bottom: 10px;"><g:message code="order.payment.mellat.title"/></h2>

    <div class="page-content">
        <g:if test="${!flash.message}">
            <g:message code="order.payment.mellat.waitingMessage"/>
        </g:if>
        <g:else>
            <div class="error">
                <div><g:message code="order.payment.error"/>: <b>${flash.message}</b></div>
            </div>
        </g:else></div>
</g:if>
<g:if test="${bankName == 'saman'}">
    <h2 style="margin-bottom: 10px;"><g:message code="order.payment.saman.title"/></h2>

    <div class="page-content">
        <g:if test="${!flash.message}">
            <g:message code="order.payment.saman.waitingMessage"/>
        </g:if>
        <g:else>
            <div class="error">
                <div><g:message code="order.payment.error"/>: <b>${flash.message}</b></div>
            </div>
        </g:else>
    </div>
</g:if>
<g:if test="${bankName == 'pasargad'}">
    <h3><g:message code="underConstruction"/></h3>
</g:if>
</body>
</html>