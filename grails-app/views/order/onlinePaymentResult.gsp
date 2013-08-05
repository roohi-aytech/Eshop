<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 8/2/13
  Time: 6:27 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site"/>
    <title><g:message code="onlinePayment.result"/></title>
</head>

<body>
<div class="page-content">
    <h2><g:message code="onlinePayment.result"/></h2>

    %{--<g:if test="${verificationResult == "0"}">--}%
        <div class="info">
            <div><g:message code="onlinePayment.result.success"></g:message></div>
        </div>

        <div style="padding: 10px;line-height: 20px;">
            <div>
                <g:message code="onlinePayment.amount"/>:
                <b>${onlinePayment?.amount}</b>
            </div>

            <div>
                <g:message code="onlinePayment.transactionReferenceCode"/>:
                <b>${onlinePayment?.transactionReferenceCode}</b>
            </div>

            <g:if test="${onlinePayment?.order}">
                <div>
                    <g:message code="onlinePayment.order"/>:
                    <b>${onlinePayment?.order?.id}</b>
                </div>

                <div>
                    <g:message code="onlinePayment.order.paymentResult"/>:
                    <b>
                        <g:if test="${orderPaid}">
                            <g:message code="onlinePayment.order.paymentResult.success"/>
                        </g:if>
                        <g:else>
                            <g:message code="onlinePayment.order.paymentResult.fail"/>
                        </g:else>
                    </b>
                </div>
            </g:if>
        </div>
    %{--</g:if>--}%
    %{--<g:else>--}%
        <div class="error">
            <div>
                <g:message code="onlinePayment.result.error"></g:message>
                %{--<g:if test="${onlinePayment?.resultCode}">--}%
                    <br/>code: <b>${onlinePayment?.resultCode}</b>
                <div>${verificationResult}</div>
                %{--</g:if>--}%
            </div>
        </div>
    %{--</g:else>--}%

</div>
</body>
</html>