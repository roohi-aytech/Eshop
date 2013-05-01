<%@ page import="eshop.PaymentResponse" %>

<h2><g:message code="paymentResponse"></g:message></h2>
<g:form controller="paymentResponse" action="save">
    <fieldset class="form">
        <g:hasErrors bean="${paymentResponseInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${paymentResponseInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <g:hiddenField name="id" value="${paymentResponseInstance?.id}"/>
        <g:hiddenField name="version" value="${paymentResponseInstance?.version}"/>
        <g:hiddenField name="request.id" id="request" value="${params.id}"></g:hiddenField>


        <div class="fieldcontain ${hasErrors(bean: paymentResponseInstance, field: 'approved', 'error')} ">
            <g:checkBox name="approved" value="${paymentResponseInstance?.approved}"/>
            <label for="approved" style="display: inline">
                <g:message code="paymentResponse.approved.label" default="Approved"/>

            </label>
        </div>

        <div class="fieldcontain ${hasErrors(bean: paymentResponseInstance, field: 'description', 'error')} ">
            <label for="description">
                <g:message code="paymentResponse.description.label" default="Description"/>

            </label>
            <g:textArea name="description" cols="80" rows="5" maxlength="1024"
                        value="${paymentResponseInstance?.description}"/>
        </div>
    </fieldset>

    <fieldset class="buttons">
        <g:submitButton style="margin-top:0;" name="create" class="save"
                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
    </fieldset>
</g:form>


