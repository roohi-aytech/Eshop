<%@ page import="eshop.Guarantee" %>
<g:hasErrors bean="${guaranteeInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${guaranteeInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${guaranteeInstance?.id}" />
<g:hiddenField name="version" value="${guaranteeInstance?.version}" />
<div class="fieldcontain ${hasErrors(bean: guaranteeInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="Guarantee.name.label" default="Name"/>

    </label>
    <g:textField name="name" value=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: guaranteeInstance, field: 'period', 'error')} ">
    <label for="period">
        <g:message code="Guarantee.period.label" default="Period"/>
    </label>
    <g:field type="number" style="direction: ltr;" name="period" step="any" required=""
             value="${guaranteeInstance.period}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: guaranteeInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="Guarantee.description.label" default="Description"/>

    </label>
    <g:textArea cols="50" rows="5" name="description" value="${guaranteeInstance?.description}" class="count-words"/>
</div>


<div class="fieldcontain ${hasErrors(bean: guaranteeInstance, field: 'logo', 'error')} required">
    <label for="logo">
        <g:message code="Guarantee.logo.label" default="Logo"/>
    </label>
    <input type="file" id="logo" name="logo" />
    <img src="<g:createLink controller="Guarantee" action="getLogo" id="${guaranteeInstance?.id}"/>" style="max-width: 100px"/>
</div>


