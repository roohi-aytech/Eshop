
<p:css name="invoice"/>
<div class="page-shadow">
    <g:render template="/order/invoice/invoice_${order.invoiceType}" model="${[order: order]}"/>
</div>