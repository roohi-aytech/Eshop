<%@ page import="eshop.AddedValueType" %>

<g:hasErrors bean="${addedValueTypeInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${addedValueTypeInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${addedValueTypeInstance?.id}" />
<g:hiddenField name="version" value="${addedValueTypeInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: addedValueTypeInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="addedValueType.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${addedValueTypeInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addedValueTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="addedValueType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${addedValueTypeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addedValueTypeInstance, field: 'image', 'error')} ">
    <label for="image">
        <g:message code="addedValueType.image.label" default="Image" />
    </label>
    <input type="file" name="imageFile">
    <img src="${createLink(controller: 'image', params: [id: addedValueTypeInstance?.id, type: 'addedValueType',r:Math.random()])}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: addedValueTypeInstance, field: 'needDescription', 'error')} ">
	<label for="needDescription">
		<g:message code="addedValueType.needDescription.label" default="Need Description" />
		
	</label>
	<g:checkBox name="needDescription" value="${addedValueTypeInstance?.needDescription}" />
</div>

<div class="fieldcontain ${hasErrors(bean: addedValueTypeInstance, field: 'hasCustomImage', 'error')} ">
	<label for="hasCustomImage">
		<g:message code="addedValueType.hasCustomImage.label" default="Has Custom Image" />
		
	</label>
	<g:checkBox name="hasCustomImage" value="${addedValueTypeInstance?.hasCustomImage}" />
</div>

<div class="fieldcontain ${hasErrors(bean: addedValueTypeInstance, field: 'hasAddedValueCount', 'error')} ">
	<label for="hasAddedValueCount">
		<g:message code="addedValueType.hasAddedValueCount.label" default="Has Added Value Count" />
		
	</label>
	<g:checkBox name="hasAddedValueCount" value="${addedValueTypeInstance?.hasAddedValueCount}" />
</div>

<div class="fieldcontain ${hasErrors(bean: addedValueTypeInstance, field: 'defaultPrice', 'error')} ">
	<label for="defaultPrice">
		<g:message code="addedValueType.defaultPrice.label" default="Default Price" />
		
	</label>
	<g:field type="number" name="defaultPrice" step="any" value="${addedValueTypeInstance.defaultPrice}"/>
</div>

