

<div id="edit-personalEvent" class="content scaffold-edit" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${personalEventInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${personalEventInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form method="post">
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons" style="margin-top:10px;">
            <g:actionSubmit class="save btn btn-success" action="save"
                            value="${message(code: 'default.button.create.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>
