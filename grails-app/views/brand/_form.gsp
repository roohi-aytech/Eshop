<%@ page import="eshop.Brand" %>
<g:hasErrors bean="${brandInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${brandInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${brandInstance?.id}" />
<g:hiddenField name="version" value="${brandInstance?.version}" />
<div class="fieldcontain ${hasErrors(bean: brandInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="brand.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${brandInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brandInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="brand.description.label" default="Description"/>

    </label>
    <g:textField name="description" value="${brandInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brandInstance, field: 'logo', 'error')} required">
    <label for="logo">
        <g:message code="brand.logo.label" default="Logo"/>
    </label>
    <input type="file" id="logo" name="logo" />
    <img src="<g:createLink controller="brand" action="getLogo" id="${brandInstance?.id}"/>" style="max-width: 100px"/>
</div>


