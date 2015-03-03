<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 4/27/13
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="grails.converters.JSON; eshop.Order" %>
<!doctype html>
<html>
<head>
    <g:set var="entityName"
           value="${message(code: "controlPanel.orders.yourOrders.${params.status}.label", default: 'Order')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div class="content scaffold-list" role="main">
    <div class="criteria-div" style="text-align: right;margin-bottom:5px;">
        <rg:criteria>
            <rg:eq name="trackingCode" label="order.trackingCode"/>
            <rg:like name="ownerName" label="order.ownerName"/>
            <rg:like name="ownerEmail" label="order.ownerEmail"/>
            <rg:like name="ownerMobile" label="order.ownerMobile"/>
            <g:if test="${params.status != 'All'}">
                <rg:like name="status" label="order.status"/>
            </g:if>
            <rg:filterGrid grid="OrderGrid" label='search'/>
        </rg:criteria>
    </div>
    <script type="text/javascript">
        $(".criteria-div")
                .find('div,label,input')
                .css('display', 'inline')
                .css('margin', '3px');
        $(".criteria-div fieldset").css('margin', '0px');
        $("#criteria_").css('margin', '0px');
        $(".criteria-div #status").val('${params.status}');
        $(".criteria-div #status").parent().css('display', 'none');
    </script>
    <rg:grid domainClass="${Order}"
             sortname="lastActionDate"
             sortorder="desc"
             showCommand="false"
             columns="[[name: 'trackingCode'], [name: 'ownerName'], [name: 'productsName', width: '300px', sortable:false], [name: 'ownerMobile'], [name: 'deliveryMethodName', sortable:false], [name: 'deliveryCityName', sortable:false], [name: 'status'], [name: 'lastActionDate', expression: 'rg.formatJalaliDate(date:  obj[\\\'lastActionDate\\\'], hm:\\\'true\\\' )']]"
             commands="${[[handler: "viewOrder(#id#)", icon: "application_form"]]}">
             %{--source="${[service: "orderTracking", method: "filterOrderListForUser", params: [user: user, status: status]]}">--}%
    <rg:criteria>
    <rg:inCrit name="id" value="${orderList}"/>
    </rg:criteria>
    </rg:grid>
</div>
</body>
</html>
