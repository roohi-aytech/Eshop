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
    <g:textField name="name" value="${brandInstance?.name}" class="count-words" size="52"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brandInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="brand.description.label" default="Description"/>

    </label>
    <g:textArea cols="50" rows="5" name="description" value="${brandInstance?.description}" class="count-words"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brandInstance, field: 'pageTitle', 'error')} ">
    <label for="pageTitle">
        <g:message code="brand.pageTitle.label" default="Page Title"/>

    </label>
    <g:textField name="pageTitle" value="${brandInstance?.pageTitle}" class="count-words" size="52"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brandInstance, field: 'keywords', 'error')} ">
    <label for="keywords">
        <g:message code="brand.keywords.label" default="keywords"/>

    </label>
    <g:textArea rows="5" cols="50" name="keywords" value="${brandInstance?.keywords}" class="count-words"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brandInstance, field: 'searchKeys', 'error')} ">
    <label for="keywords">
        <g:message code="brand.searchKeys.label" default="searchKeys"/>

    </label>
    <g:textArea rows="5" cols="50" name="searchKeys" value="${brandInstance?.searchKeys}" class="count-words"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brandInstance, field: 'logo', 'error')} required">
    <label for="logo">
        <g:message code="brand.logo.label" default="Logo"/>
    </label>
    <input type="file" id="logo" name="logo" />
    <input type="hidden" name="imageDeleted" />
    <img id="img${brandInstance?.id}" src="<g:createLink controller="brand" action="getLogo" id="${brandInstance?.id}" params="[timestamp:System.currentTimeMillis()]"/>" style="max-width: 100px"/>
    <input type="button" onclick="$('[name=imageDeleted]').val('true');$('#img${brandInstance?.id}').remove()" value="<g:message code="delete" />">
</div>


