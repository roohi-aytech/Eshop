<script language="javascript" type="text/javascript">
    function validateOwnerName(){
        $('#ownerNameValidationMessage').html('');

        var ownerName = $('#ownerName').val();
        if(!ownerName || ownerName == '') {
            $('#ownerNameValidationMessage').html('${message(code: 'order.ownerName.notEmpty')}');
            return false;
        }
        return true;
    }

    function validateOwnerMobile(){
        $('#ownerMobileValidationMessage').html('');

        var ownerMobile = $('#ownerMobile').val();
        if(!ownerMobile || ownerMobile == '') {
            $('#ownerMobileValidationMessage').html('${message(code: 'order.ownerMobile.notEmpty')}');
            return false;
        }
        return true;
    }

    var validateInvoiceCustomInfoEnabled;
    function validateInvoiceCustomInformation(){
        if(!validateInvoiceCustomInfoEnabled)
            return true;
        var ownerName = validateOwnerName();
        var ownerMobile = validateOwnerMobile();
        return ownerName && ownerMobile;
    }

    function actOnCustomInvoiceInfo(){
        if(document.getElementById('customerInvoiceInfo').checked){
            $('#invoiceCustomInfoContainer').stop().fadeIn();
            validateInvoiceCustomInfoEnabled = true;
        }
        else{
            $('#invoiceCustomInfoContainer').stop().fadeOut();
            validateInvoiceCustomInfoEnabled = false;
            $('#submitInvoiceCustomInfoForm').click();
        }
    }
</script>
<form id="invoiceCustomInfoForm" onsubmit="return validateInvoiceCustomInformation();" method="post" action="${createLink(action: 'storeCustomInvoiceInformation')}" style="margin-bottom: 0;">
    <label style="display: inline-block;margin-left:20px;"><g:message
            code="enquiry.request.shopping.customInvoiceInfo.description"/></label>
    <input type="radio" name="customInvoiceInfo" value="true"
           id="customerInvoiceInfo" style="margin-top:0;" onchange="actOnCustomInvoiceInfo();" ${customInvoiceInformation?.customInvoiceInfo == true? 'checked' :''}/>
    <label style="display: inline-block;margin-left:15px;"
           for="customerInvoiceInfo"><g:message code="yes"/></label>
    <input type="radio" name="customInvoiceInfo" value="false"
           id="noCustomerInvoiceInfo" style="margin-top:0;" onchange="actOnCustomInvoiceInfo();" ${customInvoiceInformation?.customInvoiceInfo == false? 'checked' :''}/>
    <label for="noCustomerInvoiceInfo"><g:message code="no"/></label>

    <div style="margin-top:10px;${customInvoiceInformation?.customInvoiceInfo? 'display:block': 'display: none'};" id="invoiceCustomInfoContainer">
        <p>
            <label for='ownerName'><g:message code="order.ownerName.label"/>:</label>
            <span id="ownerNameValidationMessage"></span>
            <input type='text' onblur="validateOwnerName()" class='text_' name='ownerName' id='ownerName'
                   style="display: block"
                   value="${customInvoiceInformation?.ownerName}"/>
        </p>

        <p>
            <label for='ownerCode'><g:message code="order.ownerCode.label"/>:</label>
            <span id="ownerCodeValidationMessage"></span>
            <input type='text' class='text_' name='ownerCode' id='ownerCode' style="display: block"
                   value="${customInvoiceInformation?.ownerCode}"/>
        </p>

        <p>
            <label for='ownerMobile'><g:message code="order.ownerMobile.label"/>:</label>
            <span id="ownerMobileValidationMessage"></span>
            <input type='text' onblur="validateOwnerMobile()" class='text_' name='ownerMobile' id='ownerMobile'
                   style="display: block"
                   value="${customInvoiceInformation?.ownerMobile}"/>
        </p>

        <div style="float: right;">
            <input type='submit' id="submitInvoiceCustomInfoForm" class="btn btn-primary" width="80px"
                   value='${message(code: "enquiry.request.shopping.saveCustomInvoiceInfo")}' style="height:30px;"
                   style="display: block"/>
        </div>
    </div>
</form>