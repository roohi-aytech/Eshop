<%@ page import="eshop.Vendor" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'vendor.label', default: 'Vendor')}"/>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${Vendor}"
             maxColumns="2"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToVendorGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(controller: 'vendor', action: "form")}/#id#", saveAction: "${g.createLink(controller: 'vendor', action: "save")}", icon: "application_edit"], [handler: "deleteVendor(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="productType.id" value="${baseProductInstance.id}"/>
        </rg:criteria>
    </rg:grid>
    <g:javascript>
        function deleteVendor(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink controller="vendor" action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#VendorGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToVendorGrid(){
            loadOverlay('<g:createLink controller="vendor" action="form" params="['productType.id': baseProductInstance.id]"/>','<g:createLink controller="vendor" action="save"/>',function(){
                $("#VendorGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
</body>
</html>
