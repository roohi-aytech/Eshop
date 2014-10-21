<!doctype html>
<html>
<head>
    <title>Grails Runtime Exception</title>
    <meta name="layout" content="main">
    <link href="${resource(dir: 'css', file: 'errors.css')}" rel="stylesheet" type="text/css"/>
</head>

<body>
<g:renderException exception="${exception}"/>
</body>
</html>