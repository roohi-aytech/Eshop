<%@ page import="eshop.RoleHelper" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="application.name" default="EShop Administration"/></title>
</head>

<body>
<h2><g:message code="application.name" default="EShop Administration"/></h2>

<BR>
<BR>
<ul id="home-nav">
    <li>
        <sec:ifAllGranted roles="${RoleHelper.ROLE_PRODUCT_TYPE_ADMIN}">
            <h3>
                <g:message code="navigation.manage.product.type" default="product Type Management"/>
            </h3>

            <ul>
                <li>
                    <g:link controller="producer" action="list"><img
                            src="images/productType.png"/><span><g:message
                            code="producer.label"
                            default="Producers"/></span></g:link></li>


                    <g:link controller="productType" action="list"><img
                            src="images/productType.png"/><span><g:message
                            code="productType.label"
                            default="Product Types"/></span></g:link></li>

                <li>
                    <g:link controller="variationGroup" action="list"><img
                            src="images/variations.png"/><span><g:message
                            code="variationGroup.label"
                            default="VariationGroups"/></span></g:link></li>
                <li>
                    <g:link controller="brand" action="list"><img
                            src="images/brand.png"/><span><g:message
                            code="brand.label"
                            default="Brand"/></span></g:link></li>
                <li>
                    <g:link controller="pageDetails" action="list"><img
                            src="images/pageDetails.png"/><span><g:message
                            code="pageDetails.label"
                            default="Page Details"/></span></g:link></li>
                <li>
                    <g:link controller="currency" action="list"><img
                            src="images/currency.png"/><span><g:message
                            code="currency.label"
                            default="Currency"/></span></g:link></li>
                <li>
                    <g:link controller="cultureEvent" action="list"><img
                            src="images/cultureEvent.png"/><span><g:message
                            code="cultureEvent.label"
                            default="Culture Event"/></span></g:link></li>
            </ul>
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="${RoleHelper.ROLE_PRODUCT_ADMIN}">

            <h3>
                <g:message code="navigation.manage.product" default="product management"/>
            </h3>
            <ul>
                <li>
                    <g:link controller="product" action="list"><img
                            src="images/products.png"/><span><g:message
                            code="product.label"
                            default="Products"/></span></g:link></li>
            </ul>
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="${RoleHelper.ROLE_USER_ADMIN}">
            <h3>
                <g:message code="navigation.manage.users" default="User Management"/>
            </h3>
            <ul>
                <li>
                    <g:link controller="user" action="list"><img
                            src="images/users.png"/><span><g:message
                            code="user.label"
                            default="Users"/></span></g:link></li>
            </ul>
        </sec:ifAllGranted>

    </li>
</ul><!-- end #nav -->
</body>
</html>
