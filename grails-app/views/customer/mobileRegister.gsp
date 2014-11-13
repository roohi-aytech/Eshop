<html>
<head>
    <meta name='layout' content='mobile'/>
    <title><g:message code="register"/></title>

    <script language="javascript" type="text/javascript">

        function validateUsernameField() {
            $('#usernameValidationMessage').html('');

            var usernameField = $('#email').val();

            if (usernameField.toLowerCase().indexOf('www.') != -1) {
                $('#usernameValidationMessage').html('${message(code: 'springSecurity.register.username.invalid')}')
                return false;
            }

            var emailPattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
            if (!emailPattern.test(usernameField)) {
                $('#usernameValidationMessage').html('${message(code: 'springSecurity.register.username.invalid')}')
                return false;
            }

            $.ajax({
                type: "POST",
                url: "<g:createLink action="checkUserNameIsRepetitive"/>",
                data: {username: usernameField}
            }).done(function (response) {
                $('#usernameValidationMessage').html(response);
            });

            return true;
        }

        function validatePassword() {
            $('#passwordValidationMessage').html('');

            var password = $('#pwd').val();
            if (!password || password == '') {
                $('#passwordValidationMessage').html('${message(code: 'springSecurity.register.password.notEmpty')}')
                return false;
            }

            return true;
        }

        function validateConfirmPassword() {
            $('#confirmPasswordValidationMessage').html('');

            var password = $('#pwd').val();
            var confirmPassword = $('#con-pwd').val();
            if (password != confirmPassword) {
                $('#confirmPasswordValidationMessage').html('${message(code: 'springSecurity.register.password.notMatch')}')
                return false;
            }

            return true;
        }

        function validateLastName() {
            $('#lastNameValidationMessage').html('');

            var password = $('#last-name').val();
            if (!password || password == '') {
                $('#lastNameValidationMessage').html('${message(code: 'profile.lastName.notEmpty')}')
                return false;
            }
            return true;
        }

        function validateSex() {
            $('#sexValidationMessage').html('');

            var sex = $('#sex').val();
            if (!sex || sex == 'no') {
                $('#sexValidationMessage').html('${message(code: 'profile.sex.notEmpty')}')
                return false;
            }
            return true;
        }

        function validate() {
            if (validateLastName() && validateUsernameField() && validatePassword() && validateConfirmPassword())
                return true;
            return false;
        }
    </script>
</head>

<body>

<div id="pay-methods">
    <h2 class="right"><g:message code="springSecurity.register.mobileHeader"/></h2>
    <div class="clear"></div>
</div>

<div class="clear"></div>

<div class="shipping-form">
    <form name="new-register-form" id="new-ship-form" method="post"
          action="${createLink(controller: 'customer', action: 'saveBasicInfo')}" autocomplete='off'>
        <g:hiddenField name="id" value="${customerInstance?.id}"/>
        <g:hiddenField name="version" value="${customerInstance?.version}"/>
        <input type='hidden' name='csrf_token'
               value='7e3ad709a3cfdc4dd17dedb3ea0d4c2b67f69f11ada0efbb182426b91f6b798a'/>

        <div class="form_contianer">
            <div class="field-group1">
                <input type="text" name="firstName" id="first-name"
                       class="required firstName"
                       placeholder="<g:message code="springSecurity.register.firstName.label"/>"
                       data-defplace="<g:message code="springSecurity.register.firstName.label"/>"
                       value="${customerInstance.firstName}"/>
                <input type="text" name="lastName" id="last-name" class="required lastname"
                       placeholder="<g:message code="springSecurity.register.lastName.label"/>"
                       data-defplace="<g:message code="springSecurity.register.lastName.label"/>"
                       value="${customerInstance.lastName}" onblur="validateLastName()"/>
            </div>

            <div class="field-group1">
                <input type="text" autocomplete="off" name="username" id="email" class="required emailvalid"
                       placeholder="<g:message code="springSecurity.register.username.label"/>"
                       data-defplace="<g:message code="springSecurity.register.username.label"/>"
                       value="${customerInstance.email}" onblur="validateUsernameField()"/>
                <input type="number" autocomplete="off" name="mobile" id="phone" class="required  numb3rs numvalid"
                       maxlength="10" pattern="[0-9]*"
                       placeholder="<g:message code="springSecurity.register.mobile.mobileLabel"/>"
                       data-defplace="<g:message code="springSecurity.register.mobile.label"/>"
                       maxlength="10"
                       value="${customerInstance.mobile}"/>
            </div>

            <div class="field-group-pwd">
                <input type="password" autocomplete="off" name="password" id="pwd" class="required"
                       placeholder="<g:message code="springSecurity.register.password.label"/>"
                       data-defplace="<g:message code="springSecurity.register.password.label"/>" onblur="validatePassword()"/>
                <input type="password" autocomplete="off" name="password2" id="con-pwd" class="required"
                       placeholder="<g:message code="springSecurity.register.confirmPassword.label"/>"
                       data-defplace="<g:message code="springSecurity.register.confirmPassword.label"/>" onblur="validateConfirmPassword()"/>
            </div>

            <div class="field-group-radio">
                <div class="radio-box right">
                    <input id="radio-1" type="radio" name="gender" value="male" ${(!customerInstance || !customerInstance?.sex || customerInstance?.sex == 'male') ? "checked='true'" :''}/>
                    <label for="radio-1"><g:message code="sex.male"/></label>
                </div>

                <div class="radio-box">
                    <input id="radio-2" type="radio" name="gender" value="female" ${customerInstance?.sex == 'female' ? "checked='true'" :''}/>
                    <label for="radio-2"><g:message code="sex.female"/></label>
                </div>
            </div>
        </div>

        <div class="validation_errors_block form_error_main">
            <g:hasErrors bean="${customerInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${customerInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <span id="lastNameValidationMessage"></span>
            <span id="usernameValidationMessage"></span>
            <span id="passwordValidationMessage"></span>
            <span id="confirmPasswordValidationMessage"></span>
        </div>
        <input type="submit" id="register_submit" class="grn-btn full ship"
               value="${message(code: 'register.link')}" onclick="return validate();"/>
    </form>
</div>

<script type='text/javascript'>
    <!--
    (function () {
        document.forms['new-ship-form'].elements['firstName'].focus();
    })();
    // -->
</script>
</body>
</html>
