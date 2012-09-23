<%@ page import="eshop.ProductType; eshop.Product" %>
<!doctype html>
<html>
<head>
    <r:require modules="bootstrap-file-upload"/>
    <meta name="layout" content="main">
    <title><g:message code="product.attributeValues.label" default="Product Details" /></title>

</head>
<body>
<h2><g:message code="product.details.label" default="Product Details" /> q${productInstance}</h2>
<div id="details-tabs">
    <ul>
        <li><a href="#attributes"><g:message code="attributes"/></a></li>
        <li><a href="#variations"><g:message code="variations"/></a></li>
        <li><a href="#description"><g:message code="description"/></a></li>
        <li><a href="#images"><g:message code="images"/></a></li>
        <li><a href="#videos"><g:message code="videos"/></a></li>
    </ul>
    <div id="attributes">
        <g:render template="attributeValues"/>
    </div>
    <div id="variations" style="width: 98%">
        <g:render template="../variationGroup/variations"/>
    </div>
    <div id="description">
        <g:render template="description"/>
    </div>
    <div id="images">
        <g:render template="images"/>
    </div>
    <div id="videos">
        <g:render template="videos"/>
    </div>

</div>
<g:javascript>
    $(function() {
        $( "#details-tabs" ).tabs({
            selected:${curtab?:0}
        });
    });
</g:javascript>


</body>
</html>