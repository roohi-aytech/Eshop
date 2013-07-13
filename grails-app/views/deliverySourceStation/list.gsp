<%@ page import="eshop.delivery.DeliverySourceStation" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'deliverySourceStation.label', default: 'DeliverySourceStation')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2>${eshop.delivery.DeliveryMethod.get(params.deliveryMethod.id)}: <g:message code="default.manage.label"
                                                                               args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${DeliverySourceStation}"
             firstColumnWidth="30"
             maxColumns="4"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToDeliverySourceStationGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#?method.id=${params["deliveryMethod.id"]}", saveAction: "${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deleteDeliverySourceStation(#id#)", icon: "application_delete"],
                     [controller: "deliveryTargetZone", action: "list", param: "deliverySourceStation.id=#id#", icon: "application_form", title: "${message(code: "deliverySourceStation.targetZones")}"]]}">
        <rg:criteria>
            <rg:eq name="method.id" value="${params.deliveryMethod.id}"/>
        </rg:criteria>
    </rg:grid>
    <fieldset class="buttons">
        <a class="list" href="${createLink(controller: 'deliveryMethod', action: 'list')}"><g:message
                code="navigation.manage.deliveryMethods"/></a>
    </fieldset>
    <g:javascript>
        function deleteDeliverySourceStation(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#DeliverySourceStationGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToDeliverySourceStationGrid(){
            loadOverlay('<g:createLink action="form"
                                       params="${['method.id': params["deliveryMethod.id"]]}"/>','<g:createLink
            action="save"/>',function(){
                $("#DeliverySourceStationGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
</body>
</html>
