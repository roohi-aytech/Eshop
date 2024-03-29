<%--
  Created by IntelliJ IDEA.
  User: farzin
  Date: 7/25/13
  Time: 2:01 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="eshop.Order" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="orderAdministration.console"/></title>
    <link href="${resource(dir: 'css', file: 'jquery.tipsy.css')}" rel="stylesheet" type="text/css"/>
    <link href="${resource(dir: 'css', file: 'jquery-ui-timepicker-addon.css')}" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.tipsy.js')}" type="text/javascript"></script>
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery-ui-sliderAccess.js')}" type="text/javascript"></script>
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery-ui-timepicker-addon.js')}" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        function requestUrl(url, data){
            $("#orderListContentPane").html('<div style="text-align:center;padding-top:100px;"><img style="padding:5px;border:1px solid #dddddd;border-radius:4px;background-color:#ffffff;" class="loading" src="${resource(dir: 'images', file: 'loading.gif')}"/></div>');

            $.ajax({
                url:url,
                data:data,
                type:'POST'
            }).done(function (response) {
                $("#orderListContentPane").html(response);
            });
        }

        function loadOrderList(type){
        var url = '${createLink(action: 'list')}/' + type;
             requestUrl(url);
            $(".menuItem a").each(function(){
                $(this).css('background', $(this).attr('data-color'));
            });
            $(".menuItem a").css('color', '#48802C');
            $("#menuItem" + type + " a").css('background', '#48802C');
            $("#menuItem" + type + " a").css('color', '#ffffff');
        }

        function viewOrder(id){
             var url = "${createLink(controller: 'orderAdministration', action: 'act')}/" + id;
             requestUrl(url);
        }

        function actOnOrder(action){
            requestUrl(
                '${createLink(action: 'act')}_' + action,
                $('#actionForm').serialize()
            );
        }

        function correctPayment(){
            requestUrl(
                '${createLink(action: 'correctPayment')}',
                $('#correctPaymentForm').serialize()
            );
        }

        function histOnOrder(){
            requestUrl(
                    '${createLink(action: 'saveActionDescription')}',
                    $('#actionHistoryForm').serialize()
            );
        }

        function printInvoice(id){
            window.location.href = '${createLink(action: 'printInvoice')}/' + id;
        }

        function updatePrice(id){
            requestUrl(
                '${createLink(action: 'updatePrice')}',
                $('#updatePriceForm' + id).serialize()
            );
        }

        function updateCount(id){
            requestUrl(
                '${createLink(action: 'updateCount')}',
                $('#updateCountForm' + id).serialize()
            );
        }

        function updateProductModelStatus(id){
            requestUrl(
                '${createLink(action: 'updateProductModelStatus')}',
                $('#updateProductModelStatusForm' + id).serialize()
            );
        }


        $(document).ready(function () {
        <g:if test="${params.id}">
            <g:set var="selectedOrder" value="${Order.get(params.id)}"/>
            $(".menuItem a").each(function(){
                $(this).css('background', $(this).attr('data-color'));
            });
            $(".menuItem a").css('color', '#48802C');
            $("#menuItem${selectedOrder.status} a").css('background', '#48802C');
            $("#menuItem${selectedOrder.status} a").css('color', '#ffffff');
            viewOrder(${params.id});
        </g:if>
        <g:else>
            loadOrderList('${eshop.OrderHelper.STATUS_CREATED}');
        </g:else>
        })

    </script>
</head>

<body>
<h2><g:message code="orderAdministration.console"/></h2>
<table style="width:100%;direction: rtl;border-width:0;background-color: transparent;">
    <tr>
        <td style="width:160px;border-width:0;">
            <ul style="border:1px solid #dddddd;border-radius: 4px;background: white;">
                <g:each in="${grailsApplication.config.payOnCheckout?eshop.OrderHelper.STATUS_LIST_PAY_ON_CHECKOUT:eshop.OrderHelper.STATUS_LIST}">
                    <li style="text-align: right;margin:5px;list-style: none;" class="menuItem" id="menuItem${it}">
                        <a data-color="${message(code:"order.status.${it}.color", default: '#f8f8f8')}" style="padding:3px;text-align: right;display: block;background: ${message(code:"order.status.${it}.color", default: '#f8f8f8')};border-radius: 4px;"
                           onclick="loadOrderList('${it}')"><g:message code="order.status.${it}"/></a>
                    </li>
                </g:each>
                <li style="text-align: right;margin:5px;list-style-type: none;" class="menuItem" id="menuItemAll">
                    <a data-color="${message(code:"order.status.All.color", default: '#f8f8f8')}" style="padding:3px;text-align: right;display: block;background: ${message(code:"order.status.All.color", default: '#f8f8f8')};border-radius: 4px;"
                       onclick="loadOrderList('All')"><g:message code="order.status.All"/></a></li>
            </ul>
        </td>
        <td style="border-width:0;">
            <div id="orderListContentPane">
            </div>
        </td>
    </tr>
</table>
</body>
</html>