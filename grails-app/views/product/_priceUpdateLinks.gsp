<%@ page import="eshop.PricingLink;eshop.AddedValue" %>


<div class="content scaffold-list" role="main">
    <g:set var="actions"
           value="${[[loadOverlay: "${g.createLink(action: "form", controller: "pricingLink")}/#id#?productId=${baseProductInstance?.id}", saveAction: "${g.createLink(action: "save", controller: "pricingLink")}", icon: "application_edit"], [handler: "deleteLink(#id#)", icon: "application_delete"]]}"/>
    <rg:grid domainClass="${PricingLink}"
             showCommand="false"
             maxColumns="3"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToLinksGrid", icon: "plus"]]}"
             commands="${actions}">
        <rg:criteria>
            <rg:eq name="product.id" value="${baseProductInstance.id}"/>
        </rg:criteria>
    </rg:grid>
    <rg:dialog id="edit_photoes_addedValue">

    </rg:dialog>
    <script language="javascript" type="text/javascript">
        function deleteLink(id) {
            if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete" controller="pricingLink"/>";
                $.ajax({
                    type: "POST",
                    url: url,
                    data: { id: id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#PricingLinkGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToLinksGrid() {
            loadOverlay('<g:createLink action="form" controller="pricingLink" params="['productId':baseProductInstance?.id]"/>', '<g:createLink action="save"  controller="pricingLink"/>', function () {
                $("#PricingLinkGrid").trigger("reloadGrid")
            });
        }
    </script>
</div>

