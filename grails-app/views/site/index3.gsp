<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
%{--<script src="${resource(dir: 'js', file: 'jquery-latest.js')}" type="text/javascript"></script>--}%
<script src="${resource(dir: 'js', file: 'jquery.bxSlider.min.js')}" type="text/javascript"></script>
    <meta name="layout" content="site">
    <script type="text/javascript">
        $.templateLayoutShowOnReady();
        $(function () {
            $.setTemplateLayout('${resource(dir: 'css/templates', file: 'firstPage.css')}', '')
        })
    </script>

    <link rel="stylesheet" href="${resource(dir: 'css/templates', file: 'firstPage.css')}" type="text/css">
    <title><g:message code="site.title"/></title>
</head>

<body>


<g:render template="status_bar"/>

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