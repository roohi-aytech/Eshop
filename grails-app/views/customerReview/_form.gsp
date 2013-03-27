<%@ page import="eshop.CustomerReview" %>

<g:hasErrors bean="${customerReviewInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${customerReviewInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${customerReviewInstance?.id}" />
<g:hiddenField name="version" value="${customerReviewInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: customerReviewInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="customerReview.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${eshop.Product.list()}" optionKey="id" required="" value="${customerReviewInstance?.product?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerReviewInstance, field: 'rate', 'error')} required">
	<label for="rate">
		<g:message code="customerReview.rate.label" default="Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="rate" from="${customerReviewInstance.constraints.rate.inList}" required="" value="${fieldValue(bean: customerReviewInstance, field: 'rate')}" valueMessagePrefix="customerReview.rate"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerReviewInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="customerReview.title.label" default="Title" />
		
	</label>
	<g:textField name="title" maxlength="128" value="${customerReviewInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerReviewInstance, field: 'body', 'error')} ">
	<label for="body">
		<g:message code="customerReview.body.label" default="Body" />
		
	</label>
	<g:textArea name="body" cols="40" rows="5" maxlength="2048" value="${customerReviewInstance?.body}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerReviewInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate">
		<g:message code="customerReview.creationDate.label" default="Creation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day"  value="${customerReviewInstance?.creationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: customerReviewInstance, field: 'lastUpdate', 'error')} required">
	<label for="lastUpdate">
		<g:message code="customerReview.lastUpdate.label" default="Last Update" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lastUpdate" precision="day"  value="${customerReviewInstance?.lastUpdate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: customerReviewInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="customerReview.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${eshop.User.list()}" optionKey="id" required="" value="${customerReviewInstance?.user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerReviewInstance, field: 'customerReviewRates', 'error')} ">
	<label for="customerReviewRates">
		<g:message code="customerReview.customerReviewRates.label" default="Customer Review Rates" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${customerReviewInstance?.customerReviewRates?}" var="c">
    <li><g:link controller="customerReviewRate" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="customerReviewRate" action="create" params="['customerReview.id': customerReviewInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'customerReviewRate.label', default: 'CustomerReviewRate')])}</g:link>
</li>
</ul>

</div>

