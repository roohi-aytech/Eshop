<html>
<head>
    <meta name='layout' content='mobile'/>
    <title><g:message code="forgetPassword.title"/></title>
    <link rel="stylesheet" href="${resource(dir:'css/mobile', file: 'checkout.css')}"/>
</head>

<body>

<div id="checkout">
    <div id="sign-in">
        <div id="pay-methods">
            <h2 class="right"><g:message code="forgetPassword.mobileTitle"/></h2>

            <div class="clear"></div>
        </div>
        <div style="display:block" id="forget_password">
            <form method="post" action="${createLink(controller: 'customer', action: 'sendPasswordResetMail')}" id="passwordRecovery" name="passwordRecovery">
                <label><g:message code="springSecurity.login.username.label"/></label>
                <input type="text" data-defplace="${message(code:'username.placeHolder')}" placeholder="${message(code:'username.placeHolder')}" value="" class="required emailvalid" name="username" autocomplete="off" id="username">
                <div class="validation_errors_block" style="display: none;"></div>
                <div id="forget_password_error" class="red">
                    <g:if test='${flash.message}'>
                        <div class='login_message' style="font-size:12px;padding-top:15px;">${flash.message}</div>
                    </g:if>
                </div>
                <input type="submit" value="${message(code: 'forgetPassword.sendMail')}" class="grn-btn">
            </form>
        </div>
    </div>
</div>

<script type='text/javascript'>
    <!--
    (function () {
        document.forms['passwordRecovery'].elements['username'].focus();
    })();
    // -->
</script>
</body>
</html>
