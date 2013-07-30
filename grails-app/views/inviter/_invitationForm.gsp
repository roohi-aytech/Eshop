<g:form name="inviteForm" action="sendInvites" controller="inviter">
	<g:hiddenField name="provider" value="${provider}"/>
	<g:hiddenField name="addresses" value=""/>
    <g:hiddenField name="names" value=""/>
	<g:hiddenField name="link" value="${ link }"/>
	<g:hiddenField name="subject" value="${ subject }"/>
	<g:hiddenField name="description" value="${ description }"/>
	<g:hiddenField name="caption" value="${caption}"/>
	<g:hiddenField name="source" value="${source}"/>
	<g:hiddenField name="picture" value="${picture}"/>
	<g:hiddenField name="redirectUrl" value="${redirectUrl}"/>

	<g:if test="${canEditMessage}">
		<g:textArea name="message" value="${message}"/><br/>
	</g:if>
	<g:else>
		<g:hiddenField name="message" value="${message}"/>
	</g:else>

	<g:submitButton id="inviter-invite-button" name="invite" value="${g.message(code: 'grails.plugin.inviter.invitationForm.submit')}" class="btn btn-primary"></g:submitButton>
</g:form>