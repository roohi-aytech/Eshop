<div>
    <g:message code="invoice.item.totalSum"/>: <g:formatNumber number="${order.items.sum { it.totalPrice }}"
                                                               type="number"/> <eshop:currencyLabel/>
</div>

<div>
    <g:message code="deliveryPrice"/>: <g:formatNumber number="${order.deliveryPrice}"
                                                       type="number"/> <eshop:currencyLabel/>
</div>

<div>
    <g:message code="basket.totalRoundedPrice"/>: <g:formatNumber number="${order.totalPrice}"
                                                                  type="number"/> <eshop:currencyLabel/>
</div>

<div>
    <g:message code="invoice.customerAccount"/>: <g:formatNumber number="${order.usedAccountValue}"
                                                                 type="number"/> <eshop:currencyLabel/>
</div>

<div>
<g:message code="invoice.remainingPayablePrice"/>: <g:formatNumber number="${order.totalPayablePrice}"
                                                                  type="number"/> <eshop:currencyLabel/>
    </div>

