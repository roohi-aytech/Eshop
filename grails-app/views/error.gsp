<!doctype html>
<html>
<head>
    <title>خطا</title>
    <meta name="layout" content="site">
    <link href="${resource(dir: 'css', file: 'errors.css')}" rel="stylesheet" type="text/css"/>
</head>

<body>
در سیستم خطایی رخ داده است
<br/>
لطفا مجددا تلاش فرمایید
<br/>

<g:renderException exception="${exception}"/>
<script>
    window.location.reload(true)
</script>
</body>
</html>