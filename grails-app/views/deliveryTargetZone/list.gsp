<%@ page import="eshop.delivery.DeliverySourceStation; eshop.delivery.DeliveryTargetZone" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'deliveryTargetZone.label', default: 'DeliveryTargetZone')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<g:set var="deliverySourceStation" value="${DeliverySourceStation.get(params["deliverySourceStation.id"])}"/>
<h2>${deliverySourceStation.method}: ${deliverySourceStation}: <g:message code="default.manage.label"
                                                                          args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${DeliveryTargetZone}"
             firstColumnWidth="30"
             maxColumns="2"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToDeliveryTargetZoneGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#?deliverySourceStation.id=${params["deliverySourceStation.id"]}", saveAction: "${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deleteDeliveryTargetZone(#id#)", icon: "application_delete"],
                     [controller: "deliveryPricingRule", action: "list", param: "deliveryTargetZone.id=#id#", icon: "application_form", title: "${message(code: "deliveryTargetZone.pricingRules")}"]]}">
        <rg:criteria>
            <rg:eq name="sourceStation.id" value="${params.deliverySourceStation.id}"/>
        </rg:criteria>
    </rg:grid>
    <fieldset class="buttons">
        <a class="list"
           href="${createLink(controller: 'deliverySourceStation', action: 'list', params: ['deliveryMethod.id': deliverySourceStation.method.id])}"><g:message
                code="deliverySourceStation.list"/></a>
    </fieldset>
    <g:javascript>
        function deleteDeliveryTargetZone(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#DeliveryTargetZoneGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToDeliveryTargetZoneGrid(){
            loadOverlay('<g:createLink action="form"
                                       params="${['deliverySourceStation.id': params["deliverySourceStation.id"]]}"/>','<g:createLink
            action="save"/>',function(){
                $("#DeliveryTargetZoneGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
</body>
</html>
