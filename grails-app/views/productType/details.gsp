<!doctype html>
<html>
<head>
    <r:require modules="bootstrap-file-upload"/>
    <meta name="layout" content="main">

    <title><g:message code="product.attributeValues.label" default="Product Details"/></title>
</head>

<body>
<h2><g:message code="product.type.details.label" default="Product Type Details"/> ${productTypeInstance}</h2>

<div id="details-tabs">
    <ul>
        <li><a href="#godFathers"><g:message code="godFathers"/></a></li>
        %{--<li><a href="#variations"><g:message code="variations"/></a></li>--}%
        <li><a href="#addedValue"><g:message code="addedValue"/></a></li>
        <li><a href="#articles"><g:message code="articles"/></a></li>
        <li><a href="#gift"><g:message code="gift"/></a></li>
    </ul>

    <div id="godFathers" style="width: 98%">
        <g:render template="godFathers"/>
    </div>

    %{--<div id="variations" style="width: 98%">--}%
        %{--<g:render template="../variationGroup/variations"/>--}%
    %{--</div>--}%
    <div id="addedValue" style="width: 98%">
        <g:render template="../addedValue/list"/>
    </div>
    <div id="articles" style="width: 98%">
        <g:render template="../journalArticle/list"/>
    </div>
    <div id="gift">
        <g:render template="gift"/>
    </div>


</div>
<g:javascript>
    $(function () {
        $("#details-tabs").tabs();
    });
</g:javascript>
</body>
</html>