<%@ page import="eshop.ProducerType" %>
<g:hasErrors bean="${producerTypeInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${producerTypeInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${producerTypeInstance?.id}" />
<g:hiddenField name="version" value="${producerTypeInstance?.version}" />
<div class="fieldcontain ${hasErrors(bean: producerTypeInstance, field: 'title', 'error')} ">
    <label for="title">
        <g:message code="producerType.title.label" default="Title"/>

    </label>
    <g:textField name="title" value="${producerTypeInstance?.title}" class="count-words" size="52"/>
</div>
