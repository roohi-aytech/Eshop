<html>
<head>
    <meta name="layout" content="site"/>
    <title><g:message code="grails.plugin.invitation.result.title"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file:'inviter.css')}"/>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'inviter.js')}"></script>
</head>


<body>
<div class="page-content">
    <h2><g:message code="grails.plugin.invitation.result.title"/></h2>

    <p><g:message code="grails.plugin.invitation.address.list"/></p>

    <ul style="margin-right: 30px;">
        <g:each in="${addresses.split(',')}" var="address">
            <li>
                ${address}
            </li>
        </g:each>
    </ul>

</div>

</body>
</html>
