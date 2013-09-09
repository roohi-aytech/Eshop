
<link href="${resource(dir: 'css', file: 'invoice.css')}" rel="stylesheet" type="text/css"/>
<div class="page-shadow">
    <g:render template="/order/invoice/invoice_${order.invoiceType}" model="${[order: order]}"/>
</div>