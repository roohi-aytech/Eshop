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
    <meta name="layout" content="site"/>
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
    <g:elseif test="${bankName == 'saman' || bankName == 'meb'}">
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
    <g:elseif test="${bankName == 'ogone'}">
        <g:if test="${!flash.message}">
            <script language="javascript" type="text/javascript">
                function addField(form,name,value){
                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("name", name);
                    hiddenField.setAttribute("value", value);
                    form.appendChild(hiddenField);
                }
                function postRefId() {
                    var form = document.createElement("form");
                    form.setAttribute("method", "POST");
                    form.setAttribute("name", "form1");
                    form.setAttribute("id", "form1");
                    form.setAttribute("action", "https://secure.ogone.com/ncol/test/orderstandard.asp");
                    form.setAttribute("target", "_self");
                    <g:set var="baseUrl" value="${createLink(uri: '/order/onlinePaymentResultOgone', absolute: true)}"/>
                    <g:if test="${grails.util.Environment.current == Environment.DEVELOPMENT}">
                        <g:set var="baseUrl" value="http://localhost:8080/order/onlinePaymentResultOgone"/>
                    </g:if>
                    <g:set var="parameters" value="${[
                        PSPID:merchantId,
                        ORDERID:reservationNumber,
                        AMOUNT:formatNumber(number:amount*100),
                        CURRENCY:currency,
                        LANGUAGE:'en_US',
                        ACCEPTURL:"${baseUrl}/accept",
                        DECLINEURL:"${baseUrl}/decline",
                        EXCEPTIONURL:"${baseUrl}/exception",
                        CANCELURL:"${baseUrl}/cancel",
                        BACKURL:"${baseUrl}/back",
                        CN:customerName,
                        EMAIL:customerEmail,
                        TITLE:"Goldaan Shopping Store"
//                        LOGO:'http://www.goldaan.ir/images/goldaan/logo.png'

                    ]}"/>
                    <%
                    parameters.SHASIGN=parameters.keySet().sort().collect {"${it}=${parameters[it]}${shaPassword}"}.join('').encodeAsSHA1()
                    %>

                    <g:each in="${parameters}">
                        addField(form,'${it.key}','${it.value}');
                    </g:each>

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
    <g:if test="${bankName == 'ogone'}">
        <h2><g:message code="order.payment.bank.ogone.label"/></h2>

        <g:if test="${!flash.message}">
            <div class="info">
                <div><g:message code="order.payment.ogone.waitingMessage"/></div>
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