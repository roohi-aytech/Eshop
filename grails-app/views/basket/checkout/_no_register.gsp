<g:javascript>
    function validateLastName(){
        $('#lastNameValidationMessage').html('');

        var lastName = $('#lastName').val();
        if(!lastName || lastName == '') {
            $('#lastNameValidationMessage').html('${message(code: 'profile.lastName.notEmpty')}');
            return false;
        }
        return true;
    }

    function validateUsernameField(){
        $('#usernameValidationMessage').html('');

        var usernameField = $('#usernameField').val();

        if(usernameField.toLowerCase().indexOf('www.') != -1){
            $('#usernameValidationMessage').html('${message(code: 'springSecurity.register.username.invalid')}');
            return false;
        }

        var emailPattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
        if (!emailPattern.test(usernameField)) {
            $('#usernameValidationMessage').html('${message(code: 'springSecurity.register.username.invalid')}');
            return false;
        }

        return true;
    }


    function validateMobile(){
        $('#mobileValidationMessage').html('');

        var mobile = $('#mobile').val();
        if(!mobile || mobile == '') {
            $('#mobileValidationMessage').html('${message(code: 'profile.mobile.notEmpty')}');
            return false;
        }
        return true;
    }


    function validateTelephoneNumber(){
        $('#telephoneValidationMessage').html('');

        var telephone = $('#telephone').val();
        if(!telephone || telephone == '') {
            $('#telephoneValidationMessage').html('${message(code: 'profile.telephone.notEmpty')}');
            return false;
        }
        return true;
    }

    function validateCustomerInformation(){
        var lastName = validateLastName();
        var email = validateUsernameField();
        var mobile = validateMobile();
        var telephone = validateTelephoneNumber();
        return lastName && email && mobile && telephone;
    }

    $(document).ready(function(){
        document.getElementById('customerInformationForm').onsubmit = validateCustomerInformation;
    });
</g:javascript>
<p style="line-height: 18px;text-align: justify;">
    <img src="${resource(dir: 'images', file: 'msgGrowl_warning.png')}" style="height:18px;"/>
    <g:message code="enquiry.request.shopping.noRegister.warning"/>
</p>

<form action='/basket/storeCustomerInformationWithoutRegistration' method='POST' id="customerInformationForm" class='cssform' autocomplete='off' onsubmit="validateCustomerInformation()">

    <p>
        <label for='lastName'><g:message code="springSecurity.register.lastName.label"/>:</label>
        <span id="lastNameValidationMessage"></span>
        <input type='text' onblur="validateLastName()" class='text_' name='lastName' id='lastName' style="display: block"
            value="${session.checkout_customerInformation?.lastName}"/>
    </p>

    <p>
        <label for='sex'><g:message code="springSecurity.register.sex.label"/>:</label>
        <span id="sexValidationMessage"></span>
        <select name="sex" id="sex" style="display: block">
            <option value="female" ${session.checkout_customerInformation?.sex == 'female'?'selected':''}><g:message
                    code="sex.female"></g:message></option>
            <option value="male" ${session.checkout_customerInformation?.sex == 'male'?'selected':''}><g:message
                    code="sex.male"></g:message></option>
        </select>
    </p>

    <p>
        <label for='usernameField'><g:message code="contactUs.email.email"/>:</label>
        <span id="usernameValidationMessage"></span>
        <input type='text' onblur="validateUsernameField()" class='text_' name='email' id='usernameField' style="display: block"
               value="${session.checkout_customerInformation?.email}"/>
    </p>

    <p>
        <label for='mobile'><g:message code="springSecurity.register.mobile.label"/>:</label>
        <span id="mobileValidationMessage"></span>
        <input type='text' class='text_' name='mobile' id='mobile' onblur="validateMobile()" style="display: block"
               value="${session.checkout_customerInformation?.mobile}"/>
    </p>

    <p>
        <label for='telephone'><g:message
                code="springSecurity.register.telephone.label"/>:</label>
        <span id="telephoneValidationMessage"></span>
        <input type='text' class='text_' name='telephone' id='telephone' onblur="validateTelephoneNumber()" style="display: block"
               value="${session.checkout_customerInformation?.telephone}"/>
    </p>

    <div style="float: right;">
        <input type='submit' id="submit" class="btn btn-warning" width="80px"
               value='${message(code: "enquiry.request.shopping.noRegister")}' style="height:30px;" style="display: block"/>
    </div>
</form>