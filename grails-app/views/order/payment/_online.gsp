<g:javascript>

    function onlineValidateValue(){
        $('#onlineValueValidationMessage').html('');

        var onlineValue = $('#onlineValue').val();
        if(!onlineValue || onlineValue == '') {
            $('#onlineValueValidationMessage').html('${message(code: 'order.payment.value.notEmpty')}')
            return false;
        }
        return true;
    }

    function onlineValidate(){
        return onlineValidateValue();
    }
</g:javascript>

<style>
label {
    display: block;
}
</style>

<g:form action="onlinePayment">
    <g:hiddenField name="order.id" id="order" value="${params.id}"></g:hiddenField>
    <label><g:message
            code="order.payment.bank"></g:message></label>
    <select name="accountId" style="margin-bottom:10px;">
        <g:each in="${accountsForOnlinePayment}" var="account">
            <option value="${account.id}"
                    data-image="${createLink(controller: 'image', params: [type: 'account', id: account.id])}"><g:message
                    code="order.payment.bank.${account.bankName}.label"/></option>
        </g:each>
    </select>
    <label><g:message code="order.payment.value"></g:message></label>
    <input type="text" name="value" id="onlineValue" onblur="onlineValidateValue()" value="${orderPrice}"/>
    <span id="onlineValueValidationMessage"></span>

    <g:if test="${customer}">
        <div style="display: none">
            <input type="checkbox" checked="checked" name="usingCustomerAccountValueAllowed"
                   id="usingCustomerAccountValueAllowed"/>
            <label style="display: inline" for="usingCustomerAccountValueAllowed"><g:message
                    code="order.payment.usingCustomerAccountValueAllowed"></g:message></label>
        </div>
    </g:if>

    <div class="toolbar" style="margin-top:10px;">
        <input type="submit" class="btn btn-primary" onclick="return onlineValidate()"
               value="<g:message code="controlPanel.orders.actions.payment.label"></g:message>"/>
    </div>
</g:form>