<%@ page import="eshop.Product" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <r:require modules="bootstrap"/>
    <meta name="layout" content="site">
    <p:css name="firstPage"/>
</head>

<body>
<g:set var="productId" value="1"/>
<g:set var="product" value="${Product.get(productId)}"/>
<div class="bodyContent">
    <div class="row-fluid">
        <div class="span2"><img src="<g:createLink action="image" params="[id: productId, wh: '150x150']"/>"/></div>

        <div class="span4">
            <h3>${product.name}</h3>
            <eshop:showPrice productId="${productId}"/>
        </div>
    </div>
</div>
</body>
</html>