<html>
<head>
    <meta name='layout' content='site'/>
    <title><g:message code="springSecurity.login.title"/></title>
    <style type='text/css' media='screen'>
    #login {
        margin: 15px 0px;
        padding: 0px;
        text-align: center;
    }

    #login .inner {
        width: 250px;
        margin: 40px auto;
        text-align: right;
        border: 1px solid #dddddd;
        background-color: #fafafa;
        border-radius: 5px;
        padding: 5px;
    }

    #login .inner .fheader {
        padding: 5px;
        background-color: #f0f0f0;
        margin: 0px 0 0px 0;
        color: #2e3741;
        font-size: 11px;
        border-radius: 5px;
        margin-bottom: 5px;
    }

    #login .inner .cssform p {
        clear: right;
        margin: 0;
        padding: 5px;
        padding-right: 10px;
    }

    #login .inner .cssform input[type='text'], #login .inner .cssform input[type='password'] {
        width: 217px;
        margin-bottom: 0;
    }

    #login .inner .cssform label {
        /*float: right;*/
        text-align: right;
        width: 110px;
        padding-bottom: 3px;
    }

    #login #remember_me_holder {
    }

    #login #submit {
        margin-right: 15px;
    }

    #login #remember_me_holder label {
        float: none;
        margin-right: 0;
        text-align: right;
        width: 150px;
        display: inline-block;
        padding-bottom: 0;
    }

    #login .inner .login_message {
        padding: 6px 25px 20px 25px;
        color: #c33;
    }

    #login .inner .text_ {
        width: 160px;
    }

    #login .inner .chk {
        height: 12px;
    }

    #login .toolbar {
        text-align: left;
    }

    #login input[type='submit'] {
        margin-left: 5px;
    }

    #login form {
        margin: 0;
    }
    </style>
</head>

<body>
<div id='login'>
    <div class='inner'>
        <div class='fheader'><g:message code="springSecurity.login.header"/></div>

        <g:if test='${flash.message}'>
            <div class='login_message'>${flash.message}</div>
        </g:if>

        <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
            <p>
                <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
                <input type='text' class='text_' name='j_username' id='username'/>
            </p>

            <p>
                <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
                <input type='password' class='text_' name='j_password' id='password'/>
            </p>

            <p id="remember_me_holder">
                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
                       <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
            </p>

            <p class="toolbar">

            <div style="float: right;padding-right: 10px;">
                <common:registerLink></common:registerLink>
                <br/>
                <common:link controller='customer' action='forgetPassword' https="true">
                    <g:message code="forgetPassword"/>
                </common:link>
            </div>

            <div style="float: left;padding-left:5px;">
                <input type='submit' id="submit" class="btn btn-primary" width="80px"
                       value='${message(code: "login")}'/>
            </div>
        </p>
        </form>
    </div>
</div>
<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>
