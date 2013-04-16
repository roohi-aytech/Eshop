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

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'image1024', 'error')} required">
    <label for="image1024">
        <g:message code="slide.image1024.label" default="image1024"/>
    </label>
    <input type="file" id="image1024" name="image1024" />
    <img src="<g:createLink controller="slide" action="getImage" params="${[id:slideInstance?.id, size:1024]}"/>" style="max-width: 100px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'image1280', 'error')} required">
    <label for="image1280">
        <g:message code="slide.image1280.label" default="image1280"/>
    </label>
    <input type="file" id="image1280" name="image1280" />
    <img src="<g:createLink controller="slide" action="getImage" params="${[id:slideInstance?.id, size:1280]}"/>" style="max-width: 100px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'image1440', 'error')} required">
    <label for="image1440">
        <g:message code="slide.image1440.label" default="image1440"/>
    </label>
    <input type="file" id="image1440" name="image1440" />
    <img src="<g:createLink controller="slide" action="getImage" params="${[id:slideInstance?.id, size:1440]}"/>" style="max-width: 100px"/>
</div>


