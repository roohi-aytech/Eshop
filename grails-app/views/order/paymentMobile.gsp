<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 4/11/13
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="eshop.City" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mobile"/>
    <title><g:message code="controlPanel.orders.actions.payment.label"></g:message></title>

    <script language="javascript" type="text/javascript">
        function changePayFromAccountType() {
            if ($('#paySome').is(':checked')) {
                $('#payFromAccountAmount').prop('disabled', false);
            }
            else {
                $('#payFromAccountAmount').prop('disabled', true);
            }
        }

        function formatPrice(element) {
            $(element).val($(element).val().replace(/[^0-9\.]/g, ''));
            $(element).val(addCommasOnKeyPress($(element).val()));
        }

        function addCommasOnKeyPress(nStr) {
            if (!nStr)
                return;
            nStr = nStr.replace(/\,/g, '');
            nStr += '';
            var x = nStr.split('.');
            var x1 = x[0];
            var x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1)) {
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            }
            return x1 + x2;
        }

        $(document).ready(function () {
            changePayFromAccountType();
            formatPrice($('#payFromAccountAmount'));
        });

        function validatePayFromAccountAmount() {
            var validator = $('#payFromAccountAmountValidator');
            validator.html('');
            if ($('#paySome').is(':checked')) {
                var value = $('#payFromAccountAmount').val().replace(',', '');
                if (!value || value == '') {
                    validator.html('${message(code:'order.payment.payFromAccountAmount.notEmpty.validator')}');
                    return false;
                }
                if (parseInt(value) > ${customerAccountValue}) {
                    validator.html('${message(code:'order.payment.payFromAccountAmount.moreThanCustomerAccount.validator')}');
                    return false;
                }
                if (parseInt(value) > ${orderPrice}) {
                    validator.html('${message(code:'order.payment.payFromAccountAmount.moreThanOrderPrice.validator')}');
                    return false;
                }
            }
            return true
        }
    </script>
</head>

<body>
<h2 style="margin-bottom: 10px;"><g:message code="controlPanel.orders.actions.payment.label"/> <span>${order.trackingCode}</span>
</h2>

<div class="page-content" style="font-size:13px;line-height: 18px;">
    <g:message code="customer.account.currentValue"/> : <b><g:formatNumber number="${customerAccountValue}"
                                                                           type="number"/></b> <eshop:currencyLabel/> <br/>
    <g:message code="order.totalPrice"/> : <b><g:formatNumber number="${orderPrice}"
                                                              type="number"/></b> <eshop:currencyLabel/>
</div>
<g:form style="margin:0;" action="payFromAccount">
    <g:hiddenField name="order.id" id="order" value="${params.id}"/>
    <div id="no-sign-in">
        <g:if test="${customerAccountValue >= orderPrice}">
            <div style="margin-bottom: 5px;">
                <input type="radio" id="payWhole" name="payFromAccountType" value="whole" style="margin-top:0"
                       onchange="changePayFromAccountType()" checked=""/>
                <label for="payWhole" style="display: inline-block;">
                    <g:message code="order.payment.payWholeFromAccount"/>
                </label>
            </div>
        </g:if>
        <div>
            <input type="radio" id="paySome" name="payFromAccountType" value="some"
                   onchange="changePayFromAccountType()" ${customerAccountValue < orderPrice ? 'checked="" style="display:none;margin-top:0;"' : 'style="margin-top:0;"'}/>
            <label for="paySome">
                <g:message code="order.payment.paySomeFromAccount"/> (<eshop:currencyLabel/>)
            </label>
            <g:textField name="payFromAccountAmount" id="payFromAccountAmount" onKeyup="formatPrice(this);"
                         style="margin:0;direction: ltr;text-align: left;"
                         value="${[orderPrice, customerAccountValue].min()}"/>
            <span id="payFromAccountAmountValidator"></span>
        </div>
    </div>

    <div style="margin-top:10px;margin-bottom:10px;">
        <input type="submit" class="grn-btn" style="width: 100%;" onclick="return validatePayFromAccountAmount();"
               value="<g:message code="controlPanel.orders.actions.payment.label"/>"/>
    </div>
</g:form>
</body>
</html>