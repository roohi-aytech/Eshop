<g:javascript>
    function validateReagent(){


        $('#wayOfKnowingValidationMessage').html('');

        var wayOfKnowing = $('#wayOfKnowing').val();
        if(!wayOfKnowing || wayOfKnowing == '') {
            $('#wayOfKnowingValidationMessage').html('${message(code: 'customer.wayOfKnowing.notEmpty')}')
            return false;
        }

        $('#reagentEmailValidationMessage').html('');

        var reagentEmail = $('#reagentEmail').val();
        if(!reagentEmail || reagentEmail == '') {
            $('#reagentEmailValidationMessage').html('${message(code: 'customer.reagentEmail.notEmpty')}')
            return false;
        }

        var $form = $("#reagentForm");
        var serializedData = $form.serialize();
        $('#reagentFrame').hide();
        $('#reagentWaiting').fadeIn();
        var request = $.ajax({
            url: "${createLink(controller: "Customer", action: "validateReagent")}",
            type: "post",
            data: serializedData
        });

        request.done(function (response, textStatus, jqXHR){
            $('#reagentWaiting').hide();
            if(isNaN(response)){
                $('#reagentFullName').html(response);
                $('#reagentFrame').fadeIn();
//                $('#reagentForm').submit(function(){});
                $('#hiddenSubmit').click();
            }
            else{
                $('#reagentEmailValidationMessage').html('${message(code: 'customer.reagentEmail.invalid')}')
            }
        });

        request.fail(function (jqXHR, textStatus, errorThrown){
        });

        request.always(function () {
        });

        return false;
    }
</g:javascript>
<form id='reagentForm' class='cssform' autocomplete='off' method="POST"
      action="${createLink(controller: 'customer', action: 'saveReagent')}">

    <p>
        <label for='wayOfKnowing'><g:message
                code="customer.wayOfKnowing.label"/>:</label> *
        <span id="wayOfKnowingValidationMessage"></span>
        <g:select name="wayOfKnowing" id="wayOfKnowing" from="${customerInstance.constraints.wayOfKnowing.inList}"
                  value="${customerInstance?.wayOfKnowing}"
                  valueMessagePrefix="customer.wayOfKnowing" noSelection="['': '']"/>
    </p>

    <p>
        <label for='reagentEmail'><g:message
                code="customer.reagent.email.label"/>:</label> *
        <span id="reagentEmailValidationMessage"></span><br/>
        <input type='text' class='text_' name='email' id='reagentEmail' value="${customerInstance?.reagent?.email}"/>
        <span id="reagentWaiting" class="waiting">
            <img src="${resource(dir: 'images', file: 'loading.gif')}"/>
            <g:message code="waiting"/>
        </span>
    </p>

    <p>
        <span class="border" id="reagentFrame" ${customerInstance?.reagent ? 'style="display:inline-block;"' : ''}>
            <img src="${resource(dir: 'images', file: 'yes.png')}"/>
            <span><g:message
                    code="customer.reagent.name.label"/>:</span>
            <span id="reagentFullName">${customerInstance?.reagent}</span>
        </span>
    </p>

    <p class="toolbar">
        <input type='submit' id="submit" class="btn btn-primary" onclick="return validateReagent()"
               width="80px"
               value='${message(code: "customer.reagent.save.label")}'/>
        <input type='submit' id="hiddenSubmit" class="hidden"/>
    </p>
</form>