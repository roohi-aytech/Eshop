<%@ page import="eshop.Order" %>
<g:each in="${Order.findAllByCustomerAndStatusAndPaymentTimeoutGreaterThanEquals(customer, 'inquired', new Date())}" var="order">
    <div class='info'>
        <div>
            <g:message code="order.controlPanelAlert" args="${[formatDate(date: order.paymentTimeout, format: 'HH:mm'), rg.formatJalaliDate(date: order.paymentTimeout), order.trackingCode]}"/>
            <br/>
            <a class="btn btn-primary" href="${createLink(controller: 'order', action: 'completion', params: [id: order.id])}"><g:message code="order.controlPanelAlert.link"/></a>
        </div>
    </div>
</g:each>