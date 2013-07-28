<%@ page import="eshop.PersonalEvent" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'personalEvent.label', default: 'PersonalEvent')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-personalEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                    default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-personalEvent" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list personalEvent">

        <g:if test="${personalEventInstance?.title}">
            <li class="fieldcontain">
                <span id="title-label" class="property-label"><g:message code="personalEvent.title.label"
                                                                         default="Title"/></span>

                <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${personalEventInstance}"
                                                                                         field="title"/></span>

            </li>
        </g:if>

        <g:if test="${personalEventInstance?.fullName}">
            <li class="fieldcontain">
                <span id="fullName-label" class="property-label"><g:message code="personalEvent.fullName.label"
                                                                            default="Full Name"/></span>

                <span class="property-value" aria-labelledby="fullName-label"><g:fieldValue
                        bean="${personalEventInstance}" field="fullName"/></span>

            </li>
        </g:if>

        <g:if test="${personalEventInstance?.relationship}">
            <li class="fieldcontain">
                <span id="relationship-label" class="property-label"><g:message code="personalEvent.relationship.label"
                                                                                default="Relationship"/></span>

                <span class="property-value" aria-labelledby="relationship-label"><g:link controller="relationship"
                                                                                          action="show"
                                                                                          id="${personalEventInstance?.relationship?.id}">${personalEventInstance?.relationship?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${personalEventInstance?.sex}">
            <li class="fieldcontain">
                <span id="sex-label" class="property-label"><g:message code="personalEvent.sex.label"
                                                                       default="Sex"/></span>

                <span class="property-value" aria-labelledby="sex-label"><g:fieldValue bean="${personalEventInstance}"
                                                                                       field="sex"/></span>

            </li>
        </g:if>

        <g:if test="${personalEventInstance?.date}">
            <li class="fieldcontain">
                <span id="date-label" class="property-label"><g:message code="personalEvent.date.label"
                                                                        default="Date"/></span>

                <span class="property-value" aria-labelledby="date-label"><g:formatDate
                        date="${personalEventInstance?.date}"/></span>

            </li>
        </g:if>

        <g:if test="${personalEventInstance?.jobTitle}">
            <li class="fieldcontain">
                <span id="jobTitle-label" class="property-label"><g:message code="personalEvent.jobTitle.label"
                                                                            default="Job Title"/></span>

                <span class="property-value" aria-labelledby="jobTitle-label"><g:fieldValue
                        bean="${personalEventInstance}" field="jobTitle"/></span>

            </li>
        </g:if>

        <g:if test="${personalEventInstance?.favoriteStyle}">
            <li class="fieldcontain">
                <span id="favoriteStyle-label" class="property-label"><g:message
                        code="personalEvent.favoriteStyle.label" default="Favorite Style"/></span>

                <span class="property-value" aria-labelledby="favoriteStyle-label"><g:fieldValue
                        bean="${personalEventInstance}" field="favoriteStyle"/></span>

            </li>
        </g:if>

        <g:if test="${personalEventInstance?.minPrice}">
            <li class="fieldcontain">
                <span id="minPrice-label" class="property-label"><g:message code="personalEvent.minPrice.label"
                                                                            default="Min Price"/></span>

                <span class="property-value" aria-labelledby="minPrice-label"><g:fieldValue
                        bean="${personalEventInstance}" field="minPrice"/></span>

            </li>
        </g:if>

        <g:if test="${personalEventInstance?.maxPrice}">
            <li class="fieldcontain">
                <span id="maxPrice-label" class="property-label"><g:message code="personalEvent.maxPrice.label"
                                                                            default="Max Price"/></span>

                <span class="property-value" aria-labelledby="maxPrice-label"><g:fieldValue
                        bean="${personalEventInstance}" field="maxPrice"/></span>

            </li>
        </g:if>

        <g:if test="${personalEventInstance?.customer}">
            <li class="fieldcontain">
                <span id="customer-label" class="property-label"><g:message code="personalEvent.customer.label"
                                                                            default="Customer"/></span>

                <span class="property-value" aria-labelledby="customer-label"><g:link controller="customer"
                                                                                      action="show"
                                                                                      id="${personalEventInstance?.customer?.id}">${personalEventInstance?.customer?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${personalEventInstance?.favoriteProductTypes}">
            <li class="fieldcontain">
                <span id="favoriteProductTypes-label" class="property-label"><g:message
                        code="personalEvent.favoriteProductTypes.label" default="Favorite Product Types"/></span>

                <g:each in="${personalEventInstance.favoriteProductTypes}" var="f">
                    <span class="property-value" aria-labelledby="favoriteProductTypes-label"><g:link
                            controller="productType" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${personalEventInstance?.id}"/>
            <g:link class="edit" action="edit" id="${personalEventInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
