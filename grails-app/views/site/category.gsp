<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site">
    <script type="text/javascript">
        $.templateLayoutShowOnReady();
        $(function () {
            $.setTemplateLayout('${resource(dir: 'css/templates', file: 'categoryPage.css')}', '')
        })
    </script>
    <link rel="stylesheet" href="${resource(dir: 'css/templates', file: 'categoryPage.css')}" type="text/css">
    <title>salam</title>
</head>

<body>
<div id="header">header</div>

<div class="status-bar">
    <div class="menu-bar"><g:render template="menu"/></div>

    <div class="search-bar"></div>

    <div class="login"></div>

    <div class="buy-list"></div>

    <div class="compare-list"></div>

    <div class="wish-list"></div>

    <div class="support"></div>
</div>

<div class="filters"><g:render template="filters"/></div>

<div class="contents">contents</div>

</body>
</html>