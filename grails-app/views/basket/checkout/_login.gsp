<script language="javascript" type="text/javascript">
    var customerLoginLinkHeight;
    function switchToNoRegisterForm() {
        $('#noRegisterLink').animate({
            opacity: 0
        }, 200, function () {
            $('#noRegisterLink').css('display', 'none');
            $('#loginLink').css('display', 'block').animate({
                opacity: 1
            }, 500);
        });
        $('#loginForm').animate({
            opacity: 0
        }, 200, function () {
            $('#loginForm').css('display', 'none');
            $('#noRegisterForm').css('display', 'block').animate({
                opacity: 1
            }, 500);
        });
    }

    function switchToLoginForm() {
        $('#loginLink').animate({
            opacity: 0
        }, 200, function () {
            $('#loginLink').css('display', 'none');
            $('#noRegisterLink').css('display', 'block').animate({
                opacity: 1
            }, 500);
        });
        $('#noRegisterForm').animate({
            opacity: 0
        }, 200, function () {
            $('#noRegisterForm').css('display', 'none');
            $('#loginForm').css('display', 'block').animate({
                opacity: 1
            }, 500);
        });
    }
</script>
<g:if test="${!customer}">
    <table class="table-simulated">
        <tr>
            <td style="padding-left:15px;min-width: 160px;">
                <div id="loginForm"
                     style="${session.checkout_customerInformation ? 'display:none;opacity:0;' : 'display:block;opacity:1;'}">
                    <form action='/j_spring_security_check' method='POST' class='cssform' autocomplete='off'>
                        <p>
                            <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
                            <input type='text' class='text_' name='j_username' id='username' style="display: block"/>
                        </p>

                        <p>
                            <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
                            <input type='password' class='text_' name='j_password' id='password'
                                   style="display: block"/>
                        </p>

                        <p id="remember_me_holder">
                            <input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'
                                   checked='checked' style="margin-top: 0"/>
                            <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
                        </p>

                        <p class="toolbar">

                        <div style="float: right;padding-right: 10px;">
                            <a href="${createLink(controller: 'customer', action: 'forgetPassword')}"
                               style="margin-top:5px;display: inline-block">
                                <g:message code="forgetPassword"/>
                            </a>
                        </div>

                        <div style="float: left;">
                            <input type='submit' id="submit" class="btn btn-primary" width="80px"
                                   value='${message(code: "login")}' style="height:30px;"/>
                        </div>
                    </form>
                </div>

                <div id="noRegisterForm"
                     style="${session.checkout_customerInformation ? 'display:block;opacity:1;' : 'display:none;opacity:0;'}">
                    <g:render template="checkout/no_register"/>
                </div>
            </td>
            <td style="border-right: 1px dashed #eeeeee;vertical-align: top;padding-right:15px;min-width: 160px;">
                <h2><g:message code=""/></h2>

                <p><g:message code="enquiry.request.register.description"/></p>
                <common:registerLink class="btn btn-success"/>
                <hr style="margin-bottom: 12px"/>

                <div id="loginLink"
                     style="${session.checkout_customerInformation ? 'display:block;opacity:1;' : 'display:none;opacity:0;'}">
                    <p><g:message code="enquiry.request.shopping.login.description"/></p>
                    <a class="btn btn-primary" onclick="switchToLoginForm();"><g:message
                            code="enquiry.request.shopping.login"/></a>
                </div>

                <div id="noRegisterLink"
                     style="${session.checkout_customerInformation ? 'display:none;opacity:0;' : 'display:block;opacity:1;'}">
                    <p><g:message code="enquiry.request.shopping.noRegister.description"/></p>
                    <a class=" btn btn-warning" onclick="switchToNoRegisterForm();"><g:message
                            code="enquiry.request.shopping.noRegister"/></a>
                </div>

            </td>
        </tr>
    </table>
</g:if>
<g:else>
    <p><g:message code="enquiry.request.shopping.loggedInUser"/></p>
    <b>${customer}</b> [${customer.email}]
</g:else>