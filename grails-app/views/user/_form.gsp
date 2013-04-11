<%@ page import="eshop.Role; eshop.User" %>



<g:hasErrors bean="${userInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${userInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${userInstance?.id}" />
<g:hiddenField name="version" value="${userInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="password" type="password" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${userInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${userInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain">
    <label for="authorities">
        <g:message code="user.roles.label" default="Roles" />
    </label>
    <rg:checkBoxList translate="true" from="${Role.findAll()}" optionKey="id" name="authorities" value="${userInstance?.authorities.collect {it.id}}" />
</div>

%{--<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">--}%
	%{--<label for="accountExpired">--}%
		%{--<g:message code="user.accountExpired.label" default="Account Expired" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">--}%
	%{--<label for="accountLocked">--}%
		%{--<g:message code="user.accountLocked.label" default="Account Locked" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />--}%
%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />
</div>

%{--<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">--}%
	%{--<label for="passwordExpired">--}%
		%{--<g:message code="user.passwordExpired.label" default="Password Expired" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />--}%
%{--</div>--}%

