<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 4/9/13
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site"/>
    <title><g:message code="notFound"></g:message></title>
    <meta http-equiv="refresh" content="5;URL=${createLink(absolute: true, uri: "/")}">
</head>

<body>
<div class="page-content">
    <h3><g:message code="notFound"></g:message></h3>
    <div>
        تا لحظاتی دیگری به صورت خودکار به
         <a href="${createLink(uri: '/')}">
        صفحه اصلی سایت
         </a>
         هدایت خواهید شد.
    </div>
</div>
</body>
</html>