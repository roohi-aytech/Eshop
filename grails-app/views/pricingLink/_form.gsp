<%@ page import="org.springframework.validation.FieldError; org.grails.plugin.resource.ResourceProcessor; eshop.AddedValue" %>

<g:hasErrors bean="${link}">
    <ul class="errors" role="alert">
        <g:eachError bean="${link}" var="error">
            <li <g:if test="${error in FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${link?.id}"/>
<g:hiddenField name="version" value="${link?.version}"/>
<g:hiddenField name="productId" value="${productId}"/>

<div class="fieldcontain ${hasErrors(bean: link, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="pricingLink.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${link?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: link, field: 'url', 'error')} ">
    <label for="url">
        <g:message code="pricingLink.url.label" default="Name"/>

    </label>
    <g:textField name="url" value="${link?.url}"/>
</div>