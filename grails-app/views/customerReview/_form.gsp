<%@ page import="eshop.CustomerReview" %>

<h2><g:message code="customerReview.response.label"></g:message></h2>
<g:form controller="customerReview" action="investigate">
        <g:hasErrors bean="${customerReviewInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${customerReviewInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <g:hiddenField name="id" value="${customerReviewInstance?.id}"/>
        <g:hiddenField name="version" value="${customerReviewInstance?.version}"/>
        <g:hiddenField name="review.id" id="review" value="${params.id}"></g:hiddenField>


        <div class="fieldcontain ${hasErrors(bean: customerReviewInstance, field: 'status', 'error')} ">
            <label for="status" style="display: inline">
                <g:message code="customerReview.status" default="status"/>

            </label>:
            <g:select name="status"  from="${customerReviewInstance.constraints.status.inList}"
                      valueMessagePrefix="customerReview.status"
                      value="${customerReviewInstance?.status}"/>
        </div>

    <fieldset class="buttons">
        <g:submitButton style="margin-top:0;" name="create" class="save"
                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
    </fieldset>
</g:form>


