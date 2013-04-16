<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 4/14/13
  Time: 2:41 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="eshop.Producer" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'producer.label', default: 'Producer')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<h2><g:message code="default.show.label" args="[entityName]" /></h2>

<div id="show-producer" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list producer">
        %{--<tr class="prop">--}%
            %{--<td valign="top" class="name">Organizer:</td>--}%
            %{--<td valign="top" class="value">--}%
                %{--<g:link controller="tekUser" action="show"--}%
                        %{--id="${tekEventInstance?.organizer?.id}" >--}%
                    %{--${tekEventInstance?.organizer?.encodeAsHTML()}--}%
                %{--</g:link>--}%
            %{--</td>--}%
        %{--</tr>--}%

        <g:if test="${producerInstance?.producerType}">
            <li class="fieldcontain">
                <span id="producerType-label" class="property-label"><g:message code="producer.producerType.label" default="ProducerType" /></span>

                <span class="property-value" aria-labelledby="producerType-label">
                    <g:link controller="productType" action="show"
                    id="${producerInstance?.producerType?.id}" >
                    ${producerInstance?.producerType?.encodeAsHTML()}
                    </g:link>
                </span>
            </li>
        </g:if>

        <g:if test="${producerInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="producer.name.label" default="Name" /></span>

                <span class="property-value" aria-labelledby="name-label">
                    <g:fieldValue bean="${producerInstance}" field="name"/></span>
            </li>
        </g:if>

        <g:if test="${producerInstance?.address}">
            <li class="fieldcontain">
                <span id="address-label" class="property-label"><g:message code="producer.address.label" default="Address" /></span>

                <span class="property-value" aria-labelledby="address-label">
                    <g:fieldValue bean="${producerInstance}" field="address"/></span>
            </li>
        </g:if>
        <g:if test="${producerInstance?.phone}">
            <li class="fieldcontain">
                <span id="phone-label" class="property-label"><g:message code="producer.phone.label" default="Phone" /></span>

                <span class="property-value" aria-labelledby="phone-label">
                    <g:fieldValue bean="${producerInstance}" field="phone"/></span>
            </li>
        </g:if>
        <g:if test="${producerInstance?.fax}">
            <li class="fieldcontain">
                <span id="fax-label" class="property-label"><g:message code="producer.fax.label" default="Fax" /></span>

                <span class="property-value" aria-labelledby="phone-label">
                    <g:fieldValue bean="${producerInstance}" field="phone"/></span>
            </li>
        </g:if>

        <g:if test="${producerInstance?.delivery}">
            <li class="fieldcontain">
                <span id="delivery-label" class="property-label"><g:message code="producer.delivery.label" default="Delivery" /></span>

                <span class="property-value" aria-labelledby="delivery-label">
                    <g:fieldValue bean="${producerInstance}" field="delivery"/></span>
            </li>
        </g:if>

        <g:if test="${producerInstance?.producerStaffs}">
            <li class="fieldcontain">
                <span id="producerStaffs-label" class="property-label">
                    <g:message code="producer.producerStaffs.label" default="producerStaffs" />
                </span>

                <g:each in="${producerInstance.producerStaffs}" var="v">
                    <span class="property-value" aria-labelledby="producerStaffs-label">
                        <g:link controller="producerStaff" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>

</div>
</body>
</html>

%{--<tr class="prop">--}%
    %{--<td valign="top" class="name">producerStaffs:</td>--}%
    %{--<td valign="top" style="text-align:left;" class="value">--}%
        %{--<ul>--}%
            %{--<g:each var="v" in="${producerInstance.producerStaffs}">--}%
                %{--<li><g:link controller="producerStaff" action="show" id="${v.id}">--}%
                    %{--${v?.encodeAsHTML()}--}%
                %{--</g:link></li>--}%
            %{--</g:each>--}%
        %{--</ul>--}%
    %{--</td>--}%
%{--</tr>--}%


