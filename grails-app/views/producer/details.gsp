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
    <r:require modules="bootstrap-file-upload"/>
    <meta name="layout" content="main">

    <title><g:message code="producer.attributeValues.label" default="Producer Details"/></title>
</head>

<body>
<h2><g:message code="producer.details.label" default="Producer Details"/> ${producerInstance}</h2>

<div id="details-tabs">
    <ul>
        <li><a href="#producingProducts"><g:message code="producingProducts"/></a></li>

    </ul>

    <div id="producingProducts" style="width: 98%">
        <g:render template="../producingProduct/list"/>
    </div>


</div>
<g:javascript>
    $(function () {
        $("#details-tabs").tabs();
    });
</g:javascript>
</body>
</html>