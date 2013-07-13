<%@ page import="eshop.delivery.DeliveryTargetZone; eshop.delivery.DeliveryPricingRule" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'deliveryPricingRule.label', default: 'DeliveryPricingRule')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<g:set var="deliveryTargetZone" value="${DeliveryTargetZone.get(params["deliveryTargetZone.id"])}"/>
<h2>${deliveryTargetZone.sourceStation.method}: ${deliveryTargetZone.sourceStation}: ${deliveryTargetZone}: <g:message
        code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${DeliveryPricingRule}"
             firstColumnWidth="30"
             showCommand="false"
             columns="[[name: 'weightMin', formatoptions:[decimalPlaces:2]],[name: 'weightMax', formatoptions:[decimalPlaces:2]],[name: 'volumeMin', formatoptions:[decimalPlaces:2]],[name: 'volumeMax', formatoptions:[decimalPlaces:2]],[name: 'factor', formatoptions:[decimalPlaces:2]],[name: 'type']]"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToDeliveryPricingRuleGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#?deliveryTargetZone.id=${params["deliveryTargetZone.id"]}", saveAction: "${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deleteDeliveryPricingRule(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="targetZone.id" value="${params.deliveryTargetZone.id}"/>
        </rg:criteria>
    </rg:grid>
    <fieldset class="buttons">
        <a class="list"
           href="${createLink(controller: 'deliveryTargetZone', action: 'list', params: ['deliverySourceStation.id': deliveryTargetZone.sourceStation.id])}"><g:message
                code="deliveryTargetZone.list"/></a>
    </fieldset>
    <g:javascript>
        function deleteDeliveryPricingRule(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#DeliveryPricingRuleGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToDeliveryPricingRuleGrid(){
            loadOverlay('<g:createLink action="form"
                                       params="${['deliveryTargetZone.id': params["deliveryTargetZone.id"]]}"/>','<g:createLink
            action="save"/>',function(){
                $("#DeliveryPricingRuleGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
</body>
</html>
