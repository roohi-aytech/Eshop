<%@ page import="eshop.VariationGroup" %>


<g:hiddenField name="id" value="${variationGroupInstance?.id}"/>
<g:hiddenField name="version" value="${variationGroupInstance?.version}" />
<div class="fieldcontain ${hasErrors(bean: variationGroupInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="variationGroup.name.label" default="Name" />

	</label>
	<g:textField name="name" value="${variationGroupInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: variationGroupInstance, field: 'representationType', 'error')} ">
	<label for="representationType">
		<g:message code="variationGroup.representationType.label" default="Representation Type" />

	</label>
	<g:select name="representationType" from="${variationGroupInstance.constraints.representationType.inList}" value="${variationGroupInstance?.representationType}" valueMessagePrefix="variationGroup.representationType" noSelection="['': '']"/>
</div>

<rg:compositeForm bean="${variationGroupInstance}" property="variationValues"/>