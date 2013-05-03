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
        <sec:ifAnyGranted
                roles="${RoleHelper.ROLE_PRODUCT_TYPE_ADMIN},${RoleHelper.ROLE_PRODUCER_ADD},${RoleHelper.ROLE_PRODUCER_ADD_EDIT}">
            <h3>
                <g:message code="navigation.manage.product.type" default="product Type Management"/>
            </h3>

            <ul>
                <sec:ifAnyGranted
                        roles="${eshop.RoleHelper.ROLE_PRODUCER_ADD},${eshop.RoleHelper.ROLE_PRODUCER_ADD_EDIT}">
                    <li>
                        <g:link controller="producer" action="list"><img
                                src="images/supplier.png"/><span><g:message
                                code="producer.label"
                                default="Producers"/></span></g:link></li>
                </sec:ifAnyGranted>
                <sec:ifAllGranted roles="${eshop.RoleHelper.ROLE_PRODUCT_TYPE_ADMIN}">
                    <li>
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
                        <g:link controller="currency" action="list"><img
                                src="images/currency.png"/><span><g:message
                                code="currency.label"
                                default="Currency"/></span></g:link></li>
                    <li>
                        <g:link controller="cultureEvent" action="list"><img
                                src="images/cultureEvent.png"/><span><g:message
                                code="cultureEvent.label"
                                default="Culture Event"/></span></g:link></li>
                </sec:ifAllGranted>
            </ul>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted
                roles="${RoleHelper.ROLE_PRODUCT_ADMIN},${eshop.RoleHelper.ROLE_PRICE_ADMIN},${RoleHelper.ROLE_PRODUCT_ADD},${RoleHelper.ROLE_PRODUCT_ADD_EDIT}">

            <h3>
                <g:message code="navigation.manage.product" default="product management"/>
            </h3>
            <ul>
                <sec:ifAnyGranted
                        roles="${RoleHelper.ROLE_PRODUCT_ADMIN},${RoleHelper.ROLE_PRODUCT_ADD},${RoleHelper.ROLE_PRODUCT_ADD_EDIT}">
                    <li>
                        <g:link controller="product" action="list"><img
                                src="images/products.png"/><span><g:message
                                code="product.label"
                                default="Products"/></span></g:link></li>
                </sec:ifAnyGranted>
                <sec:ifAllGranted roles="${RoleHelper.ROLE_PRICE_ADMIN}">
                    <li>
                        <g:link controller="discount" action="list"><img
                                src="images/discount.png"/><span><g:message
                                code="discount"
                                default="Discount"/></span></g:link></li>
                </sec:ifAllGranted>
            </ul>
        </sec:ifAnyGranted>
        <sec:ifAllGranted roles="${RoleHelper.ROLE_USER_ADMIN}">
            <h3>
                <g:message code="navigation.manage.settings" default="Settings"/>
            </h3>
            <ul>
                <li>
                    <g:link controller="user" action="list"><img
                            src="images/users.png"/><span><g:message
                            code="navigation.manage.users"
                            default="Users"/></span></g:link></li>
                <li>
                    <g:link controller="slide" action="list"><img
                            src="images/slideshow.png"/><span><g:message
                            code="navigation.manage.slideshow"
                            default="Users"/></span></g:link></li>
                <li>
                    <g:link controller="province" action="list"><img
                            src="images/globe.png"/><span><g:message
                            code="navigation.manage.province"
                            default="Province"/></span></g:link></li>
                <li>
                    <g:link controller="pageDetails" action="list"><img
                            src="images/pageDetails.png"/><span><g:message
                            code="pageDetails.label"
                            default="Page Details"/></span></g:link></li>
            </ul>
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="${RoleHelper.ROLE_USER_ADMIN}">
            <h3>
                <g:message code="navigation.manage.accounting" default="Settings"/>
            </h3>
            <ul>
                <li>
                    <g:link controller="account" action="list"><img
                            src="images/bank-account.png"/><span><g:message
                            code="navigation.manage.bankAccount"
                            default="Users"/></span></g:link></li>
                <li>
                    <g:link controller="paymentRequest" action="list"><img
                            src="images/waitingPaymentRequests.png"/><span><g:message
                            code="navigation.manage.waitingPaymentRequests"
                            default="Users"/></span></g:link></li>
            </ul>
        </sec:ifAllGranted>

    </li>
</ul><!-- end #nav -->
</body>
</html>
