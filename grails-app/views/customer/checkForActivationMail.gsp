<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 4/28/13
  Time: 10:01 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='${session.mobile?'mobile':'site'}'/>
  <title><g:message code="springSecurity.checkForActivationMail.title"/></title>
</head>
<body>
    <div class="control-panel">
    <div class="info">
        <div>
            <g:message code="springSecurity.checkForActivationMail.description"/>
        </div>
    </div>
        <g:if test="${session['RegBon']}">
        <div class="info">
            <g:message code="regBon.msg" args="[formatNumber(number:session['RegBon'],type:'number'),session['RegBonTitle']]"/>
        </div>
        </g:if>
    </div>
</body>
</html>