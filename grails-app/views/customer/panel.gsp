<%@ page import="eshop.RoleHelper" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="site"/>
    <title><g:message code="controlPanel.title" default="Control Panel"/></title>
</head>

<body>
<div class="control-panel">
    <h2><g:message code="controlPanel.title" default="Control Panel"/></h2>

    <g:if test='${flash.message}'>
        <div class='info'><div>${flash.message}</div></div>
    </g:if>

    <div class="group">
        <div class="header">
            <img src="../images/settings.png">
            <h3><g:message code="controlPanel.settings.label"></g:message></h3>
            <div class="comment"><g:message code="controlPanel.settings.description"></g:message></div>
        </div>

        <div class="column1 items">
            <h4><g:message code="controlPanel.settings.profile.label"></g:message></h4>
            <ul class="master">
                <li><g:link controller="customer" action="profile"><g:message code="controlPanel.settings.profile.info.label"></g:message> </g:link> </li>
                <li><g:link controller="customer" action="changePassword"><g:message code="controlPanel.settings.profile.changePassword.label"></g:message> </g:link> </li>
                <li><common:logoutLink></common:logoutLink></li>
            </ul>
        </div>

        <div class="column2 items">
            <h4><g:message code="controlPanel.settings.preferences.label"></g:message></h4>
            <ul class="slave">
                <li>item 2</li>
                <li>item 2</li>
                <li>item 2</li>
            </ul>
        </div>
    </div>

    <div class="group">
        <div class="header">
            <img src="../images/settings.png">
            <h3><g:message code="controlPanel.settings.label"></g:message></h3>
            <div class="comment"><g:message code="controlPanel.settings.description"></g:message></div>
        </div>

        <div class="column1 items">
            <h4><g:message code="controlPanel.settings.profile.label"></g:message></h4>
            <ul class="master">
                <li>item 1</li>
                <li>item 1</li>
                <li>item 1</li>
            </ul>
        </div>

        <div class="column2 items">
            <h4><g:message code="controlPanel.settings.preferences.label"></g:message></h4>
            <ul class="slave">
                <li>item 2</li>
                <li>item 2</li>
                <li>item 2</li>
            </ul>
        </div>
    </div>

</div>
</body>
</html>
