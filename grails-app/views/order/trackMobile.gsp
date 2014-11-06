<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 8/10/13
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="eshop.OrderHelper; eshop.OrderTrackingLog; eshop.OrderItem" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mobile"/>
    <title><g:message code="order.tracking.title"/></title>
    <script language="javascript" type="text/javascript" src="${resource(dir:'js', file: 'jquery.maskinput.js')}"></script>
</head>

<body>
<g:if test="${search}">
    <g:if test="${order}">
        <div class="page-content" style="font-size: 13px;line-height: 18px;">
            <g:message code="order.status.your"/>: <b class="red"><g:message
                code="order.status.${order.status}"/></b><br/>
            <g:message code="order.trackingCode"/>: <b>${order.trackingCode}</b>
        </div>

        <g:if test="${order.customer?.id == customer?.id}">
            <div style="font-size:13px;line-height:18px;">
                <div>
                    <g:message code="invoice.item.totalSum"/>: <g:formatNumber number="${order.items.sum { it.totalPrice }}"
                                                                               type="number"/> <eshop:currencyLabel/>
                </div>
                <div>
                    <g:message code="deliveryPrice"/>:
                    <g:if test="${order.deliveryPrice == 0}">
                        <g:message code="free"/>
                    </g:if>
                    <g:else>
                        <g:formatNumber number="${order.deliveryPrice}"
                                        type="number"/> <eshop:currencyLabel/>
                    </g:else>
                </div>

                <div>
                    <g:message code="order.totalPrice"/>: <b><g:formatNumber
                        number="${order.totalPrice}"
                        type="number"/> <eshop:currencyLabel/></b>
                </div>
            </div>

            <div>
                <g:if test="${!grailsApplication.config.disableTrackingActions}">


                    <div class="export-toolbar" style="border-top:1px dashed #dddddd;margin-top:10px;padding-top:10px;">
                        <a class="btn btn-success" target="_blank" href="${createLink(action: 'pdf', params: [id: order.id])}">
                            <img src="${resource(dir: 'images', file: 'pdf.png')}"/>
                            <g:message code="invoice.export.pdf"/>
                        </a>
                    </div>

                    <g:each in="${suggestedActions}" var="action">
                        <g:link controller="order" action="${action}" params="${['id': order.id]}"
                                class="grn-btn full" style="padding:12px;margin-top:10px;margin-bottom:15px;"><g:message
                                code="controlPanel.orders.actions.${action}.label"/></g:link>
                    </g:each>
                    <g:each in="${actions}" var="action">
                        <g:link controller="order" action="${action}"
                                params="${['id': order.id]}"><g:message
                                code="controlPanel.orders.actions.${action}.label"/></g:link>
                    </g:each>

                </g:if>
                <g:if test="${grailsApplication.config.payOnCheckout}">
                    <g:if test="${!payment?.transactionReferenceCode || payment?.amount < order?.totalPayablePrice}">
                        <g:link class="btn btn-success" controller="order" action="remainingPayment"
                                id="${order?.id}">
                            <g:message code="controlPanel.orders.actions.payment.label"/>
                        </g:link>
                    </g:if>
                </g:if>
                <g:if test="${grailsApplication.config.getInvoiceOnTracking}">
                    <g:if test="${[OrderHelper.STATUS_PAYMENT_APPROVED, OrderHelper.STATUS_TRANSMITTED, OrderHelper.STATUS_DELIVERED].contains(order?.status)}">

                        <div class="export-toolbar" style="border-top:1px dashed #dddddd;margin-top:10px;padding-top:10px;">
                            <a class="btn btn-success" target="_blank" href="${createLink(action: 'pdf', params: [id: order.id])}">
                                <img src="${resource(dir: 'images', file: 'pdf.png')}"/>
                                <g:message code="invoice.export.pdf"/>
                            </a>
                        </div>
                    </g:if>
                </g:if>
            </div>

            <h3 style="margin-bottom: 10px;"><g:message code="order.history"/></h3>
            <ul class="history page-content" style="line-height: 18px;font-size:13px;">
                <g:each in="${OrderTrackingLog.findAllByOrder(order).reverse()}" var="trackingLog">
                    <li style="margin-bottom: 10px;">
                        <div class="title"><g:message code="${trackingLog.title}"/></div>

                        <div>
                            <span class="date"><rg:formatJalaliDate date="${trackingLog.date}"
                                                                    hm="true"/></span>
                        </div>
                    </li>
                </g:each>
            </ul>
        </g:if>
    </g:if>
    <g:else>
        <div class="page-content">
            <div class="error">
                <div><g:message code="order.tracking.notFound"/></div>
            </div>
        </div>
    </g:else>
</g:if>
%{--<g:else>--}%
<h2><g:message code="order.tracking.mobileTitle"/></h2>

<div class="orderTracking" id="no-sign-in">
    <g:form method="post" controller="order" action="track">
        <label for="trackingCodePanel"><g:message code="invoice.trackingCode"/></label>
        <g:textField name="trackingCode" id="trackingCodePanel" place-holder="test"/>
        <g:submitButton name="submit" class="grn-btn"
                        value="${message(code: 'order.tracking.button')}"/>
    </g:form>
</div>
<script type="text/javascript" language="javascript">
    $('#trackingCodePanel').maskInput('9999999999');
</script>
</body>
</html>