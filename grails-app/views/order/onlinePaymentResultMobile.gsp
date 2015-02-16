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
    <meta name="layout" content="mobile"/>
    <title><g:message code="onlinePayment.result"/></title>
</head>

<body>
<div class="page-content">
    <h2><g:message code="onlinePayment.result"/></h2>

    <g:if test="${verificationResult?.toString() == "0"}">
        <div class="info">
            <div><g:message code="onlinePayment.result.success"/></div>
        </div>

        <div style="padding: 10px;line-height: 20px;">
            <div>
                <g:message code="onlinePayment.amount"/>:
                <b>${onlinePayment?.amount} <g:message code="rial" /></b>
            </div>

            <div>
                <g:message code="onlinePayment.transactionReferenceCode"/>:
                <b>${onlinePayment?.transactionReferenceCode}</b>
            </div>

            <g:if test="${onlinePayment?.order}">
                <div>
                    <g:message code="onlinePayment.order"/>:
                    <b>${onlinePayment?.order?.trackingCode}</b>
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
                <g:if test="${grailsApplication.config.payOnCheckout}">
                    <div class='info'>
                        <div>
                            <g:message code="order.creation.success.message"/>
                            <h2 style="font-size: 16px !important;margin-bottom:0;">
                                <g:message code="order.trackingCode.label"/>: <b>${onlinePayment?.order?.trackingCode}</b>
                            </h2>
                        </div>

                    </div>
                </g:if>
            </g:if>
        </div>
    </g:if>
    <g:else>
        <div class="error">
            <div>
                <g:message code="onlinePayment.result.error"></g:message>
                <g:if test="${onlinePayment?.resultCode}">
                    <br/>code: <b>${onlinePayment?.resultCode}</b>
                </g:if>
                <div style="display: none">${verificationResult}</div>

            </div>
        </div>
    </g:else>
    <g:if test="${appURL}">
        <div id="return-app-btn" class="grn-btn icon-lock left" onclick="returnToMobileApp()"><h3><g:message
            code="return"/></h3></div>
        <script language="JavaScript">
            function returnToMobileApp(){
                window.history.go(-2);
//                window.location='index.html'
            }
        </script>
    </g:if>
</div>
</body>
</html>