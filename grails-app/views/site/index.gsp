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


<div class="status-bar">
    <div class="menu-bar"><g:render template="menu"/></div>

    <div class="search-bar"></div>

    <div class="login"></div>

    <div class="buy-list"></div>

    <div class="compare-list"></div>

    <div class="wish-list"></div>

    <div class="support"></div>
	
	<div class="logo"></div>
</div>
<div class="bodyContent">
	<div class="rightContent">
		<div class="slide-show">
			<g:render template="slideShow"/>
		</div>

		<div class="off-list">
			<g:render template="newProduct"/>
		</div>

		<div class="new-products">
			<g:render template="newProduct"/>
		</div>
<!--
		<div class="most-viewed-products"></div>

		<div class="recomanded-products"></div>

		<div class="recent-products"></div>
		-->
	</div>
	<div class="leftContent">
		<div class="namadeEtemadeMeli"><a href="#"><img src="${resource(dir: 'images/site', file: 'namadeEtemadeMelii.png')}"/></a>
		</div>
	</div>

</div>
<div class="bottom-bar">
    <div class="help">راهنمای استفاده از زنبیل</div>

    <div class="know-us">با ما آشنا شوید</div>

    <div class="contact-us">ارتباط با ما</div>
</div>
</body>
</html>