<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 4/16/13
  Time: 12:25 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="eshop.ProducingProduct" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'producingProducts.label', default: 'ProducingProduct')}" />
    <title><g:message code="producer.show.label" args="[entityName]" /></title>
</head>
<body>
<h2><g:message code="producer.show.label" args="[entityName]" /></h2>

<div id="show-producingProduct" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list producingProduct">

        <g:if test="${producingProductInstance?.brand}">
            <li class="fieldcontain">
                <span id="brand-label" class="property-label"><g:message code="brand.label" default="Brand" /></span>

                <span class="property-value" aria-labelledby="brand-label">
                    <g:fieldValue bean="${producingProductInstance}" field="brand"/></span>
            </li>
        </g:if>

        <g:if test="${producingProductInstance?.discount}">
            <li class="fieldcontain">
                <span id="discount-label" class="property-label"><g:message code="discount.label" default="Discount" /></span>

                <span class="property-value" aria-labelledby="discount-label">
                    <g:fieldValue bean="${producingProductInstance}" field="discount"/></span>
            </li>
        </g:if>

        <g:if test="${producingProductInstance?.guarantee}">
            <li class="fieldcontain">
                <span id="guarantee-label" class="property-label"><g:message code="guarantee.label" default="guarantee" /></span>

                <span class="property-value" aria-labelledby="guarantee-label">
                    <g:fieldValue bean="${producingProductInstance}" field="guarantee"/></span>
            </li>
        </g:if>

        <g:if test="${producingProductInstance?.settlement}">
            <li class="fieldcontain">
                <span id="settlement-label" class="property-label"><g:message code="producingProduct.settlement.label" default="settlement" /></span>

                <span class="property-value" aria-labelledby="settlement-label">
                    <g:fieldValue bean="${producingProductInstance}" field="settlement"/></span>
            </li>
        </g:if>

    </ol>

</div>
</body>
</html>
