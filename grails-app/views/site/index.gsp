<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<script src="${resource(dir: 'js', file: 'jquery-latest.js')}" type="text/javascript"></script>
<script src="${resource(dir: 'js', file: 'jquery.bxSlider.min.js')}" type="text/javascript"></script>
    <meta name="layout" content="site">
    <script type="text/javascript">
        $.templateLayoutShowOnReady();
        $(function () {
            $.setTemplateLayout('${resource(dir: 'css/templates', file: 'firstPage.css')}', '')
        })
    </script>

    <link rel="stylesheet" href="${resource(dir: 'css/templates', file: 'firstPage.css')}" type="text/css">
    <title>Zanbil Eshop</title>
</head>

<body>


<div class="status-bar" style="z-index:10;">
    <div class="menu-bar"><g:render template="menu"/></div>

    <div class="search-bar">
		<input id="search">
	</div>
<div class="topLinks">
    <div class="login"><a href="#" style="display:block;" id="topLink">پروفایل</a></div>

    <div class="buy-list"><a href="#" style="display:block;" id="topLink">زنبیل خرید</a></div>

    <div class="compare-list"><a href="#" style="display:block;" id="topLink">زنبیل مقایسه</a></div>

    <div class="wish-list"><a href="#" style="display:block;" id="topLink">زنبیل آرزو</a></div>

    <div class="support"><a href="#" style="display:block;" id="topLink">پشتیبانی</a></div>
	
	<div class="logo"></div>
</div>	
</div>
<div class="bodyContent">
	<div class="rightContent">
		<div class="slide-show module" >
			<g:render template="slideShow"/>
		</div>

		<div class="off-list module">
			<g:render template="offList"/>
		</div>

		<div class="new-products module">
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
		<div class="advertisement module">
			<img src="${resource(dir: 'images/site', file: 'advertise.png')}" style="width:200px;margin:0 auto 0 auto;"/>
		</div>
		<div class="most-sold module">
			<g:render template="mostsold"/>
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