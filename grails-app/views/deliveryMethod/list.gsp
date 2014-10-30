<%@ page import="eshop.delivery.DeliveryMethod" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'deliveryMethod.label', default: 'DeliveryMethod')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${DeliveryMethod}"
             firstColumnWidth="30"
             maxColumns="3"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToDeliveryMethodGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#", saveAction: "${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deleteDeliveryMethod(#id#)", icon: "application_delete"],
                     [controller: "deliverySourceStation", action: "list", param: "deliveryMethod.id=#id#", icon: "application_form",title:"${message(code: "deliveryMethod.sourceStations")}"]]}"/>
    <script language="javascript" type="text/javascript">
        function deleteDeliveryMethod(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#DeliveryMethodGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToDeliveryMethodGrid(){
            loadOverlay('<g:createLink action="form"/>','<g:createLink action="save"/>',function(){
                $("#DeliveryMethodGrid").trigger("reloadGrid")
            });
        }
    </script>
</div>
</body>
</html>
