<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 10/14/14
  Time: 1:33 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="contact.label"/></title>
    <script language="javascript" type="text/javascript">
        function validateForm() {
            $('.validator').css('display', 'none');
            var isValid = true;
            if ($('#firstName').val().trim() == '') {
                $('#firstNameValidator').css('display', 'inline-block');
                isValid = false;
            }
            if ($('#lastName').val().trim() == '') {
                $('#lastNameValidator').css('display', 'inline-block');
                isValid = false;
            }
            if ($('#email').val().trim() == '') {
                $('#emailValidator').css('display', 'inline-block');
                isValid = false;
            }
//            if ($('#phone').val().trim() == '') {
//                $('#phoneValidator').css('display', 'inline-block');
//                isValid = false;
//            }

            if ($('#body').val().trim() == '') {
                $('#bodyValidator').css('display', 'inline-block');
                isValid = false;
            }
            if ($('#captcha').val().trim() == '') {
                $('#captchaValidator').css('display', 'inline-block');
                isValid = false;
            }

            return isValid;
        }
    </script>
    <style>
    label {
        display: block !important;
    }
    </style>
</head>

<body>
<br/>
<hr/>
<div>

    <p>
    کاربر گرامی، ضمن سپاس از توجه شما به فروشگاه الکترونیکی گلدان، به اطلاع می رساند که این فروشگاه بر اساس درخواست و پیشنهاد شما عزیزان،
    همکاران بعدی (گل و شیرینی) خود را انتخاب مینماید.
    </p>
    <p>
    خواهشمند است در صورتی که تمایل دارید که کالای فروشگاه مورد علاقه شما در گلدان ارائه گردد، اطلاعات آن فروشگاه را از طریق این صفحه و
    یا شبکه های اجتماعی و حتی به صورت تلفنی با ما به اشتراک بگذارید
    </p>
</div>
<hr/>
<g:form controller="site" action="sendMailNewProducts">
    <div>

        <div>
            <label><g:message code="contactUs.email.firstName"/></label>
            <input type="text" name="firstName" id="firstName"/>
            <span class="validator" id="firstNameValidator"><g:message
                    code="contactUs.email.firstName.validation.label"></g:message></span>
        </div>

        <div>
            <label><g:message code="contactUs.email.lastName"/></label>
            <input type="text" name="lastName" id="lastName"/>
            <span class="validator" id="lastNameValidator"><g:message
                    code="contactUs.email.lastName.validation.label"></g:message></span>
        </div>

        <div>
            <label><g:message code="contactUs.email.email"/></label>
            <input type="text" name="email" id="email"/>
            <span class="validator" id="emailValidator"><g:message
                    code="contactUs.email.email.validation.label"></g:message></span>
        </div>

        <div>
            <label><g:message code="contactUs.email.phone"/></label>
            <input type="text" name="phone" id="phone"/>
            <span class="validator" id="phoneValidator"><g:message
                    code="contactUs.email.phone.validation.label"></g:message></span>
        </div>



        <div>
            <textarea type="text" name="body" id="body" cols="50" rows="5" style="width: auto"></textarea>
            <span class="validator" id="bodyValidator"><g:message
                    code="contactUs.email.body.validation.label"/></span>
        </div>

        <div>
            <img src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}"/>
            <label for="captcha">
                لطفاً متن داخل تصویر را وارد نمائید:
            </label>
            <g:textField name="captcha" id="captcha"/>
            <span class="validator" id="captchaValidator"><g:message
                    code="contactUs.email.captcha.validation.label"/></span>
        </div>

        <div>
            <input type="submit" onclick="return validateForm();"
                   value="${message(code: 'contactUs.email.send')}"
                   class="btn btn-primary"/>
        </div>
    </div>
</g:form>
</body>
</html>