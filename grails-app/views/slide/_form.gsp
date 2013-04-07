<%@ page import="eshop.Slide" %>
<g:hasErrors bean="${slideInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${slideInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${slideInstance?.id}" />
<g:hiddenField name="version" value="${slideInstance?.version}" />

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="slide.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${slideInstance?.name}" class="count-words" size="52"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="slide.description.label" default="Description"/>

    </label>
    <g:textArea cols="50" rows="5" name="description" value="${slideInstance?.description}" class="count-words"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'url', 'error')} ">
    <label for="url">
        <g:message code="slide.url.label" default="Url"/>

    </label>
    <g:textField name="url" value="${slideInstance?.url}" class="count-words" size="50"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'image', 'error')} required">
    <label for="image">
        <g:message code="slide.image.label" default="Logo"/>
    </label>
    <input type="file" id="image" name="image" />
    <img src="<g:createLink controller="slide" action="getImage" id="${slideInstance?.id}"/>" style="max-width: 100px"/>
</div>


