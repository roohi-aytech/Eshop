<%@ page import="eshop.Settlement" %>
<g:hasErrors bean="${settlementInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${settlementInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${settlementInstance?.id}" />
<g:hiddenField name="version" value="${settlementInstance?.version}" />

<div class="fieldcontain ${hasErrors(bean: settlementInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="settlementInstance.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${settlementInstance?.name}" class="count-words" size="52"/>
</div>



