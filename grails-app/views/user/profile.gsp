<%@ page import="eshop.User" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="edit.profile.label"/></title>
</head>

<body>
<h2><g:message code="edit.profile.label"/></h2>
<g:form method="post">

    <g:hasErrors bean="${userInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${userInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <fieldset class="form">
        <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
            <label for="password1">
                <g:message code="user.password.label" default="Password"/>
            </label>
            <g:field name="password1" type="password" />
        </div>

        <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
            <label for="password2">
                <g:message code="user.password.label" default="Password"/>
            </label>
            <g:field name="password2" type="password" />
        </div>

        <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} ">
            <label for="firstName">
                <g:message code="user.firstName.label" default="First Name"/>

            </label>
            <g:textField name="firstName" value="${userInstance?.firstName}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} ">
            <label for="lastName">
                <g:message code="user.lastName.label" default="Last Name"/>

            </label>
            <g:textField name="lastName" value="${userInstance?.lastName}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
            <label for="email">
                <g:message code="user.email.label" default="Email"/>

            </label>
            <g:field type="email" name="email" value="${userInstance?.email}"/>
        </div>
    </fieldset>
    <fieldset class="buttons">
        <g:actionSubmit class="save" action="saveProfile"
                        value="${message(code: 'save', default: 'Save')}"/>
        <g:actionSubmit class="cancel" action="cancel"
                        value="${message(code: 'cancel', default: 'Cancel')}"/>
    </fieldset>
</g:form>

</body>
</html>