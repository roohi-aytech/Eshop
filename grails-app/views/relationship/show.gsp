<%@ page import="eshop.Relationship" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'relationship.label', default: 'Relationship')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-relationship" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-relationship" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list relationship">

        <g:if test="${relationshipInstance?.title}">
            <li class="fieldcontain">
                <span id="title-label" class="property-label"><g:message code="relationship.title.label"
                                                                         default="Title"/></span>

                <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${relationshipInstance}"
                                                                                         field="title"/></span>

            </li>
        </g:if>

        <g:if test="${relationshipInstance?.sex}">
            <li class="fieldcontain">
                <span id="sex-label" class="property-label"><g:message code="relationship.sex.label"
                                                                       default="Sex"/></span>

                <span class="property-value" aria-labelledby="sex-label"><g:fieldValue bean="${relationshipInstance}"
                                                                                       field="sex"/></span>

            </li>
        </g:if>

        <g:if test="${relationshipInstance?.deleted}">
            <li class="fieldcontain">
                <span id="deleted-label" class="property-label"><g:message code="relationship.deleted.label"
                                                                           default="Deleted"/></span>

                <span class="property-value" aria-labelledby="deleted-label"><g:formatBoolean
                        boolean="${relationshipInstance?.deleted}"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${relationshipInstance?.id}"/>
            <g:link class="edit" action="edit" id="${relationshipInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
