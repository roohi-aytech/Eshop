<%@ page import="eshop.PaymentRequest" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'paymentRequest.label', default: 'PaymentRequest')}"/>
    <title><g:message code="paymentRequest.responses.label"></g:message></title>
</head>

<body>
<a href="#show-paymentRequest" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                     default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<h2><g:message code="paymentRequest.responses.label"></g:message></h2>

<div id="show-paymentRequest" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list paymentRequest">

        <g:if test="${paymentRequestInstance?.owner}">
            <li class="fieldcontain">
                <span id="owner-label" class="property-label"><g:message code="paymentRequest.owner.label"
                                                                         default="Owner"/></span>

                <span class="property-value" aria-labelledby="owner-label"><g:link controller="customer" action="show"
                                                                                   id="${paymentRequestInstance?.owner?.id}">${paymentRequestInstance?.owner?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${paymentRequestInstance?.account}">
            <li class="fieldcontain">
                <span id="account-label" class="property-label"><g:message code="paymentRequest.account.label"
                                                                           default="Account"/></span>

                <span class="property-value" aria-labelledby="account-label"><g:link controller="account" action="show"
                                                                                     id="${paymentRequestInstance?.account?.id}">${paymentRequestInstance?.account?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${paymentRequestInstance?.value}">
            <li class="fieldcontain">
                <span id="value-label" class="property-label"><g:message code="paymentRequest.value.label"
                                                                         default="Value"/></span>

                <span class="property-value" aria-labelledby="value-label"><g:fieldValue
                        bean="${paymentRequestInstance}" field="value"/></span>

            </li>
        </g:if>

        <g:if test="${paymentRequestInstance?.trackingCode}">
            <li class="fieldcontain">
                <span id="trackingCode-label" class="property-label"><g:message code="paymentRequest.trackingCode.label"
                                                                                default="Tracking Code"/></span>

                <span class="property-value" aria-labelledby="trackingCode-label"><g:fieldValue
                        bean="${paymentRequestInstance}" field="trackingCode"/></span>

            </li>
        </g:if>

        <g:if test="${paymentRequestInstance?.creationDate}">
            <li class="fieldcontain">
                <span id="creationDate-label" class="property-label"><g:message code="paymentRequest.creationDate.label"
                                                                                default="Creation Date"/></span>

                <span class="property-value" aria-labelledby="creationDate-label"><rg:formatJalaliDate hm="true"
                                                                                                       date="${paymentRequestInstance?.creationDate}"/></span>

            </li>
        </g:if>

        <li class="fieldcontain">
            <span id="approved-label" class="property-label"><g:message code="paymentRequest.status"/></span>

            <span class="property-value" aria-labelledby="approved-label">
                <g:if test="${paymentRequestInstance?.responses}">
                    <g:if test="${paymentRequestInstance?.approved}">
                        <g:message code="paymentRequest.status.approved"></g:message>
                    </g:if>
                    <g:else>
                        <g:message code="paymentRequest.status.rejected"></g:message>
                    </g:else>
                </g:if>
                <g:else>
                    <g:message code="paymentRequest.status.waiting"></g:message>
                </g:else>
            </span>

        </li>

    </ol>

    <g:render template="../paymentResponse/list"></g:render>
    <g:if test="${!paymentRequestInstance?.responses || !paymentRequestInstance?.approved}">
        <br/>
        <br/>
        <g:render template="../paymentResponse/form"></g:render>
    </g:if>
</div>
</body>
</html>
