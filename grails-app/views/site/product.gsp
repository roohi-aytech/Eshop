<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site">

    <link rel="stylesheet" href="${resource(dir: 'css/templates', file: 'firstPage.css')}" type="text/css">
    <title>${product?.name}</title>
</head>

<body>

<g:render template="status_bar"/>
<div class="bodyContent">
    <div class="product-images"><g:render template="product/zoom"/></div>

    <div class="product-info">
        <div class="product-name">${product?.name}</div>

        <g:render template="price"/>

        <div class="product-description">${product?.description}</div>

        <g:render template="product/variation"/>
    </div>
    <div>
        <g:render template="product/description"/>
    </div>
</div>
</body>
</html>