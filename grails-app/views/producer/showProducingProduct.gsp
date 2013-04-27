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
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<h2><g:message code="default.show.label" args="[entityName]" /></h2>

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

        <g:if test="${producingProductInstance?.paidOff}">
            <li class="fieldcontain">
                <span id="paidOff-label" class="property-label"><g:message code="producer.paidOff.label" default="PaidOff" /></span>

                <span class="property-value" aria-labelledby="paidOff-label">
                    <g:fieldValue bean="${producingProductInstance}" field="paidOff"/></span>
            </li>
        </g:if>

    </ol>

</div>
</body>
</html>
