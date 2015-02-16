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

    function validateOwnerMobile() {
        $('#ownerMobileValidationMessage').html('');

        var ownerMobile = $('#ownerMobile').val();
        if (!ownerMobile || ownerMobile == '') {
            $('#ownerMobileValidationMessage').html('${message(code: 'order.ownerMobile.notEmpty')}');
            return false;
        }
        return true;
    }

    var validateInvoiceCustomInfoEnabled;
    function validateInvoiceCustomInformation() {
        if (!validateInvoiceCustomInfoEnabled)
            return true;
        var ownerName = validateOwnerName();
        var ownerMobile = validateOwnerMobile();
        return ownerName && ownerMobile;
    }
</script>

<form id="invoiceCustomInfoForm" onsubmit="return validateInvoiceCustomInformation();" method="post"
      action="${createLink(action: 'storeCustomInvoiceInformation')}"
      style="margin-bottom: 0;border-bottom:1px dashed #dddddd;padding-bottom:10px;">
    <div style="padding-bottom:10px;padding-top:10px;">
        <label style="display: inline-block;margin-left:20px;line-height: 18px;"><g:message
                code="enquiry.request.shopping.customInvoiceInfo.description"/></label>

        <div class="addressFilter">
            <div class="toggle-light"></div>
        </div>
        <g:hiddenField name="customInvoiceInfo" id="customInvoiceInfo" value="${session.order?.useAlternateInformation?:false}" />

        <div class="clear"></div>
        <script language="javascript" type="text/javascript">
            $('.toggle-light').toggles({
                drag: true, // allow dragging the toggle between positions
                click: true, // allow clicking on the toggle
                text: {
                    on: '${message(code:'true')}', // text for the ON position
                    off: '${message(code:'false')}' // and off
                },
                on: ${session.order?.useAlternateInformation?:false}, // is the toggle ON on init
                animate: 250, // animation time
                transition: 'swing', // animation transition,
                checkbox: null, // the checkbox to toggle (for use in forms)
                clicker: null, // element that can be clicked on to toggle. removes binding from the toggle itself (use nesting)
                width: 50, // width used if not set in css
                height: 20, // height if not set in css
                type: 'compact' // if this is set to 'select' then the select style toggle will be used
            }).on('toggle', function (e, active) {
                if (active) {
                    $('#invoiceCustomInfoContainer').stop().slideDown();
                    validateInvoiceCustomInfoEnabled = true;
                    $('#customInvoiceInfo').val('true');
                }
                else {
                    $('#invoiceCustomInfoContainer').stop().slideUp();
                    validateInvoiceCustomInfoEnabled = false;
                    $('#customInvoiceInfo').val('false');
                }
            });
        </script>
    </div>

    <div id="no-sign-in">
        <div style="margin-top:10px;${customInvoiceInformation?.customInvoiceInfo ? 'display:block' : 'display: none'};"
             id="invoiceCustomInfoContainer">
            <label for='ownerName'><g:message code="order.ownerName.label"/>:</label>
            <span id="ownerNameValidationMessage"></span>
            <input type='text' onblur="validateOwnerName()" class='text_' name='ownerName' id='ownerName'
                   value="${customInvoiceInformation?.ownerName}"/>
            <label for='ownerCode'><g:message code="order.ownerCode.label"/>:</label>
            <span id="ownerCodeValidationMessage"></span>
            <input type='text' class='text_' name='ownerCode' id='ownerCode'
                   value="${customInvoiceInformation?.ownerCode}"/>
            <label for='ownerMobile'><g:message code="order.ownerMobile.label"/>:</label>
            <span id="ownerMobileValidationMessage"></span>
            <input type='text' onblur="validateOwnerMobile()" class='text_' name='ownerMobile' id='ownerMobile'
                   value="${customInvoiceInformation?.ownerMobile}"/>
        </div>
        <input type='submit' id="submitInvoiceCustomInfoForm" class="grn-btn"
               value='${message(code: "enquiry.request.shopping.saveCustomInvoiceInfo")}'/>
    </div>
</form>