<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 4/7/13
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site">
    <title></title>
</head>

<body>
<div class="invoice">
    <h2><g:message code="invoice"></g:message></h2>
    <table class="customer-info">
        <tr>
            <td class="label"><g:message code="invoice.owner.name"></g:message>:</td>
            <td class="value">${order.ownerName}</td>
            <td class="label"><g:message code="invoice.billingAddress"></g:message>:</td>
            <td rowspan="2" class="value"><g:render template="/site/formatters/address"
                                                    model="${[address: billingAddress]}"></g:render></td>
        </tr>
        <tr>
            <td class="label"><g:message code="invoice.owner.email"></g:message>:</td>
            <td class="value">${order.ownerEmail}</td>
            <td></td>
        </tr>
        <tr>
            <td class="label"><g:message code="invoice.owner.mobile"></g:message>:</td>
            <td class="value">${order.ownerMobile}</td>
            <td class="label"><g:message code="invoice.sendingAddress"></g:message>:</td>
            <td rowspan="2" class="value"><g:render template="/site/formatters/address"
                                                    model="${[address: sendingAddress]}"></g:render></td>
        </tr>
        <tr>
            <td class="label"><g:message code="invoice.owner.telephone"></g:message>:</td>
            <td class="value">${order.ownerTelephone}</td>
            <td></td>
        </tr>
        <tr>
            <td class="label"><g:message code="invoice.date"></g:message>:</td>
            <td class="value"><rg:formatJalaliDate date="${new Date()}" hm="true"></rg:formatJalaliDate></td>
            <td class="label"><g:message code="invoice.code"></g:message>:</td>
            <td class="value"><g:message code="invoice.notCoded"></g:message></td>
        </tr>
    </table>
    <table class="basket-detail" border="1">
        <tr>
            <th>#</th>
            <th><g:message code="invoice.item.name"></g:message></th>
            <th><g:message code="invoice.item.price"></g:message></th>
            <th><g:message code="invoice.item.addedValue"></g:message></th>
            <th><g:message code="invoice.item.realPrice"></g:message></th>
            <th><g:message code="invoice.item.count"></g:message></th>
            <th><g:message code="invoice.item.totalPrice"></g:message></th>
        </tr>
        <g:each in="${basket}" var="basketItem" status="i">
            <tr>
                <td class="center">${i + 1}</td>
                <td>
                    ${basketItem.name}
                    <g:each in="${basketItem.selectedAddedValueNames}">
                        + ${it}
                    </g:each>
                </td>
                <td><g:formatNumber number="${basketItem.price ? basketItem.price : 0}"
                                    type="number"></g:formatNumber></td>
                <td><g:formatNumber number="${basketItem.price ? basketItem.realPrice - basketItem.price : 0}"
                                    type="number"></g:formatNumber></td>
                <td><g:formatNumber number="${basketItem.price ? basketItem.realPrice : 0}"
                                    type="number"></g:formatNumber></td>
                <td class="center">${basketItem.count}</td>
                <td><g:formatNumber number="${(basketItem.price ? basketItem.realPrice : 0) * basketItem.count}"
                                    type="number"></g:formatNumber></td>
            </tr>
        </g:each>
        <tr>
            <td colspan="6" align="left"><g:message code="deliveryPrice"></g:message></td>
            <td><g:formatNumber number="${order.deliveryPrice}" type="number"></g:formatNumber></td>
        </tr>
        <tr>
            <td colspan="6" align="left"><g:message code="basket.totalRoundedPrice"></g:message></td>
            <td><b><g:formatNumber
                    number="${Math.floor((basket.sum { (it.realPrice ? it.realPrice : 0) * it.count } + order.deliveryPrice) / 10000) * 10000}"
                    type="number"></g:formatNumber></b></td>
        </tr>
    </table>

    <div>
        <g:link action="checkout" class="btn"><g:message code="invoice.return"/></g:link>
        <g:link controller="order" action="create"
                params="${[deliveryPrice: order.deliveryPrice, deliverySourceStation: order.deliverySourceStation.id, optionalInsurance: order.optionalInsurance ?: false]}"
                class="btn btn-primary shop"><g:message code="basket.checkout"/></g:link>
    </div>
</div>
</body>
</html>