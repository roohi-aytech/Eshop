<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<div>SiteMap List:</div>
<ol>
    <li>
        <a href="${createLink(action: 'statics')}">Statics</a>
    </li>
    <li>
        <a href="${createLink(action: 'productTypes')}">ProductTypes</a>
    </li>
    <li>
        <a href="${createLink(action: 'products')}">Products</a>
    </li>
    <li>
        <a href="${createLink(action: 'images')}">Images</a>
    </li>
    <li>
        <a href="${createLink(action: 'searches')}">Searches</a>
    </li>
</ol>
</body>
</html>