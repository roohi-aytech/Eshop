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
    <meta name='layout' content='mobile'/>
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
<div class="page-content">
    <h2><g:message code="contact.label"></g:message></h2>

    <div class="page-content">
        <div>
            <div>
                شما می توانید از روش های زیر با ما تماس بگیرید
            </div>


            <g:if test="${flash.message}">
                <div class="info">
                    <div>${flash.message}</div>
                </div>
            </g:if>

            <div class="tabbable">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab1" data-toggle="tab">
                        تلفن تماس
                    </a></li>
                    <li><a href="#tab2" data-toggle="tab">
                        آدرس پستی
                    </a></li>
                    %{--<li><a href="#tab3" data-toggle="tab">--}%
                    %{--شماره پیامک--}%
                    %{--</a></li>--}%
                    <li><a href="#tab4" data-toggle="tab">
                        پشتیبانی آنلاین
                    </a></li>
                    <li><a href="#tab5" data-toggle="tab">
                        ایمیل
                    </a></li>
                    <li><a href="#tab6" data-toggle="tab">
                        مسئول وب سایت
                    </a></li>
                    <li><a href="#tab7" data-toggle="tab">
                        <g:message code="contactUs.email.title"/>
                    </a></li>
                </ul>

                <div class="tab-content">
                    <div id="tab1" class="tab-pane active">
                        021-88357438
                        %{--<ul>--}%
                        %{--<li>--}%
                        %{--داخلی 1 – فروش--}%
                        %{--</li>--}%
                        %{--<li>--}%
                        %{--داخلی 2 – پیگیری سفارشات--}%
                        %{--</li>--}%
                        %{--<li>--}%
                        %{--داخلی 3 – تامین کنندگان و همکاران--}%
                        %{--</li>--}%
                        %{--<li>--}%
                        %{--داخلی 4 – پشتیبانی سایت--}%
                        %{--</li>--}%
                        %{--<li>--}%
                        %{--داخلی 5 – انتقادات و پیشنهادات--}%
                        %{--</li>--}%
                        %{--<li>--}%
                        %{--داخلی 6 – فکس--}%
                        %{--</li>--}%
                        %{--</ul>--}%
                    </div>

                    <div id="tab2" class="tab-pane">
                        تهران - شیخ بهایی جنوبی - خیابان ۲۸ - پلاک ۳۸
                        <br/>
                        کد پستی: 1437746813
                        <br/><br/>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3238.3670911978943!2d51.39839878049639!3d35.741781072068605!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzXCsDQ0JzI3LjYiTiA1McKwMjMnNTIuOSJF!5e0!3m2!1sen!2sus!4v1403525481733"
                                width="600" height="450" frameborder="0" style="border:0"></iframe>
                    </div>

                    %{--<div id="tab3" class="tab-pane">--}%
                    %{--02142328--}%
                    %{--</div>--}%

                    <div id="tab4" class="tab-pane">
                        ارتباط از طریق
                        <a href="javascript:void(window.open('http://support.felfel.ir:81/chat.php?acid=26617','','width=590,height=760,left=0,top=0,resizable=yes,menubar=no,location=no,status=yes,scrollbars=yes'))">پشتیبانی آنلاین</a>
                    </div>

                    <div id="tab5" class="tab-pane">
                        info [at] felfel [dot] ir
                    </div>

                    <div id="tab6" class="tab-pane">
                        شهاب رستگار
                    </div>

                    <div id="tab7" class="tab-pane">
                        <g:form controller="site" action="sendMail">
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
                                    <label><g:message code="contactUs.email.department"/></label>
                                    <select id="department" name="department">
                                        <option value="sales@felfel.ir">
                                            فروش
                                        </option>
                                        <option value="tracking@felfel.ir">
                                            پیگیری سفارشات
                                        </option>
                                        <option value="suppliers@felfel.ir">
                                            تامین کنندگان و همکاران
                                        </option>
                                        <option value="support@felfel.ir">
                                            پشتیبانی سایت
                                        </option>
                                        <option value="feedback@felfel.ir">
                                            انتقادات و پیشنهادات
                                        </option>
                                    </select>
                                </div>

                                <div>
                                    <textarea type="text" name="body" id="body" cols="50" rows="5"
                                              style="width: auto"></textarea>
                                    <span class="validator" id="bodyValidator"><g:message
                                            code="contactUs.email.body.validation.label"></g:message></span>
                                </div>

                                <div>
                                    <img src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}"/>
                                    <label for="captcha">
                                        لطفاً متن داخل تصویر را وارد نمائید:
                                    </label>
                                    <g:textField name="captcha" id="captcha"/>
                                    <span class="validator" id="captchaValidator"><g:message
                                            code="contactUs.email.captcha.validation.label"></g:message></span>
                                </div>

                                <div>
                                    <input type="submit" onclick="return validateForm();"
                                           value="${message(code: 'contactUs.email.send')}"
                                           class="btn btn-primary"/>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>

            <div style="margin-top: 10px">

                <div style="margin-top: 10px">
                    <h3></h3></div>

                <div style="margin-top: 10px">
                    <h3></h3></div>

                <div style="margin-top: 10px">
                    <h3></h3></div>

                <div style="margin-top: 10px">
                    <h3></h3></div>

            </div>

        </div>
    </div>
</body>
</html>