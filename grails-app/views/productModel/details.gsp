<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 4/25/13
  Time: 9:44 PM
  To change this template use File | Settings | File Templates.
--%>

<!doctype html>
<html>
<head>
    <meta name="layout" content="main">

    <title><g:message code="productModel.price.label" default="Price"/></title>

</head>

<body>
<h2><g:message code="productModel.prices.label" default="Prices"/> ${productModelInstance}</h2>

<div>


    <div id="price" style="width: 98%">
        <g:render template="../price/prices"/>
    </div>


</div>
%{--<g:javascript>--}%
%{--$(function () {--}%
%{--$("#details-tabs").tabs();--}%
%{--});--}%
%{--</g:javascript>--}%
</body>
</html>