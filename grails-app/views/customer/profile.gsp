<html>
<head>
<meta name='layout' content='site'/>
<title><g:message code="profile"/></title>
<style type='text/css' media='screen'>
#register {
    margin: 15px 0px;
    padding: 0px;
    text-align: center;
}

#register .inner {
    width: 500px;
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

#register .inner .cssform input[type='text'], #register .inner .cssform input[type='password'] {
    width: 215px;
    margin-bottom: 0;
}

#register .inner .cssform textarea {
    width: 465px;
    margin-bottom: 0;
}

#register .inner .cssform label {
    /*float: right;*/
    text-align: right;
    padding-bottom: 3px;
    display: inline-block;
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
    margin: 0;
    position: relative;
}

#register .column1 {
    display: inline-block;
    width: 250px;
    /*position: absolute;*/
    top: 0;
    right: 0;
}

#register .column2 {
    display: inline-block;
    width: 250px;
    position: absolute;
    top: 0;
    left: 0;
}

#register textarea {
    height: 83px;
}

.tabbable {
    margin: 0 !important;
}

.nav-tabs {
    background: #eeeeee;
    padding: 5px;
    border-radius: 5px 5px 0 0;
    padding-bottom: 0;
}

select {
    width: 230px;
    margin-bottom: 0 !important;
}

.hasDatepicker {
    background: none repeat scroll 0 0 white !important;
    box-shadow: none !important;
    cursor: default !important;
    margin-right: 10px;
    margin-top: -5px;
}
</style>
<link href="${resource(plugin: 'jquery-ui', dir: 'jquery-ui/themes/cobalt', file: 'jquery-ui-1.8.15.custom.css')}"
      type="text/css" rel="stylesheet" media="screen, projection" id="jquery-ui-theme"/>
<script src="${resource(plugin: 'jquery-ui', dir: 'jquery-ui/js', file: 'jquery-ui-1.8.15.custom.min.js')}"
        type="text/javascript"></script>
href="${resource(plugin: 'rapid-grails', dir: 'css/datepicker', file: 'ui.datepicker.css')}"/>
<script src="${resource(plugin: 'rapid-grails', dir: 'js/datepicker', file: 'jquery.ui.datepicker-cc.js')}"
        type="text/javascript"></script>
<script src="${resource(plugin: 'rapid-grails', dir: 'js/datepicker', file: 'calendar.js')}"
        type="text/javascript"></script>
<script src="${resource(plugin: 'rapid-grails', dir: 'js/datepicker', file: 'jquery.ui.datepicker-cc-fa.js')}"
        type="text/javascript"></script>
<g:javascript>

        function validateUsername(){
            $('#usernameValidationMessage').html('');

            var username = $('#username').val();

            var emailPattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
            if (!emailPattern.test(username)) {
                $('#usernameValidationMessage').html('${message(code: 'springSecurity.register.username.invalid')}')
                return false;
            }

            $.ajax({
                type:"POST",
                url:"<g:createLink action="checkUserNameIsRepetitive"/>",
                data:{username: username}
            }).done(function (response) {
                $('#usernameValidationMessage').html(response);
            });

            return true;
        }

        function validatePassword(){
            $('#passwordValidationMessage').html('');

            var password = $('#password').val();
            if(!password || password == '') {
                $('#passwordValidationMessage').html('${message(code: 'springSecurity.register.password.notEmpty')}')
                return false;
            }

            return true;
        }

        function validateConfirmPassword(){
            $('#confirmPasswordValidationMessage').html('');

            var password = $('#password').val();
            var confirmPassword = $('#confirmPassword').val();
            if(password != confirmPassword){
                $('#confirmPasswordValidationMessage').html('${message(code: 'springSecurity.register.password.notMatch')}')
                return false;
            }

            return true;
        }

        function validate(){
            if(validateUsername() && validatePassword() && validateConfirmPassword())
                return true;
            return false;
        }
</g:javascript>
</head>

