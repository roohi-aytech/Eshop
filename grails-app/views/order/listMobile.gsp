<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 4/9/13
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mobile"/>
    <title><g:message code="orders"/> ${status ? message(code: "order.status.${status}") : ''}</title>
</head>

<body>
<div class="control-panel">
    <h2 style="margin-bottom: 10px;"><span><g:message code="orders"/> ${status ? message(code: "order.status.${status}") : ''}</span> <g:message
            code="yours"/></h2>
    <g:if test="${orderList.empty}">
        <div class="info">
            <div><g:message code="list.empty.message"/></div>
        </div>
    </g:if>
    <g:each in="${orderList}" var="order">

        <div class="product-detail">
            <p class="sku-no">
                <g:message code="order.${order.status}.date"/>: <rg:formatJalaliDate
                        date="${order.trackingLogs.sort { -it.id }.first().date}" hm="true"/>
            </p>
        </div>

        <div class="acnt-btn no-arrow">
            <a href="javascript:void(0)">
                <h3 style="margin-bottom: 10px;">${order.trackingCode ?: '#' + order.id}</h3>

                <div class="price" style="border-bottom: 1px dashed #dddddd;padding-bottom:10px;margin-bottom:10px;">
                    <g:message code="order.totalPrice"/>:
                    <span class="red"><g:formatNumber number="${order.totalPrice}" type="number"/></span>
                </div>

                <g:each in="${order.items.findAll { !it.deleted }}" var="orderItem">
                    <g:if test="${orderItem.productModel}">
                        <div style="padding:5px;font-size:13px; ">
                            ${orderItem.productModel}
                            <g:if test="${orderItem.productModel.status != 'exists'}">
                                <span class="comment">(<g:message
                                        code="productModel.status.${orderItem.productModel.status}"/>)</span>
                            </g:if>

                        </div>
                    </g:if>
                </g:each>

                <g:if test="${order.status == 'inquired'}">
                    <input type="button" class="grn-btn" onclick="window.location.href='${createLink(controller: 'order', action: 'completion', id: order.id)}';" value="${message(code:"controlPanel.orders.actions.completion.label")}" style="width: 100%;margin-top:10px;"/>
                </g:if>
            </a>
        </div>
    </g:each>
</div>

</body>
</html>