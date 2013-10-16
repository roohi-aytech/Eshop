
<%@ page import="eshop.accounting.PaymentRequest; eshop.Order; eshop.OrderHelper" %>
<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 4/7/13
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>

<div class="invoice a4">
    <div class="invoice-inner">
        <div id="invoice-date">
            <span class="label"><g:message code="invoice.date"/>:</span> <rg:formatJalaliDate
                date="${eshop.OrderTrackingLog.findByOrderAndAction(order, OrderHelper.ACTION_INQUIRY).date}"/>
        </div>

        <div id="invoice-serial">
            <span class="label"><g:message code="invoice.serialNumber"/>:</span> ${order.serialNumber}
        </div>

        <h2>
            ${order.status == eshop.OrderHelper.STATUS_PAYMENT_APPROVED || order.status == eshop.OrderHelper.STATUS_TRANSMITTED || order.status == eshop.OrderHelper.STATUS_DELIVERED ? message(code: 'order.finalInvoice.title') : message(code: 'order.preInvoice.title')}
        </h2>

        <div id="invoice-trackingCode">
            <span class="label"><g:message code="invoice.trackingCode"/>:</span> ${order.trackingCode}
        </div>

        <div id="sellerInfo">
            <table class="table-simulated">
                <tr>
                    <td>
                        <span class="label"><g:message code="invoice.seller.label"/>:</span>
                        <g:message code="invoice.seller.value"/>
                    </td>
                    <td>
                        <span class="label"><g:message code="invoice.seller.code.label"/>:</span>
                        <span id="invoice-sellerCode"><g:message code="invoice.seller.code.value"/></span>
                    </td>
                </tr>
            </table>
        </div>

        <div id="customerInfo">
            <table>
                <tr>
                    <td colspan="2">
                        <span class="label"><g:message code="invoice.owner.name"></g:message>:</span>
                        <span class="value">${order.useAlternateInformation ? order.alternateOwnerName : (order.customer ? '' : message(code: "customer.title." + order.ownerSex) + " ") + order.ownerName}</span>
                    </td>
                    <td>
                        <span class="label"><g:message code="invoice.ownerCode"></g:message>:</span>
                        <span class="value">${order.ownerCode}</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <span class="label"><g:message code="invoice.sendingAddress"></g:message>:</span>
                        <span rowspan="2" class="value"><g:render template="/site/formatters/address"
                                                                  model="${[address: order.sendingAddress, noAdditionalData: true]}"></g:render></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="label"><g:message code="invoice.postalCode"></g:message>:</span>
                        <span class="value">${order.sendingAddress.postalCode}</span>
                    </td>
                    <td>
                        <span class="label"><g:message code="invoice.owner.telephone"></g:message>:</span>
                        <span class="value">${order.ownerTelephone}</span>
                    </td>
                    <td>
                        <span class="label"><g:message code="invoice.owner.mobile"></g:message>:</span>
                        <span class="value">${order.ownerMobile}</span>
                    </td>
                </tr>
            </table>
        </div>
        <table class="basket-detail" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <th><g:message code="invoice.rowNumber"></g:message></th>
                <th><g:message code="invoice.productCode"></g:message></th>
                <th><g:message code="invoice.item.name"></g:message></th>
                <th><g:message code="invoice.item.price"></g:message></th>
                <th><g:message code="invoice.item.discount"></g:message></th>
                <th><g:message code="invoice.item.count"></g:message></th>
                <th><g:message code="invoice.item.tax"></g:message></th>
                <th><g:message code="invoice.item.totalPrice"></g:message></th>
            </tr>
            <g:each in="${order.items.findAll { !it.deleted }.sort { it.id }}" var="orderItem" status="i">
                <tr>
                    <td class="center">${i + 1}</td>
                    <td><g:formatNumber number="${orderItem.productModel.product.id}"
                                        type="number"></g:formatNumber></td>
                    <td>
                        ${orderItem.productModel}
                        %{--${orderItem.productModel.guarantee ? message(code:'invoice.withGuarantee') + " " + orderItem.productModel.guarantee : ''}--}%
                        <g:each in="${orderItem.addedValues}">
                            + ${it}
                        </g:each>
                    </td>
                    <td><g:formatNumber number="${orderItem.unitPrice}"
                                        type="number"></g:formatNumber></td>
                    <td><g:formatNumber number="${orderItem.discount}"
                                        type="number"></g:formatNumber></td>
                    <td class="center">${orderItem.orderCount}</td>
                    <td><g:formatNumber number="${orderItem.tax}"
                                        type="number"></g:formatNumber></td>
                    <td><g:formatNumber number="${orderItem.totalPrice}"
                                        type="number"></g:formatNumber></td>
                </tr>
            </g:each>
            <tr>
                <td colspan="5" class="invoice-highlight">
                    <g:message code="invoice.item.totalSum"/>
                </td>
                <td class="invoice-highlight">
                    ${order.items.sum { it.orderCount }}
                </td>
                <td class="invoice-highlight">
                    <g:formatNumber number="${order.items.sum { it.tax }}" type="number"/>
                </td>
                <td class="invoice-highlight">
                    <g:formatNumber number="${order.items.sum { it.totalPrice }}" type="number"/>
                </td>
            </tr>
            <tr>
                <td rowspan="4" colspan="5">
                    <g:if test="${order.status != eshop.OrderHelper.STATUS_PAYMENT_APPROVED && order.status != eshop.OrderHelper.STATUS_TRANSMITTED && order.status != eshop.OrderHelper.STATUS_DELIVERED}">
                        <p><span class="label"><g:message code="invoice.validityDate"/>:</span> <rg:formatJalaliDate
                                date="${order.paymentTimeout}" hm="true"/></p>
                    </g:if>
                    <g:if test="${order.status == eshop.OrderHelper.STATUS_PAYMENT_APPROVED || order.status == eshop.OrderHelper.STATUS_TRANSMITTED || order.status == eshop.OrderHelper.STATUS_DELIVERED}">
                        <g:set var="paymentRequest" value="${PaymentRequest.findAllByOrder(order)?.sort {-it.id}?.toArray()?.find() as PaymentRequest}"/>
                        <p><span class="label"><g:message code="invoice.paymentType"/>:</span> <g:message code="order.paymentType.${order.paymentType}" args="${[rg.formatJalaliDate(date:paymentRequest?.creationDate?:new Date()), paymentRequest?.account?.accountNumber, message(code:"order.payment.bank.${paymentRequest?.account?.bankName}.label"), paymentRequest?.trackingCode]}"/></p>
                    </g:if>
                    <p><span class="label"><g:message code="invoice.deliveryType"/>:</span> <g:message
                            code="invoice.deliveryType.label"/> ${order.deliverySourceStation.method}</p>
                </td>
                <td colspan="2" align="left"><g:message code="deliveryPrice"></g:message></td>
                <td><g:formatNumber number="${order.deliveryPrice}" type="number"></g:formatNumber></td>
            </tr>
            <tr>
                <td class="invoice-highlight" colspan="2" align="left"><b><g:message
                        code="basket.totalRoundedPrice"></g:message></b></td>
                <td class="invoice-highlight"><b><g:formatNumber
                        number="${order.totalPrice}"
                        type="number"></g:formatNumber></b></td>
            </tr>
            <tr>
                <td colspan="2">
                    <g:message code="invoice.customerAccount"></g:message>
                </td>
                <td>
                    <g:formatNumber number="${order.usedAccountValue}" type="number"/>
                </td>
            </tr>
            <tr>
                <td class="invoice-highlight" colspan="2">
                    <b><g:message code="invoice.remainingPayablePrice"></g:message></b>
                </td>
                <td class="invoice-highlight">
                    <b>
                        <g:formatNumber number="${order.totalPayablePrice}" type="number"/>
                    </b>
                </td>
            </tr>
        </table>

        <div>
            <h3><g:message code="invoice.description"/></h3>
            <ol>
                <li><g:message code="invoice.description.1"/></li>
                <li><g:message code="invoice.description.2"/></li>
            </ol>

            <div><g:message code="invoice.aggreegation" args="${[order.ownerName]}"/></div>

            <div id="invoice-sign"><g:message code="invoice.aggreegation.sign"/></div>
        </div>
    </div>
</div>