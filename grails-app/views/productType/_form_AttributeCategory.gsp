<g:hasErrors bean="${attributeCategory}">
    <ul class="errors" role="alert">
        <g:eachError bean="${attributeCategory}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="productType.id" value="${attributeCategory?.productType?.id}" />
<g:hiddenField name="parentCategory.id" value="${attributeCategory?.parentCategory?.id}" />
<g:hiddenField name="id" value="${attributeCategory?.id}" />
<g:hiddenField name="version" value="${attributeCategory?.version}" />

<div class="fieldcontain ${hasErrors(bean: productTypeInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="attributeCategory.name.label" default="Name" />

    </label>
    <g:textField name="name" value="${attributeCategory?.name}"/>
</div>

