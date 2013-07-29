<%@ page import="eshop.Relationship" %>

<g:hasErrors bean="${relationshipInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${relationshipInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${relationshipInstance?.id}"/>
<g:hiddenField name="version" value="${relationshipInstance?.version}"/>


<div class="fieldcontain ${hasErrors(bean: relationshipInstance, field: 'title', 'error')} ">
    <label for="title">
        <g:message code="relationship.title.label" default="Title"/>

    </label>
    <g:textField name="title" value="${relationshipInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relationshipInstance, field: 'sex', 'error')} ">
    <label for="sex">
        <g:message code="relationship.sex.label" default="Sex"/>

    </label>
    <g:select name="sex" from="${relationshipInstance.constraints.sex.inList}" value="${relationshipInstance?.sex}"
              valueMessagePrefix="relationship.sex" noSelection="['': '']"/>
</div>

