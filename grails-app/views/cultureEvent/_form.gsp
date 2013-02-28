<%@ page import="eshop.CultureEvent" %>

<g:hasErrors bean="${cultureEventInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${cultureEventInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${cultureEventInstance?.id}" />
<g:hiddenField name="version" value="${cultureEventInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: cultureEventInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="cultureEvent.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${cultureEventInstance?.title}"/>
</div>

