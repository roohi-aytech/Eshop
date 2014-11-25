<script language="javascript" type="text/javascript">
    function validateOwnerName() {
        $('#ownerNameValidationMessage').html('');

        var ownerName = $('#ownerName').val();
        if (!ownerName || ownerName == '') {
            $('#ownerNameValidationMessage').html('${message(code: 'order.ownerName.notEmpty')}');
            return false;
        }
        return true;
    }
    function validateOwnerEmail() {
        $('#ownerEmailValidationMessage').html('');

        var ownerEmail = $('#ownerEmail').val();
        if (!ownerEmail || ownerEmail == '') {
            $('#ownerEmailValidationMessage').html('${message(code: 'shippingAddress.telephone.notEmpty')}');
            return false;
        }
        return true;
    }
    function validateOwnerMobile() {
        $('#ownerMobileValidationMessage').html('');

        var ownerMobile = $('#ownerMobile').val();
        if (!ownerMobile || ownerMobile == '') {
            $('#ownerMobileValidationMessage').html('${message(code: 'shippingAddress.telephone.notEmpty')}');
            return false;
        }
        return true;
    }
    function setPaymentType(element) {
        if (element.checked) {
            $('.deliveryMethodList li').removeClass('selected');
            $(element).parent().addClass('selected');
        }
    }
    function validateInvoiceCustomInformation() {

        var ownerName = validateOwnerName();
        return ownerName;
    }

</script>

<form id="invoiceCustomInfoForm" onsubmit="return validateInvoiceCustomInformation();" method="post"
      action="${createLink(action: 'storeCustomInvoiceInformation')}"
      style="margin-bottom: 0;border-bottom:1px dashed #dddddd;padding-bottom:10px;">
    <input type="hidden" name="customInvoiceInfo" value="true">
    <div id="no-sign-in">
        <div style="margin-top:10px;display:block;"
             id="invoiceCustomInfoContainer">
            <label for='ownerName'><g:message code="order.ownerName.label"/>:</label>
            <span id="ownerNameValidationMessage"></span>
            <input type='text' onblur="validateOwnerName()" class='text_' name='ownerName' id='ownerName'
                   value="${customInvoiceInformation?.ownerName}"/>
            %{--<sec:ifNotLoggedIn>--}%
                %{--<label for='ownerEmail'><g:message code="order.ownerEmail"/>:</label>--}%
                %{--<span id="ownerEmailValidationMessage"></span>--}%
                %{--<input type='text' onblur="validateOwnerEmail()" class='text_' name='ownerEmail' id='ownerEmail'--}%
                       %{--value="${customInvoiceInformation?.ownerEmail}"/>--}%
                %{--<label for='ownerMobile'><g:message code="order.ownerMobile.label"/>:</label>--}%
                %{--<span id="ownerMobileValidationMessage"></span>--}%
                %{--<input type='text' onblur="validateOwnerMobile()" class='text_' name='ownerMobile' id='ownerMobile'--}%
                       %{--value="${customInvoiceInformation?.ownerMobile}"/>--}%
            %{--</sec:ifNotLoggedIn>--}%
            <input type='checkbox' class='customCheckbox' name='sendFactorWith' id='sendFactorWith'
                   value="true" ${customInvoiceInformation?.sendFactorWith?'checked':''}/>
            <label for='sendFactorWith'>
                <span></span>
                <g:message code="sendFactorWith"/>
            </label>
            <br/>
            <label for='paymentType'><g:message code="payment.type"/>:</label>
            <ul id="paymentType" class="deliveryMethodList">

                <li class="${(customInvoiceInformation?.paymentType?:'online')=='online'?'selected':''}">
                    <img src="/images/goldaan/online.png" style="padding: 3px;vertical-align: top;"/>
                    <input type="radio" id="paymentTypeOnline"
                           name="paymentType" ${(customInvoiceInformation?.paymentType?:'online')=='online'?'checked':''} value="online"
                           onchange="setPaymentType(this);"/>
                    <label for="paymentTypeOnline" style="color:black;">
                        <b><g:message code="online"/></b>
                        <br/>
                        <label for="paymentTypeOnline"><g:message code="online-pay-info" /></label>
                    </label>

                </li>
                <li class="${(customInvoiceInformation?.paymentType?:'online')=='in-place'?'selected':''}">
                    <img src="/images/goldaan/money.png" style="padding: 3px;vertical-align: top;"/>
                    <input type="radio" id="paymentTypeInplace"
                           name="paymentType" ${(customInvoiceInformation?.paymentType?:'online')=='in-place'?'checked':''} value="in-place"
                           onchange="setPaymentType(this);"/>
                    <label for="paymentTypeInplace" style="color:black;">
                        <b><g:message code="in-place"/></b>
                        <br/>
                        <label for="paymentTypeInplace" ><g:message code="money-pay-info" /></label>
                    </label>

                </li>
            </ul>
        </div>
        <input type='submit' id="submitInvoiceCustomInfoForm" class="grn-btn"
               value='${message(code: "enquiry.request.shopping.saveCustomInvoiceInfo")}'/>
    </div>
</form>