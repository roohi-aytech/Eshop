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
    <table border="0">
        <tr>
            <td class="label"><g:message code="invoice.owner.name"></g:message>:</td>
            <td class="value">${customer}</td>
            <td class="label"><g:message code="invoice.billingAddress"></g:message>:</td>
            <td rowspan="2" class="value">${customer.billingAddress.addressLine1}</td>
        </tr>
        <tr>
            <td class="label"><g:message code="invoice.owner.email"></g:message>:</td>
            <td class="value">${customer.email}</td>
            <td></td>
        </tr>
        <tr>
            <td class="label"><g:message code="invoice.owner.mobile"></g:message>:</td>
            <td class="value">${customer.mobile}</td>
            <td class="label"><g:message code="invoice.sendingAddress"></g:message>:</td>
            <td rowspan="2" class="value">${customer.sendingAddress.addressLine1}</td>
        </tr>
        <tr>
            <td class="label"><g:message code="invoice.owner.telephone"></g:message>:</td>
            <td class="value">${customer.telephone}</td>
            <td></td>
        </tr>
    </table>
    <table border="1">
        <tr>
            <th>#</th>
            <th><g:message code="invoice.item.name"></g:message></th>
            <th><g:message code="invoice.item.count"></g:message></th>
            <th><g:message code="invoice.item.price"></g:message></th>
            <th><g:message code="invoice.item.totalPrice"></g:message></th>
        </tr>
        <g:each in="${basket}" var="basketItem" status="i">
        <tr>
            <td>${i+1}</td>
            <td>${basketItem.name}</td>
            <td>${basketItem.count}</td>
            <td><g:formatNumber number="${basketItem.price}" type="number"></g:formatNumber></td>
            <td><g:formatNumber number="${basketItem.price * basketItem.count}" type="number"></g:formatNumber></td>
        </tr>
        </g:each>
    </table>
</div>
<g:link action="shop" class="btn btn-primary shop"><g:message code="basket.checkout"/></g:link>
</body>
</html>