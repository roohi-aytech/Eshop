<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 8/10/13
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="eshop.OrderTrackingLog; eshop.OrderItem" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site"/>
    <title><g:message code="order.tracking"/></title>
</head>

<body>
<div class="page-content">
    <h2><g:message code="order.tracking"/></h2>
    <g:if test="${order}">
        <div class="info">
            <div><g:message code="order.status.your"/>: <b><g:message
                    code="order.status.${order.status}"/></b><br/>
                <g:message code="order.trackingCode"/>: <b>${order.trackingCode}</b></div>
        </div>
        <g:if test="${order.customer.id == customer?.id}">
            <table class="table-simulated orderTrackingDetails" cellpadding="5" cellspacing="5">
                <tr>
                    <td>
                        <h3><g:message code="order.items"/></h3>
                        <ul class="products">
                            <g:each in="${OrderItem.findAllByOrder(order)}" var="orderItem">
                                <li>
                                    <img src="${createLink(controller: 'image', params: [id: orderItem.productModel.product.id, wh: '50x50'])}"/>

                                    <div class="title"><a
                                            href="${createLink(uri: '/product/' + orderItem.productModel.product.id)}">${orderItem.productModel}</a>
                                    </div>
                                    <div class="price">
                                        <g:message code="price"/>: <g:formatNumber number="${orderItem.unitPrice}" type="number"/> <g:message code="rial"/>
                                    </div>
                                    <div class="count">
                                        <g:message code="count"/>: <g:formatNumber number="${orderItem.orderCount}" type="number"/>
                                    </div>
                                    <div class="clear-float"></div>
                                </li>
                            </g:each>
                            <hr/>
                            <div>
                                <g:message code="deliveryPrice"/>:
                                <g:if test="${order.deliveryPrice == 0}">
                                    <g:message code="free"/>
                                </g:if>
                                <g:else>
                                    <g:formatNumber number="${order.deliveryPrice}" type="number"/> <g:message code="rial"/>
                                </g:else>
                            </div>
                            <div>
                                <g:message code="order.totalPrice"/>: <b><g:formatNumber number="${order.totalPrice}" type="number"/> <g:message code="rial"/></b>
                            </div>
                        </ul>
                    </td>
                    <td>
                        <h3><g:message code="order.history"/></h3>
                        <ul class="history">
                            <g:each in="${OrderTrackingLog.findAllByOrder(order).reverse()}" var="trackingLog">
                                <li>
                                    <div class="title"><g:message code="${trackingLog.title}"/></div>

                                    <div>
                                        <span class="date"><rg:formatJalaliDate date="${trackingLog.date}"
                                                                                hm="true"/></span>
                                    </div>

                                    <div class="description">${trackingLog.description}</div>
                                </li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
            </table>
        </g:if>
    </g:if>
    <g:else>
        <div class="error">
            <div><g:message code="order.tracking.notFound"/></div>
        </div>
    </g:else>
</div>
</body>
</html>