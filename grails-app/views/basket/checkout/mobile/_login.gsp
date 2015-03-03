<div id="checkout">
    <div id="sign-in">
        <div id="pay-methods">
            <div id="login_portion">
                <h2 class="right"><g:message code="login.mobile.title"/></h2>


                <div class="left filter-link bbq" data-q="filters" id="div-filters">
                    <span onclick="switchToNoRegisterForm();return false;"><h4><g:message code="enquiry.request.shopping.noRegister"/><span><img
                            src="${resource(dir: 'images/mobile', file: 'filter-left-icon.png')}"></span></h4></span>
                </div>

                <div class="clear"></div>


                <form action='${createLink(uri:"/j_spring_security_check?forwardUri=${createLink(controller: 'basket', action: 'checkout')}")}' method='POST' id='loginForm' autocomplete='off'>
                    <input type="hidden" name="redirectURL" value="${params.redirectURL}"/>
                    <label><g:message code="springSecurity.login.username.label"/></label>
                    <input type="text" id="username" autocomplete="off" name="j_username" class="required emailvalid"
                           value=""
                           placeholder="${message(code: 'username.placeHolder')}"
                           data-defplace="${message(code: 'username.placeHolder')}"/>
                    <label><g:message code="springSecurity.login.password.label"/></label>
                    <input type="password" autocomplete="off" id="password" name="j_password" class="required" value=""
                           placeholder="${message(code: 'password.placeHolder')}"
                           data-defplace="${message(code: 'password.placeHolder')}"/>

                    <div class="clearfix"></div>
                    <g:if test='${flash.message}'>
                        <div class="validation_errors_block"><span>${flash.message}</span></div>
                    </g:if>
                    <input type='checkbox' class='chk' name='${rememberMeParameter}' style="display: none"
                           id='remember_me'
                           <g:if test='${hasCookie}'>checked='checked'</g:if>/>

                    <div class="red" id="login_error"></div>
                    <input type="submit" class="grn-btn" value="${message(code: 'login')}"/>
                </form>

                <h4 class="cntr">
                    <a class="gray bbq" href="${createLink(controller: 'customer', action: 'forgetPassword')}"
                       id="showPasswordRecovery">
                        <g:message code="forgetPassword"/>
                    </a>
                </h4>
                <span class="or">
                    <span><g:message code="or"/></span>
                </span>
                <a class="full cntr reg_cta" href="${createLink(controller: 'customer', action: 'register')}">
                    <g:message code="register"/>
                </a>
            </div>

        </div>
    </div>
</div>

<div id="filter_slide_panel">
    <div class="main-width">
        <div class="singlepage-title">
            <h2 class="right page-title"><span class="red"><g:message code="enquiry.request.shopping.noRegister"/></span></h2>
            <div class="left     go-back" data-q="filters-back" id="div-filters-back" onclick="closeNoRegisterForm();"><h4><g:message code="back"/></h4></div>
        </div>
        <g:render template="checkout/mobile/no_register"/>
    </div>
</div>

<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();

    function switchToNoRegisterForm(){

        $('#filter_slide_panel').show().animate({left:0},400);
        $('body,html').css('overflow','hidden');
    }

    function closeNoRegisterForm(){
        $('#filter_slide_panel').animate({left:'-100%'},400);
        var t = setTimeout(function(){
            $('body,html').css('overflow','auto');
            $('#filter_slide_panel').hide();
            clearTimeout(t);
        },400);
    }
    // -->
</script>
