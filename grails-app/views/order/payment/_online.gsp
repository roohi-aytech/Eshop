<script language="javascript" type="text/javascript">

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
</script>

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

    <g:if test="${grailsApplication.config.paymentValueUserSelect}">
        <input type="hidden" name="value" id="onlineValue" onblur="onlineValidateValue()" value="${orderPrice}"/>
        <label><g:message code="order.payment.value"></g:message> <g:formatNumber number="${orderPrice}" type="number"/> (<eshop:currencyLabel/>)</label>
    </g:if>
    <g:else>
        <label><g:message code="order.payment.value"></g:message> (<eshop:currencyLabel/>)</label>
        <input type="text" name="value" id="onlineValue" onblur="onlineValidateValue()" value="${orderPrice}"/>
    </g:else>
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