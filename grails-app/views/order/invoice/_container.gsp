
<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'invoice.css')}"/>
<div class="page-shadow">
    <g:render template="/order/invoice/invoice_${order.invoiceType}" model="${[order: order]}"/>
</div>