<g:javascript>

        function validateFirstName(){
            $('#firstNameValidationMessage').html('');

            var password = $('#firstName').val();
            if(!password || password == '') {
                $('#firstNameValidationMessage').html('${message(code: 'profile.firstName.notEmpty')}')
                return false;
            }
            return true;
        }

        function validateLastName(){
            $('#lastNameValidationMessage').html('');

            var password = $('#lastName').val();
            if(!password || password == '') {
                $('#lastNameValidationMessage').html('${message(code: 'profile.lastName.notEmpty')}')
                return false;
            }
            return true;
        }

        function validateMobile(){
            $('#mobileValidationMessage').html('');

            var password = $('#mobile').val();
            if(!password || password == '') {
                $('#mobileValidationMessage').html('${message(code: 'profile.mobile.notEmpty')}')
                return false;
            }
            return true;
        }

        function validateTelephone(){
            $('#telephoneValidationMessage').html('');

            var password = $('#telephone').val();
            if(!password || password == '') {
                $('#telephoneValidationMessage').html('${message(code: 'profile.telephone.notEmpty')}')
                return false;
            }
            return true;
        }

        function validate(){
            if(validateFirstName() && validateLastName() && validateMobile() && validateTelephone())
                return true;
            return false;
        }
</g:javascript>
<g:form controller="customer" action='savePersonalInfo' method='POST' id='registerForm'
        name='registerForm'
        class='cssform'
        autocomplete='off'>
    <div class="column1">

        <p>
            <label for='firstName'><g:message
                    code="springSecurity.register.firstName.label"/>:</label> *
            <span id="firstNameValidationMessage"></span>
            <input type='text' class='text_' name='firstName' id='firstName' value="${customerInstance.firstName}" onblur="validateFirstName()" />
        </p>

        <p>
            <label for='lastName'><g:message
                    code="springSecurity.register.lastName.label"/>:</label> *
            <span id="lastNameValidationMessage"></span>
            <input type='text' class='text_' name='lastName' id='lastName' value="${customerInstance.lastName}" onblur="validateLastName()"/>
        </p>

        <p>
            <label for='sex'><g:message code="springSecurity.register.sex.label"/>:</label>
            <select name="sex" id="sex">
                <option value="female" ${customerInstance.sex == 'female'?'selected':''}><g:message code="sex.female"></g:message></option>
                <option value="male"${customerInstance.sex == 'male'?'selected':''}><g:message code="sex.male"></g:message></option>
            </select>
        </p>

        <p>
            <label for='birthDate'><g:message
                    code="springSecurity.register.birthDate.label"/>:</label>
            <rg:datePicker name="birthDate" value="${customerInstance.birthDate}"></rg:datePicker>
        </p>
    </div>

    <div class="column2">
        <p>
            <label for='nationalCode'><g:message
                    code="springSecurity.register.nationalCode.label"/>:</label>
            <input type='text' class='text_' name='nationalCode' id='nationalCode' value="${customerInstance.nationalCode}"/>
        </p>

        <p>
            <label for='jobTitle'><g:message
                    code="springSecurity.register.jobTitle.label"/>:</label>
            <g:select name="jobTitle" from="${customerInstance.constraints.jobTitle.inList}"
                      value="${customerInstance?.jobTitle}"
                      valueMessagePrefix="customer.jobTitle" noSelection="['': '']"/>
        </p>

        <p>
            <label for='mobile'><g:message code="springSecurity.register.mobile.label"/>:</label> *
            <span id="mobileValidationMessage"></span>
            <input type='text' class='text_' name='mobile' id='mobile' value="${customerInstance.mobile}" onblur="validateMobile()"/>
        </p>

        <p>
            <label for='telephone'><g:message
                    code="springSecurity.register.telephone.label"/>:</label> *
            <span id="telephoneValidationMessage"></span>
            <input type='text' class='text_' name='telephone' id='telephone' value="${customerInstance.telephone}" onblur="validateTelephone()"/>
        </p>

    </div>

    <p class="toolbar">
        <input type='submit' id="submit" onclick="return validate();" class="btn btn-primary"
               width="80px"
               value='${message(code: "savePersonalInfo")}'/>
    </p>
</g:form>