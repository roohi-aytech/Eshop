<%@ page import="eshop.Accessory" %>
<rg:grid domainClass="${eshop.Accessory}"
         maxColumns="2"
         showCommand="false"
         toolbarCommands="${[[caption: message(code: "add"), function: "addToAccessoryGrid", icon: "plus"]]}"
         commands="${[[loadOverlay: "${g.createLink(action: "accessoryForm", controller: "product", params: [baseProductId: baseProductInstance.id])}&id=#id#",
                 saveAction: "${g.createLink(action: "saveAccessory", controller: "product")}", icon: "application_edit"],
                 [handler: "deleteAccessory(#id#)", icon: "application_delete"]]}">
    <rg:criteria>
        <rg:eq name="baseProduct.id" value="${baseProductInstance.id}"/>
    </rg:criteria>
</rg:grid>

<g:javascript>
function deleteAccessory(id){
     if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
        var url = "<g:createLink action="deleteAccessory" controller="product"/>";
        $.ajax({
            type:"POST",
            url:url,
            data:{ id:id }
        }).done(function (response) {
            if (response == "0") {
                var grid = $("#AccessoryGrid");
                grid.trigger('reloadGrid');
            }
            else {
            }
        });
    }
}
function addToAccessoryGrid(){
    loadOverlay('<g:createLink action="accessoryForm" controller="product"
                               params="[baseProductId: baseProductInstance.id]"/>','<g:createLink action="saveAccessory"
                                                                                                  controller="product"/>',function(){
        $("#AccessoryGrid").trigger("reloadGrid")
    });
}
</g:javascript>

<fieldset class="buttons">

    <g:if test="${baseProductInstance instanceof eshop.Product}">
        <g:link class="list" controller="product" action="list"  params="[ptid:ptid]"><g:message code="default.product.list" default="Product List"/></g:link>
    </g:if>
    <g:else>
        <g:link class="list" controller="productType" action="list"><g:message code="productType.list" default="Product List"/></g:link>
    </g:else>

</fieldset>
