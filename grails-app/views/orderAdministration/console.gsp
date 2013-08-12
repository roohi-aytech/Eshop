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
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.tipsy.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui-timepicker-addon.css')}" type="text/css">
    <g:javascript src="jquery.tipsy.js"/>
    <g:javascript src="jquery-ui-sliderAccess.js"/>
    <g:javascript src="jquery-ui-timepicker-addon.js"/>
    <g:javascript>
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
            $(".menuItem a").css('background', '#f8f8f8');
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

        function updatePrice(id){
            requestUrl(
                '${createLink(action: 'updatePrice')}',
                $('#updatePriceForm' + id).serialize()
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
            $(".menuItem a").css('background', '#f8f8f8');
            $(".menuItem a").css('color', '#48802C');
            $("#menuItem${selectedOrder.status} a").css('background', '#48802C');
            $("#menuItem${selectedOrder.status} a").css('color', '#ffffff');
            viewOrder(${params.id});
        </g:if>
        <g:else>
            loadOrderList('${eshop.OrderHelper.STATUS_CREATED}');
        </g:else>
        })

    </g:javascript>
</head>

<body>
<h2><g:message code="orderAdministration.console"/></h2>
<table style="width:100%;direction: rtl;border-width:0;background-color: transparent;">
    <tr>
        <td style="width:160px;border-width:0;">
            <ul style="border:1px solid #dddddd;border-radius: 4px;background: white;">
                <g:each in="${eshop.OrderHelper.STATUS_LIST}">
                    <li style="text-align: right;margin:5px;" class="menuItem" id="menuItem${it}">
                        <a style="padding:3px;text-align: right;display: block;background: #f8f8f8;border-radius: 4px;"
                           onclick="loadOrderList('${it}')"><g:message code="order.status.${it}"/></a>
                    </li>
                </g:each>
                <li style="text-align: right;margin:5px;" class="menuItem" id="menuItemAll">
                    <a style="padding:3px;text-align: right;display: block;background: #f8f8f8;border-radius: 4px;"
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