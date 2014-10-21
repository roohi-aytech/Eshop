<html>
<head>
    <meta name="layout" content="site"/>
    <title><g:message code="grails.plugin.invitation.pickForm.submit"/></title>
    <link href="${resource(dir: 'css', file: 'inviter.css')}" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'inviter.js')}"></script>
</head>


<body>

<div class="page-content">

    <h2><g:message code="grails.plugin.invitation.pickForm.submit"/></h2>

    <iv:contacts contacts="${contacts}"/>

    <h2><g:message code="grails.plugin.invitation.pickForm.title"/></h2>

    <iv:messageForm provider="${provider}"
                    link="${createLink(uri: '/', absolute: true)}"
                    subject="${message(code:'grails.plugin.invitation.subject')}"
                    description="grails invitation"
                    caption="picture caption"
                    picture="http://www.grails.org/static/cXmUZIAv28XIiNgkRiz4RRl21TsGZ5HoGpZw1UITNyV.png"
                    redirectUrl="${createLink(uri: '/success', absolute: true)}"
                    message="${render(template: 'invitation')}"
                    canEditMessage="true"/>
</div>
</body>
</html>
