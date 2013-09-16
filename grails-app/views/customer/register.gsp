<html>
<head>
    <meta name='layout' content='site'/>
    <title><g:message code="register"/></title>
    <style type='text/css' media='screen'>
    #register {
        margin: 15px 0px;
        padding: 0px;
        text-align: center;
    }

    #register .inner {
        width: 395px;
        margin: 40px auto;
        text-align: right;
        border: 1px solid #dddddd;
        background-color: #fafafa;
        border-radius: 5px;
        padding: 5px;
    }

    #register .inner .fheader {
        padding: 5px;
        background-color: #f0f0f0;
        margin: 0px 0 0px 0;
        color: #2e3741;
        font-size: 11px;
        border-radius: 5px;
        margin-bottom: 5px;
    }

    #register .inner .cssform p {
        clear: right;
        margin: 0;
        padding: 5px;
        padding-right: 10px;
    }

    #register .inner .cssform input[type='text'], #register .inner .cssform input[type='password'], #register .inner .cssform textarea {
        width: 360px;
        margin-bottom: 0;
    }

    #register .inner .cssform label {
        /*float: right;*/
        text-align: right;
        padding-bottom: 3px;
        display: inline-block;
    }

    #register #remember_me_holder {
    }

    #register #submit {
        margin-right: 15px;
    }

    #register #remember_me_holder label {
        float: none;
        margin-right: 0;
        text-align: right;
        width: 150px;
        display: inline-block;
        padding-bottom: 0;
    }

    #register .inner .register_message {
        padding: 6px 25px 20px 25px;
        color: #c33;
    }

    #register .inner .text_ {
        width: 160px;
    }

    #register .inner .chk {
        height: 12px;
    }

    #register .toolbar {
        text-align: left;
    }

    #register input[type='submit'] {
        margin-left: 5px;
    }

    #register form {
        margin: 0;
        position: relative;
    }

    #register .column1 {
        display: inline-block;
        width: 250px;
        position: absolute;
        top: 0;
        right: 0;
    }

    #register .column2 {
        display: inline-block;
        width: 250px;
        position: absolute;
        top: 0;
        left: 0;
    }

    #register textarea {
        height: 83px;
    }

    select {
        display: block;
        width: 373px;
    }
    </style>
    <script language="javascript" type="text/javascript">

        function validateUsernameField(){
            $('#usernameValidationMessage').html('');

            var usernameField = $('#usernameField').val();

            if(usernameField.toLowerCase().indexOf('www.') != -1){
                $('#usernameValidationMessage').html('${message(code: 'springSecurity.register.username.invalid')}')
                return false;
            }

            var emailPattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
            if (!emailPattern.test(usernameField)) {
                $('#usernameValidationMessage').html('${message(code: 'springSecurity.register.username.invalid')}')
                return false;
            }

            $.ajax({
                type:"POST",
                url:"<g:createLink action="checkUserNameIsRepetitive"/>",
                data:{username: usernameField}
            }).done(function (response) {
                $('#usernameValidationMessage').html(response);
            });

            return true;
        }

        function validatePassword(){
            $('#passwordValidationMessage').html('');

            var password = $('#password').val();
            if(!password || password == '') {
                $('#passwordValidationMessage').html('${message(code: 'springSecurity.register.password.notEmpty')}')
                return false;
            }

            return true;
        }

        function validateConfirmPassword(){
            $('#confirmPasswordValidationMessage').html('');

            var password = $('#password').val();
            var confirmPassword = $('#confirmPassword').val();
            if(password != confirmPassword){
                $('#confirmPasswordValidationMessage').html('${message(code: 'springSecurity.register.password.notMatch')}')
                return false;
            }

            return true;
        }

        function validateLastName(){
            $('#lastNameValidationMessage').html('');

            var password = $('#lastName').val();
            if(!password || password == '') {
                $('#lastNameValidationMessage').html('${message(code: 'profile.lastName.notEmpty')}')
                return false;
            }
            return true;
        }

        function validate(){
            if(validateLastName() && validateUsernameField() && validatePassword() && validateConfirmPassword())
                return true;
            return false;
        }
    </script>
</head>

<body>
<div id='register'>
    <div class='inner'>
        <div class='fheader'><g:message code="springSecurity.register.header"/></div>

        <g:hasErrors bean="${customerInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${customerInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:hiddenField name="id" value="${customerInstance?.id}"/>
        <g:hiddenField name="version" value="${customerInstance?.version}"/>

        <g:form controller="customer" action='saveBasicInfo' method='POST' id='registerForm' name='registerForm'
                class='cssform'
                autocomplete='off'>
        %{--<div class="column1">--}%
            <p>
                <label for='firstName'><g:message code="springSecurity.register.firstName.label"/>:</label>
                <input type='text' class='text_' name='firstName' id='firstName'
                       value="${customerInstance.firstName}"/>
            </p>

            <p>
                <label for='lastName'><g:message code="springSecurity.register.lastName.label"/>:</label>
                <span id="lastNameValidationMessage"></span>
                <input type='text' onblur="validateLastName()" class='text_' name='lastName' id='lastName'
                       value="${customerInstance.lastName}"/>
            </p>

            <p>
                <label for='sex'><g:message code="springSecurity.register.sex.label"/>:</label>
                <span id="sexValidationMessage"></span>
                <select name="sex" id="sex" style="display: block">
                    <option value="female" ${customerInstance.sex == 'female' ? 'selected' : ''}><g:message
                            code="sex.female"></g:message></option>
                    <option value="male" ${customerInstance.sex == 'male' ? 'selected' : ''}><g:message
                            code="sex.male"></g:message></option>
                </select>
            </p>

            <p>
                <label for='usernameField'><g:message code="springSecurity.register.username.label"/>:</label>
                <span id="usernameValidationMessage"></span>
                <input type='text' onblur="validateUsernameField()" class='text_' name='username' id='usernameField'
                       value="${customerInstance.username}"/>
            </p>

            <p>
                <label for='password'><g:message code="springSecurity.register.password.label"/>:</label>
                <span id="passwordValidationMessage"></span>
                <input type='password' onblur="validatePassword()" class='text_' name='password' id='password'/>
            </p>

            <p>
                <label for='confirmPassword'><g:message
                        code="springSecurity.register.confirmPassword.label"/>:</label>
                <span id="confirmPasswordValidationMessage"></span>
                <input type='password' onblur="validateConfirmPassword()" class='text_' name='confirmPassword'
                       id='confirmPassword'/>
            </p>

            <p class="toolbar">
                <input type='submit' id="submit" onclick="return validate();" class="btn btn-primary" width="80px"
                       value='${message(code: "register")}'/>
            </p>
        </g:form>
    </div>
</div>
<script type='text/javascript'>
    <!--
    (function () {
        document.forms['registerForm'].elements['firstName'].focus();
    })();
    // -->
</script>
</body>
</html>
