<%@ page import="eshop.Vendor" %>
<g:set var="entityName" value="${message(code: 'vendor.label', default: 'Vendor')}"/>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${Vendor}"
             maxColumns="2"
        firstColumnWidth="10"
             showCommand="false"
        width="90%"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToVendorGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(controller: 'vendor', action: "form")}/#id#", saveAction: "${g.createLink(controller: 'vendor', action: "save")}", icon: "application_edit"], [handler: "deleteVendor(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="productType.id" value="${baseProductInstance.id}"/>
        </rg:criteria>
    </rg:grid>
    <script language="javascript" type="text/javascript">
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
            loadOverlay('<g:createLink controller="vendor" action="form"
                                       params="['productType.id': baseProductInstance.id]"/>','<g:createLink
            controller="vendor" action="save"/>',function(){
                $("#VendorGrid").trigger("reloadGrid")
            });
        }
    </script>
</div>
