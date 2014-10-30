<%@ page import="eshop.Banner" %>
<g:hasErrors bean="${bannerInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${bannerInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${bannerInstance?.id}"/>
<g:hiddenField name="version" value="${bannerInstance?.version}"/>

<div class="fieldcontain ${hasErrors(bean: bannerInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="banner.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${bannerInstance?.name}" size="50"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bannerInstance, field: 'url', 'error')} ">
    <label for="url">
        <g:message code="banner.url.label" default="Url"/>

    </label>
    <g:textField name="url" value="${bannerInstance?.url}" size="50"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bannerInstance, field: 'position', 'error')} ">
    <label for="sortIndex">
        <g:message code="banner.position.label" default="position"/>

    </label>
    <g:select name="position" value="${bannerInstance?.position}"
              valueMessagePrefix="banner.position" from="${bannerInstance.constraints.position.inList}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bannerInstance, field: 'sortIndex', 'error')} ">
    <label for="sortIndex">
        <g:message code="banner.sortIndex.label" default="sortIndex"/>

    </label>
    <g:textField name="sortIndex" value="${bannerInstance?.sortIndex}" size="3"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bannerInstance, field: 'image', 'error')} required">
    <label for="image">
        <g:message code="banner.image.label" default="image"/>
    </label>
    <input type="file" id="image" name="image"/>
    <img src="<g:createLink controller="banner" action="getImage" params="${[id: bannerInstance?.id, size: 1024]}"/>"
         style="max-width: 100px"/>
</div>


