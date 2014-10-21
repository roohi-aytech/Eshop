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
    <meta name="layout" content="site"/>
    <title><g:message code="order.actions.completion"/></title>
</head>

<body>
<div class="page-content"
     style="display: ${order.paymentTimeout > new Date() ? 'inline-block' : 'block'}">
    <h2><g:message code="order.actions.completion"/></h2>

%{--<sec:ifLoggedIn>--}%
    <g:if test="${order.paymentTimeout > new Date()}">
        <div class="export-toolbar">
            <a class="btn btn-success" href="${createLink(action: 'pdf', params: [id: params.id])}">
                <img src="${resource(dir: 'images', file: 'pdf.png')}"/>
                <g:message code="invoice.export.pdf"/>
            </a>
        </div>
        <g:render template="invoice/container" model="${[order: order]}"/>
        <div>
            <a class="btn btn-primary" href="${createLink(action: 'payment', params: [id: params.id])}">
                <g:message code="order.actions.payment"/>
            </a>
        </div>
    </g:if>
    <g:else>
        <div class="info">
            <div><g:message code="order.paymentTimeout.expired"/></div>
        </div>
    </g:else>
%{--</sec:ifLoggedIn>--}%
%{--<sec:ifNotLoggedIn>--}%
%{--<div class="info">--}%
%{--<div><g:message code="order.completion.loginRequired"></g:message></div>--}%
%{--<common:loginLink class="btn btn-success"/>--}%
%{--</div>--}%
%{--</sec:ifNotLoggedIn>--}%
</div>
</body>
</html>