<%@ page import="eshop.Testimonial" %>

<g:hasErrors bean="${testimonialInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${testimonialInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${testimonialInstance?.id}" />
<g:hiddenField name="version" value="${testimonialInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: testimonialInstance, field: 'writer', 'error')} required">
    <label for="writer">
        <g:message code="testimonial.writer.label" default="Writer" />
        <span class="required-indicator">*</span>
    </label>
    <g:select style="width: 450px;" id="writer" name="writer.id" from="${eshop.Customer.list()}" optionKey="id" required="" value="${testimonialInstance?.writer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testimonialInstance, field: 'writerInfo', 'error')} ">
    <label for="writerInfo">
        <g:message code="testimonial.writerInfo.label" default="Writer Info" />

    </label>
    <g:textField style="width:450px;" name="writerInfo" value="${testimonialInstance?.writerInfo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testimonialInstance, field: 'purchasedProduct', 'error')} ">
    <label for="purchasedProduct">
        <g:message code="testimonial.purchasedProduct.label" default="Purchased Product" />

    </label>
    <g:textField style="width:450px;" name="purchasedProduct" value="${testimonialInstance?.purchasedProduct}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: testimonialInstance, field: 'body', 'error')} ">
	<label for="body">
		<g:message code="testimonial.body.label" default="Body" />
		
	</label>
	<g:textArea style="width:450px;" name="body" cols="40" rows="5" maxlength="200000" value="${testimonialInstance?.body}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: testimonialInstance, field: 'approved', 'error')} ">
	<label for="approved">
		<g:message code="testimonial.approved.label" default="Approved" />
		
	</label>
	<g:checkBox name="approved" value="${testimonialInstance?.approved}" />
</div>
