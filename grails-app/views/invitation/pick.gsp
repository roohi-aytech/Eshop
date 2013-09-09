<html>
<head>
    <title>Pick Friends</title>
    <link href="${resource(dir: 'css', file: 'inviter.css')}" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'inviter.js')}"></script>
</head>


<body>

<noscript>
    Sorry, this page requires JavaScript to work.
</noscript>

<h2>Pick Friends</h2>

<iv:contacts contacts="${contacts}"/>

<h2>iv:pickForm Send Picked Contacts To A Custom Action</h2>

<iv:pickForm controller="" action=""
             provider="${provider}"
             link="http://invitation.cloudfoundry.com"
             subject="join grails invitation"
             description="grails invitation"
             caption="picture caption"
             picture="http://www.grails.org/static/cXmUZIAv28XIiNgkRiz4RRl21TsGZ5HoGpZw1UITNyV.png"
             redirectUrl="http://invitation.cloudfoundry.com/success"/>
<r:layoutResources/>
</body>
</html>
