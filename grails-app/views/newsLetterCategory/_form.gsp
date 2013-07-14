<%@ page import="eshop.NewsLetterCategory" %>

<g:hasErrors bean="${newsLetterCategoryInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${newsLetterCategoryInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${newsLetterCategoryInstance?.id}" />
<g:hiddenField name="version" value="${newsLetterCategoryInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: newsLetterCategoryInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="newsLetterCategory.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${newsLetterCategoryInstance?.name}" class="count-words" size="35"/>
</div>


