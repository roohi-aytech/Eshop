<g:message code="customer.account.currentValue"></g:message> : <b>${customerAccountValue}</b><br/>
<g:message code="order.totalPrice"></g:message> : <b>${orderPrice}</b><br/>
<g:if test="${customerAccountValue >= orderPrice}">
    <g:message
            code="order.payment.remainingAccountValueAfterPayment"></g:message> : <b>${customerAccountValue - orderPrice}</b><br/>

    <g:form action="payOrderFromAccount">
        <g:hiddenField name="order.id" id="order" value="${params.id}"></g:hiddenField>
        <div class="toolbar" style="margin-top:10px;">
            <input type="submit" class="btn btn-primary"
                   value="<g:message code="controlPanel.orders.actions.payment.label"></g:message>"/>
    </g:form>
    </div>
</g:if>
<g:else>
    <div class="info">
        <div>
            <g:message code="order.payment.NotEnoughAccount"></g:message>
        </div>
    </div>
</g:else>