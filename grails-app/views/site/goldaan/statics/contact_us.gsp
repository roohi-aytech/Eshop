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

    <div>
        <div>

            کاربر گرامی، همکاران ما منتظر پیشنهادات و انتقادات سازنده شما میباشند. نظر شما برای ما پر اهمیت بوده و در صورتی که امکانپذیر باشد حتما به آن عمل خواهیم نمود.
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
                %{--<li><a href="#tab4" data-toggle="tab">--}%
                    %{--پشتیبانی آنلاین--}%
                %{--</a></li>--}%
                <li><a href="#tab5" data-toggle="tab">
                    ایمیل
                </a></li>
                %{--<li><a href="#tab6" data-toggle="tab">--}%
                    %{--مسئول وب سایت--}%
                %{--</a></li>--}%
                <li><a href="#tab7" data-toggle="tab">
                    <g:message code="contactUs.email.title"/>
                </a></li>
            </ul>

            <div class="tab-content">
                <div id="tab1" class="tab-pane active">
                    <br>
                   <ul>
                       <li>
                           تلفن: 26207938      (9821+)
                       </li>
                       <li>
                           فکس: 88621544     (9821+)
                       </li>
                   </ul>
                </div>

                <div id="tab2" class="tab-pane">
                    <br>
                    تهران، خیابان آفریقا، خیابان نیلوفر، پلاک 25، واحد 8
                    <br/>
                    کدپستی: 1967757679
                    <br/><br/>
                    <iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/ms?msa=0&amp;msid=208601900611191432876.000500f6e825be0d46506&amp;hl=en&amp;ie=UTF8&amp;t=m&amp;ll=35.777436,51.417797&amp;spn=0.006093,0.00912&amp;z=16&amp;output=embed"></iframe><br /><small>View <a href="https://www.google.com/maps/ms?msa=0&amp;msid=208601900611191432876.000500f6e825be0d46506&amp;hl=en&amp;ie=UTF8&amp;t=m&amp;ll=35.777436,51.417797&amp;spn=0.006093,0.00912&amp;z=16&amp;source=embed" style="color:#0000FF;text-align:left">My Saved Places</a> in a larger map</small>
                </div>

                %{--<div id="tab3" class="tab-pane">--}%
                    %{--02142328--}%
                %{--</div>--}%

                %{--<div id="tab4" class="tab-pane">--}%
                    %{--ارتباط از طریق--}%
                    %{--<a href="javascript:void(window.open('http://support.zanbil.ir:81/chat.php?acid=26617','','width=590,height=760,left=0,top=0,resizable=yes,menubar=no,location=no,status=yes,scrollbars=yes'))">پشتیبانی آنلاین</a>--}%
                %{--</div>--}%

                <div id="tab5" class="tab-pane">
                <br>
                    همکاری با گلدان: partners@goldaan.ir<br>
                    دریافت اطلاعات: Info@@goldaan.ir<br>
                    پیشنهادات و انتقادات: Suggestions@goldaan.ir<br>
                </div>

                %{--<div id="tab6" class="tab-pane">--}%
                    %{--فرشاد وکیل زاده--}%
                %{--</div>--}%

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
</body>
</html>