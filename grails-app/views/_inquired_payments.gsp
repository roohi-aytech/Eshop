<%@ page import="eshop.Customer; eshop.Order" %>
<g:set var="customer" value="${Customer.findByUsername(sec.username())}"></g:set>
<g:if test="${customer &&
        params.controller != 'order' &&
        params.action != 'panel'}">
    <g:each in="${Order.findAllByCustomerAndStatusAndPaymentTimeoutGreaterThanEquals(customer, 'inquired', new Date())}"
            var="order">
        <g:javascript>
            $(document).ready(function(){
                $.msgGrowl({
                    type: 'warning',
                    sticky: true,
                    title: '${message(code: 'order.controlPanelAlert.link')}',
                    text: '${message(
                        code :"order.controlPanelAlert",
                        args:[formatDate(date: order.paymentTimeout, format: 'HH:mm'), rg.formatJalaliDate(date: order.paymentTimeout), order.trackingCode])}<br/><a href="${createLink(controller: 'order', action: 'completion', params: [id: order.id])}"><g:message code="order.controlPanelAlert.link"/></a>',
                    lifetime: 5000
                });

            });
        </g:javascript>
    </g:each>
</g:if>