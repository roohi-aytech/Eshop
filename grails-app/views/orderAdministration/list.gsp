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
    <g:set var="entityName" value="${message(code: "controlPanel.orders.yourOrders.${params.status}.label", default: 'Order')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div class="content scaffold-list" role="main">

    <rg:grid domainClass="${Order}"
             sortname="id"
             maxColumns="5"
             showCommand="false"
             commands="${[[handler: "viewOrder(#id#)", icon: "application_form"]]}"
    >
        <rg:criteria>
            <rg:inCrit name="id" value="${orderList}"/>
        </rg:criteria>
    </rg:grid>
</div>
</body>
</html>
