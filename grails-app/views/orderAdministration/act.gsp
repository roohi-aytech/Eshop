<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 5/9/13
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <style>
    table {
        border: 1px solid #eeeeee;
        background-color: #ffffff;
    }

    h3 {
        margin: 10px;
    }

    th, td {
        text-align: right;
        border: 1px solid #eeeeee;
        background: none;
    }

    .no-border {
        border-width: 0;
    }

    .hideIt {
        display: none;
    }

    .fieldcontain label, .fieldcontain .property-label {
        display: inline-block;
        width: auto;
        margin-right: 10px;
    }

    input[type="button"], input[type="submit"] {
        padding: 1px 10px !important;
        font-family: tahoma !important;
        font-size: 11px !important;
        margin-right: 10px;
        font-weight: normal !important;
    }

    .scaffold-show .fieldcontain {
        background: #f8f8f8;
    }

    .fieldcontain span.property-label {
        background: none repeat scroll 0 0 transparent;
        border-width: 0;
        box-shadow: none;
    }

    #content table th {
        background: #eeeeee;
    }

    #ValidityDateContainer, #invoiceTypeContainer, #deliveryTrackingCodeContainer {
        margin: 8px;
    }

    #ValidityDateContainer div {
        display: inline;
    }
    </style>
</head>

<body>
<div>
    <div id="order-tabs">
        <ul>
            <li><a href="#info"><g:message code="order.info"/></a></li>
            <li><a href="#items"><g:message code="order.items"/></a></li>
            <li><a href="#history"><g:message code="order.history"/></a></li>
        </ul>

        <div id="info">
            <g:render template="show" model="${[orderInstance: order]}"/>
        </div>

        <div id="items">
            <g:render template="items" model="${[order: order]}"/>
        </div>

        <div id="history">
            <g:render template="history" model="${[order: order]}"/>
        </div>
    </div>

<div style="border:1px solid #cccccc;padding: 4px;border-radius: 4px;background: #ffffff">

    <g:if test="${actions.size()>0  || (order.status == eshop.OrderHelper.STATUS_PAYMENT_APPROVED ||(grailsApplication.config.showFactorAfterDelivery && order.status in [eshop.OrderHelper.STATUS_PAYMENT_APPROVED,eshop.OrderHelper.STATUS_TRANSMITTED,eshop.OrderHelper.STATUS_DELIVERED]) )}">
        <div style="display: block;background: #f4f4f4;border:1px solid #dddddd;border-radius: 4px;padding:5px;">
            <g:message code="actOnOrder"/>
        </div>
    </g:if>

    <form id="actionForm" style="margin-right: 10px;margin-bottom: 5px;">
        <g:hiddenField name="id" value="${order.id}"/>

    <g:if test="${actions.size() > 0}">
        <div>
            <br/>
            <g:if test="${order.status == eshop.OrderHelper.STATUS_PAID}">
                <g:render template="corrent_payment"/>
            </g:if>





                    <g:if test="${order.status == eshop.OrderHelper.STATUS_UPDATING || order.status == eshop.OrderHelper.STATUS_PAID }">
                        <div id="ValidityDateContainer">
                            <g:message code="order.inquiry.ValidityDate.label"/>

                            <rg:datePicker name="ValidityDate"/>

                            <input type="text" id="ValidityTime" name="ValidityTime" value="00:00"/>
                            <script>
                                $('#ValidityTime').timepicker();
                            </script>
                        </div>
                        <div id="invoiceTypeContainer">
                            <g:message code="order.invoiceType"/>:
                            <g:select name="invoiceType"
                                      valueMessagePrefix="order.invoiceType" from="${order.constraints.invoiceType.inList}"/>
                        </div>
                    </g:if>

                    <g:if test="${order.status == eshop.OrderHelper.STATUS_TRANSMITTED }">
                        <div id="deliveryTrackingCodeContainer">
                            <g:message code="order.deliveryTrackingCode"/>:
                            <g:textField name="deliveryTrackingCode"/>
                        </div>
                    </g:if>

                    <div>
                        <label for="description" style="margin:5px;">
                            <g:message code="description"/>
                        </label>
                    </div>

                    <div>
                        <textarea name="description" id="description" cols="100" rows="5"
                                  style="margin:0;display: block;"></textarea>
                    </div>

    </g:if>
    <div>
        <g:if test="${actions}">
            <g:each in="${actions}" var="action">
                <input type="button" onclick="actOnOrder('${action}');"
                       value='${message(code: "order.actions.${action}")}'/>
            </g:each>
        </g:if>
        <g:if test="${order.status == eshop.OrderHelper.STATUS_PAYMENT_APPROVED ||(grailsApplication.config.showFactorAfterDelivery && order.status in [eshop.OrderHelper.STATUS_PAYMENT_APPROVED,eshop.OrderHelper.STATUS_TRANSMITTED,eshop.OrderHelper.STATUS_DELIVERED]) }">
            <input type="button" onclick="printInvoice(${order.id});"
                   value='${message(code: "invoice.export.pdf.admin")}'/>
        </g:if>
    </div>
</form>
</div>
</div>

</div>
<script language="javascript" type="text/javascript">
    $(function () {
        $("#order-tabs").tabs({
            selected: 0
        });
    });
</script>
</body>
</html>