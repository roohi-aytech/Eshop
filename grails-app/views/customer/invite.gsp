<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 7/30/13
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site"/>
    <title><g:message code="controlPanel.points.invite.label"/></title>
</head>

<body>
<div class="page-content">
    <h2><g:message code="controlPanel.points.invite.label"/></h2>

    <div>
        <g:message code="controlPanel.points.invite.social.description"/>
    </div>

    <div class="socialNetworks">
        <iv:invitationLink provider="google">
            <img src="${resource(dir: 'images', file: 'google.png')}">
            <span>Google</span>
        </iv:invitationLink>
        <iv:invitationLink provider="yahoo">
            <img src="${resource(dir: 'images', file: 'yahoo.png')}">
            <span>Yahoo</span>
        </iv:invitationLink>
        <iv:invitationLink provider="facebook">
            <img src="${resource(dir: 'images', file: 'facebook.png')}">
            <span>Facebook</span>
        </iv:invitationLink>
        <iv:invitationLink provider="linkedin">
            <img src="${resource(dir: 'images', file: 'linkedin.png')}">
            <span>LinkedIn</span>
        </iv:invitationLink>
        <iv:invitationLink provider="twitter">
            <img src="${resource(dir: 'images', file: 'twitter.png')}">
            <span>Twitter</span>
        </iv:invitationLink>
        <iv:invitationLink provider="windowslive">
            <img src="${resource(dir: 'images', file: 'myspace.png')}">
            <span>Windows Live</span>
        </iv:invitationLink>

    </div>

    <div>
        <g:message code="controlPanel.points.invite.emailList.description"/>
    </div>

    <div>
        <g:form controller="invitation" action="emailList">
            <g:textArea name="mailList" rows="7" cols="200" style="width: 500px;margin-top:10px;direction: rtl;"/>
            <div class="btn-toolbar">
                <input type="submit" class="btn btn-primary" value="${message(code: 'send')}"/>
            </div>
        </g:form>
    </div>
</div>

</body>
</html>