<%@ page import="eshop.PaymentRequest" %>

<g:hasErrors bean="${paymentRequestInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${paymentRequestInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${paymentRequestInstance?.id}"/>
<g:hiddenField name="version" value="${paymentRequestInstance?.version}"/>


<div class="fieldcontain ${hasErrors(bean: paymentRequestInstance, field: 'owner', 'error')} required">
    <label for="owner">
        <g:message code="paymentRequest.owner.label" default="Owner"/>
        <span class="required-indicator"></span>
    </label>
    <g:select style="display:none" id="owner" name="owner.id" from="${eshop.Customer.list()}" optionKey="id" required=""
              value="${paymentRequestInstance?.owner?.id}" class="many-to-one"/>
    <b>${paymentRequestInstance?.owner}</b>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentRequestInstance, field: 'creationDate', 'error')} required">
    <label for="creationDate">
        <g:message code="paymentRequest.creationDate.label" default="Creation Date"/>
        <span class="required-indicator"></span>
    </label>
    <span style="display: none">
        <g:datePicker name="creationDate" precision="day" value="${paymentRequestInstance?.creationDate}"/>
    </span>
    <b><rg:formatJalaliDate date="${paymentRequestInstance?.creationDate}"></rg:formatJalaliDate> </b>

</div>

<div class="fieldcontain ${hasErrors(bean: paymentRequestInstance, field: 'account', 'error')} required">
    <label for="account">
        <g:message code="paymentRequest.account.label" default="Account"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="account" name="account.id" from="${eshop.accounting.Account.list()}" optionKey="id" required=""
              value="${paymentRequestInstance?.account?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentRequestInstance, field: 'value', 'error')} required">
    <label for="value">
        <g:message code="paymentRequest.value.label" default="Value"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="value" required="" value="${paymentRequestInstance.value}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentRequestInstance, field: 'trackingCode', 'error')} ">
    <label for="trackingCode">
        <g:message code="paymentRequest.trackingCode.label" default="Tracking Code"/>

    </label>
    <g:textField name="trackingCode" value="${paymentRequestInstance?.trackingCode}"/>
</div>

<rg:compositeForm bean="${paymentRequestInstance}" property="responses"/>

<div class="fieldcontain ${hasErrors(bean: paymentRequestInstance, field: 'responses', 'error')} ">
    <label for="responses">
        <g:message code="paymentRequest.responses.label" default="Responses"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${paymentRequestInstance?.responses ?}" var="r">
            <li><g:link controller="paymentResponse" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="paymentResponse" action="create"
                    params="['paymentRequest.id': paymentRequestInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'paymentResponse.label', default: 'PaymentResponse')])}</g:link>
        </li>
    </ul>

</div>

