<html>
<head>
    <meta name='layout' content='site'/>
    <title><g:message code="password.change.label"/></title>
    <style type='text/css' media='screen'>
    #changePasseord {
        margin: 15px 0px;
        padding: 0px;
        text-align: center;
    }

    #changePasseord .inner {
        width: 250px;
        margin: 40px auto;
        text-align: right;
        border: 1px solid #dddddd;
        background-color: #fafafa;
        border-radius: 5px;
        padding: 5px;
    }

    #changePasseord .inner .fheader {
        padding: 5px;
        background-color: #f0f0f0;
        margin: 0px 0 0px 0;
        color: #2e3741;
        font-size: 11px;
        border-radius: 5px;
        margin-bottom: 5px;
    }

    #changePasseord .inner .cssform p {
        clear: right;
        margin: 0;
        padding: 5px;
        padding-right: 10px;
    }

    #changePasseord .inner .cssform input[type='text'],#changePasseord .inner .cssform input[type='password'] {
        width: 217px;
        margin-bottom: 0;
    }

    #changePasseord .inner .cssform label {
        /*float: right;*/
        text-align: right;
        width: 110px;
        padding-bottom: 3px;
    }

    #changePasseord #remember_me_holder {
    }

    #changePasseord #submit {
        margin-right: 15px;
    }

    #changePasseord #remember_me_holder label {
        float: none;
        margin-right: 0;
        text-align: right;
        width: 150px;
        display: inline-block;
        padding-bottom: 0;
    }

    #changePasseord .inner .changePasseord_message {
        padding: 6px 25px 20px 25px;
        color: #c33;
    }

    #changePasseord .inner .text_ {
        width: 160px;
    }

    #changePasseord .inner .chk {
        height: 12px;
    }

    #changePasseord .toolbar {
        text-align: left;
    }

    #changePasseord input[type='submit'] {
        margin-left: 5px;
    }

    #changePasseord form {
        margin:0;
    }
    </style>
</head>

<body>
<div id='changePasseord'>
    <div class='inner'>
        <div class='fheader'><g:message code="password.change.label"/></div>

        <g:if test='${flash.message}'>
            <div class='changePasseord_message'>${flash.message}</div>
        </g:if>

        <g:form controller="customer" action='saveNewPassword' method='POST' name='changePasseordForm' id='changePasseordForm' class='cssform' autocomplete='off'>
            <p>
                <label for='oldPassword'><g:message code="password.old.label"/>:</label>
                <input type='password' class='text_' name='oldPassword' id='oldPassword'/>
            </p>

            <p>
                <label for='newPassword'><g:message code="password.new.label"/>:</label>
                <input type='password' class='text_' name='newPassword' id='newPassword'/>
            </p>

            <p>
                <label for='confirmPassword'><g:message code="password.new.confirm.label"/>:</label>
                <input type='password' class='text_' name='confirmPassword' id='confirmPassword'/>
            </p>

            <p class="toolbar">
                <input type='submit' id="submit" class="btn btn-primary" width="80px" value='${message(code: "password.change.label")}'/>
            </p>
            <div class="clearfix"></div>
        </g:form>
    </div>
</div>
<script type='text/javascript'>
    <!--
    (function() {
        document.forms['changePasseordForm'].elements['oldPassword'].focus();
    })();
    // -->
</script>
</body>
</html>