<%@ page import="eshop.NewsLetterInstance" %>

<g:hasErrors bean="${newsLetterInstanceInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${newsLetterInstanceInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${newsLetterInstanceInstance?.id}" />
<g:hiddenField name="version" value="${newsLetterInstanceInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: newsLetterInstanceInstance, field: 'startDate', 'error')} ">
	<label for="startDate">
		<g:message code="newsLetterInstance.startDate.label" default="Start Date" />
		
	</label>
	<g:datePicker name="startDate" precision="day"  value="${newsLetterInstanceInstance?.startDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: newsLetterInstanceInstance, field: 'finishDate', 'error')} ">
	<label for="finishDate">
		<g:message code="newsLetterInstance.finishDate.label" default="Finish Date" />
		
	</label>
	<g:datePicker name="finishDate" precision="day"  value="${newsLetterInstanceInstance?.finishDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: newsLetterInstanceInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="newsLetterInstance.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${newsLetterInstanceInstance.constraints.status.inList}" value="${newsLetterInstanceInstance?.status}" valueMessagePrefix="newsLetterInstance.status" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newsLetterInstanceInstance, field: 'logs', 'error')} ">
	<label for="logs">
		<g:message code="newsLetterInstance.logs.label" default="Logs" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${newsLetterInstanceInstance?.logs?}" var="l">
    <li><g:link controller="newsLetterLog" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="newsLetterLog" action="create" params="['newsLetterInstance.id': newsLetterInstanceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'newsLetterLog.label', default: 'NewsLetterLog')])}</g:link>
</li>
</ul>

</div>

