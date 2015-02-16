<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 8/25/13
  Time: 2:25 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mobile"/>
    <title><g:message code="order.actions.completion"/></title>
</head>

<body>
<h2 style="margin-bottom: 10px;"><g:message code="order.actions.completionMobile"/></h2>


<g:if test="${order.paymentTimeout > new Date()}">
    <div class="page-content">
        <div style="line-height: 18px;font-size:13px;">
        <g:render template="invoice/mobile" model="${[order: order]}"/>
        </div>
        <div class="export-toolbar" style="border-top:1px dashed #dddddd;margin-top:10px;padding-top:10px;">
            <a class="btn btn-success" target="_blank" href="${createLink(action: 'pdf', params: [id: params.id])}">
                <img src="${resource(dir: 'images', file: 'pdf.png')}"/>
                <g:message code="invoice.export.pdf"/>
            </a>
        </div>
    </div>
    <div>
        <a class="grn-btn" href="${createLink(action: 'payment', params: [id: params.id])}" style="width:100%;text-align: center;padding:12px;">
            <g:message code="order.actions.payment"/>
        </a>
    </div>
</g:if>
<g:else>
    <div class="page-content">
        <g:message code="order.paymentTimeout.expired"/>
    </div>
</g:else>
<div class="clear20"></div>
</body>
</html>