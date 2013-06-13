<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 6/13/13
  Time: 12:32 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title><g:message code="contact.label"/></title>
    <g:javascript>
        function validateForm(){
            $('.validator').css('display', 'none');
            var isValid = true;
            if ($('#firstName').val().trim() == ''){
                $('#firstNameValidator').css('display', 'inline-block');
                isValid = false;
            }
            if ($('#lastName').val().trim() == ''){
                $('#lastNameValidator').css('display', 'inline-block');
                isValid = false;
            }

            if ($('#body').val().trim() == ''){
                $('#bodyValidator').css('display', 'inline-block');
                isValid = false;
            }
            if ($('#captcha').val().trim() == ''){
                $('#captchaValidator').css('display', 'inline-block');
                isValid = false;
            }

            return isValid;
        }
    </g:javascript>
</head>

<body>
<div class="page-content">
    <h2><g:message code="contact.label"></g:message></h2>

    <div>
        <div>
            شما می توانید از روش های زیر با ما تماس بگیرید
        </div>

        <div style="margin-top: 10px">
            تلفن تماس: 42328-021
        </div>
        <ul>
            <li>
                داخلی 1 – فروش
            </li>
            <li>
                داخلی 2 – پیگیری سفارشات
            </li>
            <li>
                داخلی 3 – تامین کنندگان و همکاران
            </li>
            <li>
                داخلی 4 – پشتیبانی سایت
            </li>
            <li>
                داخلی 5 – انتقادات و پیشنهادات
            </li>
            <li>
                داخلی 6 – فکس
            </li>
        </ul>

        <div>
            آدرس پستی: تهران – میدان آرژانتین - خیابان بخارست (احمد قصیر)، خیابان یازدهم، پلاک 1، واحد 6
            <br/>
            کدپستی: 1513755619
        </div>

        <div style="margin-top: 10px">
            شماره پیامک: 02142328
        </div>

        <div style="margin-top: 10px">
            ارتباط از طریق
            <a href="javascript:void(window.open('http://support.zanbil.ir/chat.php?acid=26617','','width=590,height=760,left=0,top=0,resizable=yes,menubar=no,location=no,status=yes,scrollbars=yes'))">پشتیبانی آنلاین</a>
        </div>

    </div>

    <g:form controller="site" action="sendMail">
        <div>
            <g:if test="${flash.message}">
                <div class="info">
                    <div>${flash.message}</div>
                </div>
            </g:if>

            <h3>
                <g:message code="contactUs.email.title"/>
            </h3>

            <div>
                <label><g:message code="contactUs.email.firstName"/></label>
                <input type="text" name="firstName" id="firstName"/>
                <span class="validator" id="firstNameValidator"><g:message code="contactUs.email.firstName.validation.label"></g:message></span>
            </div>

            <div>
                <label><g:message code="contactUs.email.lastName"/></label>
                <input type="text" name="lastName" id="lastName"/>
                <span class="validator" id="lastNameValidator"><g:message code="contactUs.email.lastName.validation.label"></g:message></span>
            </div>

            <div>
                <label><g:message code="contactUs.email.department"/></label>
                <select id="department" name="department">
                    <option value="sales@zanbil.ir">
                        فروش
                    </option>
                    <option value="order-tracking@zanbil.ir">
                        پیگیری سفارشات
                    </option>
                    <option value="suppliers@zanbil.ir">
                        تامین کنندگان و همکاران
                    </option>
                    <option value="web-support@zanbil.ir">
                        پشتیبانی سایت
                    </option>
                    <option value="feedback@zanbil.ir">
                        انتقادات و پیشنهادات
                    </option>
                </select>
            </div>

            <div>
                <textarea type="text" name="body" id="body" cols="50" rows="5" style="width: auto"></textarea>
                <span class="validator" id="bodyValidator"><g:message code="contactUs.email.body.validation.label"></g:message></span>
            </div>

            <div>
                <img src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}"/>
                <label for="captcha">
                    لطفاً متن داخل تصویر را وارد نمائید:
                </label>
                <g:textField name="captcha" id="captcha"/>
                <span class="validator" id="captchaValidator"><g:message code="contactUs.email.captcha.validation.label"></g:message></span>
            </div>

            <div>
                <input type="submit" onclick="return validateForm();" value="${message(code: 'contactUs.email.send')}" class="btn btn-primary"/>
            </div>
        </div>
    </g:form>
</div>
</body>
</html>