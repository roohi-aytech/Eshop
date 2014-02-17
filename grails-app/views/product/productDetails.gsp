<%@ page import="eshop.ProductType; eshop.Product" %>
<!doctype html>
<html>
<head>
    <r:require modules="bootstrap-file-upload"/>
    <meta name="layout" content="main">
    <title>${productInstance}</title>

</head>

<body>
<h2><g:message code="product.details.label" default="Product Details"/> ${productInstance}</h2>

<div id="details-tabs">
    <ul>
        <li><a href="#details"><g:message code="product.details"/></a></li>
        <li><a href="#attributes"><g:message code="attributes"/></a></li>
        <li><a href="#variations"><g:message code="variations"/></a></li>
        <sec:ifAllGranted roles="${eshop.RoleHelper.ROLE_PRICE_ADMIN}">
            <li><a href="#productModels"><g:message code="productModels"/></a></li>
            <li><a href="#addedValue"><g:message code="addedValue"/></a></li>
        </sec:ifAllGranted>
        <li><a href="#product_description"><g:message code="description"/></a></li>
        <li><a href="#product_proOpinions"><g:message code="product.proOpinions"/></a></li>
        <li><a href="#images"><g:message code="images"/></a></li>
        <li><a href="#videos"><g:message code="videos"/></a></li>

    </ul>

    <div id="details">
        <g:render template="productDetails_form"/>
    </div>

    <div id="attributes">
        <g:render template="attributeValues"/>
    </div>

    <div id="variations" style="width: 98%">
        <g:render template="../variationGroup/variations"/>
    </div>
    <sec:ifAllGranted roles="${eshop.RoleHelper.ROLE_PRICE_ADMIN}">
        <div id="productModels" style="width: 98%">
            <g:render template="../productModel/list"/>

            <input type="button" value="${message(code:'specialSaleSlide')}" onclick="window.location.href='${createLink(controller: 'specialSaleSlide', action: 'list', params:[id:productInstance.id, detail:params.id])}';">
        </div>

        <div id="addedValue" style="width: 98%">
            <g:render template="../addedValue/list"/>
        </div>
    </sec:ifAllGranted>
    <div id="product_description">
        <g:render template="description"/>
    </div>
    <div id="product_proOpinions">
        <g:render template="details"/>
    </div>

    <div id="images">
        <g:render template="images"/>
    </div>

    <div id="videos">
        <g:render template="videos"/>
    </div>



</div>
<script language="javascript" type="text/javascript">
    $(function() {
        $( "#details-tabs" ).tabs({
            selected:${curtab ?: 0}
    ${productInstance.id ? "" : ",disabled:[1,2,3,4,5,6,7]"}
    });
    });
</script>

</body>
</html>