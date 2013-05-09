<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 4/27/13
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="eshop.Order" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: "controlPanel.orders.yourOrders.${params.status}.label", default: 'Order')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">

    <rg:grid domainClass="${Order}"
             maxColumns="5"
             showCommand="false"
             commands="${[[handler: "viewOrder(#id#)", icon: "application_form"]]}"
    >
        <rg:criteria>
            <rg:eq name="status" value="${params.status}"/>
        </rg:criteria>
    </rg:grid>
    <g:javascript>
        function viewOrder(id){
             window.location.href = "${createLink(controller: 'orderAdministration', action:'act')}/" + id
        }
    </g:javascript>
</div>
</body>
</html>
