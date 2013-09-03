<%@ page import="org.codehaus.groovy.grails.commons.ApplicationHolder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <g:set var="font" value="${resource(dir: 'font', file: 'b_yekan.ttf', absolute: true)}"/>
    <style>
        /*@font-face {*/
        /*src: url('/Personal/DevDesk/Eshop/web-app/font/b_yekan.ttf');*/
        /*-fs-pdf-font-embed: NOT_EMBEDDED;*/
        /*-fs-pdf-font-encoding: IDENTITY_H;*/
        /*}*/

    @font-face {
        /*font-family: 'b_yekan';*/
        src: url('/Personal/DevDesk/Eshop/web-app/font/b_yekan-webfont.eot');
        src: url('/Personal/DevDesk/Eshop/web-app/font/b_yekan-webfont.eot?#iefix') format('embedded-opentype'), url('/Personal/DevDesk/Eshop/web-app/font/b_yekan-webfont.woff') format('woff'), url('/Personal/DevDesk/Eshop/web-app/font/b_yekan-webfont.ttf') format('truetype'), url('/Personal/DevDesk/Eshop/web-app/font/b_yekan-webfont.svg#b_yekanregular') format('svg');
        font-weight: normal;
        font-style: normal;
        -fs-pdf-font-embed: NOT_EMBEDDED;
        -fs-pdf-font-encoding: IDENTITY_H;

    }

    @page {
        margin: 0;
        size: 21cm 29.7cm;
    }

    body {
        margin: 0;
    }

    .page-shadow {
        box-shadow: 0 0 10px grey;
        display: inline-block;
    }

    .page-shadow .a4 {
    }

    .a4 {
        width: 21cm;
        height: 29.7cm;
    }

    .invoice {
        direction: rtl;
        line-height: 20px;
    }

    .invoice * {
        font-family: 'B Yekan', yekan, tahoma !important;
        font-size: 0.3cm;
    }

    .invoice-inner {
        padding: 2cm;
        padding-left: 1.5cm;
        padding-top: 4cm;
    }

    .invoice h2 {
        font-size: 0.6cm;
    }

    .invoice table {
        width: 100%;
    }

    .invoice .label {
        text-align: left;
        vertical-align: middle;
        background-color: transparent;
        text-shadow: none;
        font-weight: normal;
        color: #808080;
        white-space: nowrap;
        padding: 0;
    }

    .invoice .value {
        vertical-align: top;
        text-align: right;
        width: 50%;
    }

    .invoice td {
        border-color: #808080;
        padding: 0.1cm;
    }

    .invoice .customer-info {
    }

    .invoice .basket-detail {
        border-color: #000000;
        margin-top: 0.4cm;
        border: 0.02cm solid #000000;
    }

    .invoice-highlight {
        background-color: #c4b99a;
    }

    .invoice .basket-detail th {
        background-color: #c4b99a;
        text-align: center;
        border: 0.02cm solid #000000;
    }

    .invoice .basket-detail td {
        text-align: center;
        border: 0.02cm solid #000000;
    }

    #invoice-date {
    }

    #invoice-serial {
        margin-bottom: 1cm;
    }

    #invoice-trackingCode {
        font-weight: bold;
        font-size: 0.3cm !important;
    }

    #sellerInfo {
        border: 0.06cm solid #000000;
        border-radius: 0.2cm;
        display: block;
        margin-top: 1cm;
        padding: 0.1cm 0.1cm 0;
    }

    #invoice-sellerCode {
        display: inline-block;
        direction: ltr;
    }

    #customerInfo {
        border: 0.06cm solid #000000;
        border-radius: 0.2cm;
        display: block;
        margin-top: 0.2cm;
        padding: 0.1cm 0.1cm 0;
    }

    .invoice h3 {
        color: #000000;
        text-decoration: underline;
    }

    #invoice-sign {
        text-align: left;
        padding-left: 3cm;
    }

    .print-area {
        position: relative;
    }

    .bg-area {
        position: absolute;
        top: 0;
        right: 0;
        width: 100%;
    }

    .invoice-area {
        position: absolute;
        top: 0;
        right: 0;
    }
    </style>
</head>

<body dir="rtl">
<div class="print-area a4">
    %{--&#1587;&#1604;&#1575;&#1605;--}%
    <div class="bg-area">
        <%
            def paid = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/A4-Invoice.jpg"))
        %>
        <rendering:inlineJpeg bytes="${paid.bytes}" width="100%"/>
    </div>

    <div class="invoice-area">
        <g:render template="/order/invoice/invoice_${order.invoiceType}" model="${[order: order]}"/>
    </div>
</div>

</body>
</html>