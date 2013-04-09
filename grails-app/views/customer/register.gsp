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
        width: 505px;
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
        width: 217px;
        margin-bottom: 0;
    }

    #register .inner .cssform label {
        /*float: right;*/
        text-align: right;
        width: 110px;
        padding-bottom: 3px;
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
        margin-top: 375px;
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
    </style>
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

        <g:form controller="customer" action='save' method='POST' id='registerForm' class='cssform' autocomplete='off'>
            <div class="column1">
                <p>
                    <label for='username'><g:message code="springSecurity.register.username.label"/>:</label>
                    <input type='text' class='text_' name='username' id='username' value="${customerInstance.username}"/>
                </p>

                <p>
                    <label for='password'><g:message code="springSecurity.register.password.label"/>:</label>
                    <input type='password' class='text_' name='password' id='password'/>
                </p>

                <p>
                    <label for='confirmPassword'><g:message
                            code="springSecurity.register.confirmPassword.label"/>:</label>
                    <input type='password' class='text_' name='confirmPassword' id='confirmPassword'/>
                </p>

                <p>
                    <label for='firstName'><g:message code="springSecurity.register.firstName.label"/>:</label>
                    <input type='text' class='text_' name='firstName' id='firstName'/>
                </p>

                <p>
                    <label for='lastName'><g:message code="springSecurity.register.lastName.label"/>:</label>
                    <input type='text' class='text_' name='lastName' id='lastName'/>
                </p>

                <p>
                    <label for='email'><g:message code="springSecurity.register.email.label"/>:</label>
                    <input type='text' class='text_' name='email' id='email'/>
                </p>
            </div>

            <div class="column2">
                <p>
                    <label for='mobile'><g:message code="springSecurity.register.mobile.label"/>:</label>
                    <input type='text' class='text_' name='mobile' id='mobile'/>
                </p>

                <p>
                    <label for='telephone'><g:message code="springSecurity.register.telephone.label"/>:</label>
                    <input type='text' class='text_' name='telephone' id='telephone'/>
                </p>

                <p>
                    <label for='sendingAddress'><g:message
                            code="springSecurity.register.sendingAddress.label"/>:</label>
                    <textarea type='text' class='text_' name='sendingAddress' id='sendingAddress'></textarea>
                </p>

                <p>
                    <label for='billingAddress'><g:message
                            code="springSecurity.register.billingAddress.label"/>:</label>
                    <textarea type='text' class='text_' name='billingAddress' id='billingAddress'></textarea>
                </p>
            </div>

            <p class="toolbar">
                <input type='submit' id="submit" class="btn btn-primary" width="80px"
                       value='${message(code: "register")}'/>
            </p>
        </g:form>
    </div>
</div>
<script type='text/javascript'>
    <!--
    (function () {
        document.forms['registerForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>
