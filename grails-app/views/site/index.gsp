<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site">
    <script type="text/javascript">
        $.templateLayoutShowOnReady();
        $(function () {
            $.setTemplateLayout('${resource(dir: 'css/templates', file: 'firstPage.css')}', '')
        })
    </script>
    <link rel="stylesheet" href="${resource(dir: 'css/templates', file: 'firstPage.css')}" type="text/css">
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

<div class="slide-show"></div>

<div class="off-list"></div>

<div class="new-products"></div>

<div class="most-viewed-products"></div>

<div class="recomanded-products"></div>

<div class="recent-products"></div>

<div class="bottom-bar">
    <div class="help"></div>

    <div class="know-us"></div>

    <div class="contact-us"></div>
</div>
</body>
</html>