<%@ page import="eshop.StaffRole" %>
<g:hasErrors bean="${staffRoleInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${staffRoleInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${staffRoleInstance?.id}" />
<g:hiddenField name="version" value="${staffRoleInstance?.version}" />

<div class="fieldcontain ${hasErrors(bean: staffRoleInstance, field: 'role', 'error')} ">
    <label for="role">
        <g:message code="staffRoleInstance.role.label" default="Role"/>

    </label>
    <g:textField name="role" value="${staffRoleInstance?.role}" class="count-words" size="52"/>
</div>



