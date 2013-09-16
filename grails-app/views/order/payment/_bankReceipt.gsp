<script language="javascript" type="text/javascript">

    function validateValue(){
        $('#valueValidationMessage').html('');

        var password = $('#value').val();
        if(!password || password == '') {
            $('#valueValidationMessage').html('${message(code: 'order.payment.value.notEmpty')}')
            return false;
        }
        return true;
    }

    function validateTrackingCode(){
        $('#trackingCodeValidationMessage').html('');

        var password = $('#trackingCode').val();
        if(!password || password == '') {
            $('#trackingCodeValidationMessage').html('${message(code: 'order.payment.trackingCode.notEmpty')}')
            return false;
        }
        return true;
    }

    function validateDate(){
        $('#dateValidationMessage').html('');

        var date = $('#date_control').val();
        if(!date || date == '') {
            $('#dateValidationMessage').html('${message(code: 'order.payment.date.notEmpty')}')
            return false;
        }
        return true;
    }

    function validate(){
        return validateValue() && validateTrackingCode() && validateDate();
    }
</script>

<style>
label {
    display: block;
}
</style>

<g:form action="savePaymentRequest">
    <g:hiddenField name="order.id" id="order" value="${params.id}"></g:hiddenField>
    <label><g:message
            code="order.payment.bank"></g:message></label>
    <select name="account" style="margin-bottom:10px;">
        <g:each in="${accounts}" var="account">
            <option value="${account.id}"
                    data-image="${createLink(controller: 'image', params: [type: 'account', id: account.id])}"><g:message
                    code="order.payment.bank.${account.bankName}.label"/></option>
        </g:each>
    </select>
    <label><g:message code="order.payment.value"></g:message></label>
    <input type="text" name="value" id="value" onblur="validateValue()" value="${orderPrice}"/>
    <span id="valueValidationMessage"></span>
    <label><g:message code="order.payment.trackingCode"></g:message></label>
    <input type="text" name="trackingCode" id="trackingCode" onblur="validateTrackingCode()"/>
    <span id="trackingCodeValidationMessage"></span>
    <label for='date'><g:message code="order.payment.date"/></label>
    <span id="dateValidationMessage"></span>
    <rg:datePicker name="date" value="${new Date()}"></rg:datePicker>
    <script type="text/javascript" language="javascript">
        $('#birthDate_control').blur(function () {
            validateDate();
        });
    </script>

    <g:if test="${customer}">
        <div style="display: none">
            <input type="checkbox" checked="checked" name="usingCustomerAccountValueAllowed"
                   id="usingCustomerAccountValueAllowed"/>
            <label style="display: inline" for="usingCustomerAccountValueAllowed"><g:message
                    code="order.payment.usingCustomerAccountValueAllowed"></g:message></label></div>
    </g:if>

    <div class="toolbar" style="margin-top:10px;">
        <input type="submit" class="btn btn-primary" onclick="return validate()"
               value="<g:message code="controlPanel.orders.actions.payment.label"></g:message>"/>
    </div>
</g:form>