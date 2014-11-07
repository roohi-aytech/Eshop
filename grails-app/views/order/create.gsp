<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 8/20/13
  Time: 10:37 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:if test="${session.mobile}">
        <meta name="layout" content="mobile"/>
    </g:if>
    <g:else>
        <meta name="layout" content="site"/>
    </g:else>
    <title><g:message code="enquiry.request"/></title>
</head>

<body>
<h2 style="margin-top:10px;margin-bottom:10px;">
    <g:message code="order.trackingCode.label"/>: <b>${trackingCode}</b>
</h2>
<div class="page-content">
    <div class='${session.mobile ? '' : 'info'}'><div><g:message code="order.creation.success.message"/>
        %{--<h2 style="font-size: 16px !important;margin-bottom:0;margin-top:20px;">--}%
            %{--<g:message code="order.trackingCode.label"/>: <b>${trackingCode}</b>--}%
        %{--</h2>--}%
    </div></div>
</div>
</body>
</html>