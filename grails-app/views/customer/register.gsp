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
        width: 250px;
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

    #register .inner .cssform input[type='text'],#register .inner .cssform input[type='password'] {
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
        margin-left: 5px;
    }

    #register form {
        margin:0;
    }
    </style>
</head>

<body>
<div id='register'>
    <div class='inner'>
        <div class='fheader'><g:message code="springSecurity.register.header"/></div>

        <g:if test='${flash.message}'>
            <div class='register_message'>${flash.message}</div>
        </g:if>

        <form action='${postUrl}' method='POST' id='registerForm' class='cssform' autocomplete='off'>
            <p>
                <label for='username'><g:message code="springSecurity.register.username.label"/>:</label>
                <input type='text' class='text_' name='j_username' id='username'/>
            </p>

            <p>
                <label for='password'><g:message code="springSecurity.register.password.label"/>:</label>
                <input type='password' class='text_' name='j_password' id='password'/>
            </p>

            <p id="remember_me_holder">
                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                <label for='remember_me'><g:message code="springSecurity.register.remember.me.label"/></label>
            </p>

            <p class="toolbar">
                <input type='submit' id="submit" class="btn btn-primary" width="80px" value='${message(code: "register")}'/>
            </p>
        </form>
    </div>
</div>
<script type='text/javascript'>
    <!--
    (function() {
        document.forms['registerForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>
