<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 4/16/13
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="eshop.ProducerStaff" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'producerStaff.label', default: 'ProducerStaff')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<h2><g:message code="default.show.label" args="[entityName]" /></h2>

<div id="show-producerStaff" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list producerStaff">

        <g:if test="${producerStaffInstance?.role}">
            <li class="fieldcontain">
                <span id="role-label" class="property-label"><g:message code="producerStaff.role.label" default="Role" /></span>

                <span class="property-value" aria-labelledby="role-label">
                    <g:fieldValue bean="${producerStaffInstance}" field="role"/></span>

            </li>
        </g:if>

        <g:if test="${producerStaffInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="producerStaff.name.label" default="Name" /></span>

                <span class="property-value" aria-labelledby="name-label">
                    <g:fieldValue bean="${producerStaffInstance}" field="name"/></span>

            </li>
        </g:if>
        <g:if test="${producerStaffInstance?.lastName}">
            <li class="fieldcontain">
                <span id="lastName-label" class="property-label"><g:message code="producerStaff.lastName.label" default="LastName" /></span>

                <span class="property-value" aria-labelledby="lastName-label">
                    <g:fieldValue bean="${producerStaffInstance}" field="lastName"/></span>

            </li>
        </g:if>
        <g:if test="${producerStaffInstance?.phoneNumber}">
        <li class="fieldcontain">
            <span id="phoneNumber-label" class="property-label"><g:message code="producerStaff.phoneNumber.label" default="PhoneNumber" /></span>

            <span class="property-value" aria-labelledby="phoneNumber-label">
                <g:fieldValue bean="${producerStaffInstance}" field="phoneNumber"/></span>

        </li>
    </g:if>  <g:if test="${producerStaffInstance?.fax}">
        <li class="fieldcontain">
            <span id="fax-label" class="property-label"><g:message code="producerStaff.fax.label" default="fax" /></span>

            <span class="property-value" aria-labelledby="fax-label">
                <g:fieldValue bean="${producerStaffInstance}" field="fax"/></span>

        </li>
    </g:if>  <g:if test="${producerStaffInstance?.mobile}">
        <li class="fieldcontain">
            <span id="mobile-label" class="property-label"><g:message code="producerStaff.mobile.label" default="mobile" /></span>

            <span class="property-value" aria-labelledby="mobile-label">
                <g:fieldValue bean="${producerStaffInstance}" field="mobile"/></span>

        </li>
    </g:if>  <g:if test="${producerStaffInstance?.emailAddress}">
        <li class="fieldcontain">
            <span id="emailAddress-label" class="property-label"><g:message code="producerStaff.emailAddress.label" default="emailAddress" /></span>

            <span class="property-value" aria-labelledby="emailAddress-label">
                <g:fieldValue bean="${producerStaffInstance}" field="emailAddress"/></span>

        </li>

    </g:if>
         <g:if test="${producerStaffInstance?.secretary}">
        <li class="fieldcontain">
            <span id="secretary-label" class="property-label"><g:message code="producerStaff.secretary.label" default="secretary" /></span>

            <span class="property-value" aria-labelledby="secretary-label">
                <g:fieldValue bean="${producerStaffInstance}" field="secretary"/></span>

        </li>
    </g:if>

    </ol>

</div>
</body>
</html>
