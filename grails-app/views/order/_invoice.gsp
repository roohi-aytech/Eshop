<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 4/7/13
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>

<div class="invoice">
    <h2>${title}</h2>
    <table class="customer-info">
        <tr>
            <td class="label"><g:message code="invoice.owner.name"></g:message>:</td>
            <td class="value">${order.ownerName}</td>
            <td class="label"><g:message code="invoice.billingAddress"></g:message>:</td>
            <td rowspan="2" class="value"><g:render template="/site/formatters/address"
                                                    model="${[address: order.billingAddress]}"></g:render></td>
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
                                                    model="${[address: order.sendingAddress]}"></g:render></td>
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
            <td class="value">${order.id}</td>
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
        <g:each in="${order.items}" var="orderItem" status="i">
            <tr>
                <td class="center">${i + 1}</td>
                <td>
                    ${orderItem.productModel}
                    <g:each in="${orderItem.addedValues}">
                        + ${it}
                    </g:each>
                </td>
                <td><g:formatNumber number="${orderItem.baseUnitPrice}"
                                    type="number"></g:formatNumber></td>
                <td><g:formatNumber number="${orderItem.addedValuesPrice}"
                                    type="number"></g:formatNumber></td>
                <td><g:formatNumber number="${orderItem.unitPrice}"
                                    type="number"></g:formatNumber></td>
                <td class="center">${orderItem.orderCount}</td>
                <td><g:formatNumber number="${orderItem.totalPrice}"
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
                    number="${order.totalPrice}"
                    type="number"></g:formatNumber></b></td>
        </tr>
    </table>
</div>