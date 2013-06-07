<!doctype html>
<html>
<head>
    <r:require modules="bootstrap-file-upload"/>
    <meta name="layout" content="main">

    <title><g:message code="productModel.label" default="Product Model"/></title>
</head>

<body>
<h2><g:message code="productModel-details" default="Product Model Details"/> ${productModelInstance}</h2>

<div id="details-tabs">
    <ul>
        <li><a href="#price"><g:message code="price"/></a></li>
        <li><a href="#producer"><g:message code="producer"/></a></li>
    </ul>

    <div id="price" style="width: 98%">
        <g:render template="../price/prices"/>
    </div>

    <div id="producer" style="width: 98%">
        <g:render template="../producerProductModel/list"/>
    </div>

</div>
<g:javascript>
    $(function () {
        $("#details-tabs").tabs();
    });
</g:javascript>
</body>
</html>