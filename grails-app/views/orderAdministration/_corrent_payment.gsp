<%@ page import="eshop.accounting.Account" %>
<div style="border:1px solid #cccccc;padding: 4px;border-radius: 4px;background: #ffffff">
    <div style="display: block;background: #f4f4f4;border:1px solid #dddddd;border-radius: 4px;padding:5px;"><g:message
            code="correctPayment"/></div>

    <form id="correctPaymentForm" style="margin-right: 10px;margin-bottom: 5px;">
        <g:hiddenField name="order.id" value="${order.id}"/>

        <label style="display: block;margin:5px;"><g:message
                code="order.payment.bank"></g:message></label>
        <select name="account">
            <g:each in="${Account.findAll()}" var="account">
                <option value="${account.id}"
                        data-image="${createLink(controller: 'image', params: [type: 'account', id: account.id])}"><g:message
                        code="account.${account.bankName}.${account.type}"/></option>
            </g:each>
        </select>

        <div>
            <label style="display: block;margin:5px;"><g:message code="order.payment.value"></g:message></label>
            <input type="text" name="value" id="value" value="${order.totalPayablePrice}"/>
            <span id="valueValidationMessage"></span>
        </div>

        <div>
            <label style="display: block;margin:5px;"><g:message code="order.payment.trackingCode"></g:message></label>
            <input type="text" name="trackingCode" id="trackingCode" value="-"/>
            <span id="trackingCodeValidationMessage"></span>
        </div>

        <div>
            <label for='date' style="display: block;margin:5px;"><g:message code="order.payment.date"/></label>
            <span id="dateValidationMessage"></span>
            <rg:datePicker name="date" value="${new Date()}"></rg:datePicker>
        </div>

        <div>
            <label for="description" style="margin:5px;">
                <g:message code="description"/>
            </label>
        </div>

        <div>
            <textarea name="description" id="description" cols="100" rows="5"
                      style="margin:0;display: block;"></textarea>
        </div>

        <div>
            <input type="button" onclick="correctPayment();"
                   value='${message(code: "correctPayment")}'/>
        </div>
    </form>
</div>
<br/>