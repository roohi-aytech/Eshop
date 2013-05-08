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

</head>

<body>
<h2><g:message code="productModel.details.label" default="Product Model Details"/> ${productModelInstance}</h2>

<div>
    <ul>
        <li><a href="#price"><g:message code="price"/></a></li>

    </ul>

    <div id="price" style="width: 98%">
        <g:render template="../producerProductModel/list"/>
    </div>


</div>
%{--<g:javascript>--}%
%{--$(function () {--}%
%{--$("#details-tabs").tabs();--}%
%{--});--}%
%{--</g:javascript>--}%
</body>
</html>