<body>
<div id='register'>
    <div class='inner'>
        <g:hiddenField name="id" value="${customerInstance?.id}"/>
        <g:hiddenField name="version" value="${customerInstance?.version}"/>

        <g:hasErrors bean="${customerInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${customerInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <div class="tabbable">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab1" data-toggle="tab"><g:message code="edit.profile.label"/></a></li>
                <li><a href="#tab2" data-toggle="tab"><g:message
                        code="springSecurity.register.sendingAddress.label"/></a></li>
            </ul>

            <div class="tab-content">
                <div id="tab1" class="tab-pane active">
                    <g:form controller="customer" action='saveBasicInfo' method='POST' id='registerForm'
                            name='registerForm'
                            class='cssform'
                            autocomplete='off'>
                        <div class="column1">

                            <p>
                                <label for='firstName'><g:message
                                        code="springSecurity.register.firstName.label"/>:</label> *
                                <input type='text' class='text_' name='firstName' id='firstName'/>
                            </p>

                            <p>
                                <label for='lastName'><g:message
                                        code="springSecurity.register.lastName.label"/>:</label> *
                                <input type='text' class='text_' name='lastName' id='lastName'/>
                            </p>

                            <p>
                                <label for='sex'><g:message code="springSecurity.register.sex.label"/>:</label>
                                <select name="sex" id="sex">
                                    <option value="female"><g:message code="sex.female"></g:message></option>
                                    <option value="male"><g:message code="sex.male"></g:message></option>
                                </select>
                                %{--<input type='text' class='text_' name='sex' id='sex'/>--}%
                            </p>

                            <p>
                                <label for='birthDate'><g:message
                                        code="springSecurity.register.birthDate.label"/>:</label>
                                <rg:datePicker name="birthDate"></rg:datePicker>
                            </p>
                        </div>

                        <div class="column2">
                            <p>
                                <label for='nationalCode'><g:message
                                        code="springSecurity.register.nationalCode.label"/>:</label>
                                <input type='text' class='text_' name='nationalCode' id='nationalCode'/>
                            </p>

                            <p>
                                <label for='jobTitle'><g:message
                                        code="springSecurity.register.jobTitle.label"/>:</label>
                                <input type='text' class='text_' name='jobTitle' id='jobTitle'/>
                            </p>

                            <p>
                                <label for='mobile'><g:message code="springSecurity.register.mobile.label"/>:</label> *
                                <input type='text' class='text_' name='mobile' id='mobile'/>
                            </p>

                            <p>
                                <label for='telephone'><g:message
                                        code="springSecurity.register.telephone.label"/>:</label> *
                                <input type='text' class='text_' name='telephone' id='telephone'/>
                            </p>

                        </div>

                        <p class="toolbar">
                            <input type='submit' id="submit" onclick="return validate();" class="btn btn-primary"
                                   width="80px"
                                   value='${message(code: "savePersonalInfo")}'/>
                        </p>
                    </g:form>
                </div>

                <div id="tab2" class="tab-pane">
                    <g:form controller="customer" action='saveBasicInfo' method='POST' id='registerForm'
                            name='registerForm'
                            class='cssform'
                            autocomplete='off'>

                        <div class="column1">

                            <p>
                                <label for='province'><g:message
                                        code="springSecurity.register.province.label"/>:</label> *
                                <input type='text' class='text_' name='province' id='province'/>
                            </p>

                            <p>
                                <label for='city'><g:message
                                        code="springSecurity.register.city.label"/>:</label> *
                                <input type='text' class='text_' name='city' id='city'/>
                            </p>
                        </div>

                        <div class="column2">
                            <p>
                                <label for='postalCode'><g:message
                                        code="springSecurity.register.postalCode.label"/>:</label>
                                <input type='text' class='text_' name='postalCode' id='postalCode'/>
                            </p>

                            <p>
                                <label for='telephone'><g:message
                                        code="springSecurity.register.telephone.label"/>:</label>
                                <input type='text' class='text_' name='telephone' id='telephone'/>
                            </p>

                        </div>

                        <p>
                            <label for='addressLine1'><g:message
                                    code="springSecurity.register.address.label"/>:</label>
                            <textarea type='text' class='text_' name='addressLine1' id='addressLine1'></textarea>
                        </p>

                        <p class="toolbar">
                            <input type='submit' id="submit2" onclick="return validate();" class="btn btn-primary"
                                   width="80px"
                                   value='${message(code: "saveSendingAddress")}'/>
                        </p>
                    </g:form>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
