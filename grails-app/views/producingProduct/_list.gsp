
<%@ page import="eshop.ProducingProduct" %>


<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${eshop.ProducingProduct}"
             maxColumns="6"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToProducingProductGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form", controller: "producingProduct", params: [producerId: producerInstance.id])}&id=#id#",saveAction: "${g.createLink(action: "save", controller: "producingProduct")}", icon: "application_edit"], [handler: "deleteProducingProduct(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="producer.id" value="${producerInstance.id}"/>
        </rg:criteria>
    </rg:grid>

<g:javascript>
function deleteProducingProduct(id){
     if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
        var url = "<g:createLink action="deleteProducingProduct" controller="producingProduct"/>";
        $.ajax({
            type:"POST",
            url:url,
            data:{ id:id }
        }).done(function (response) {
            if (response == "0") {
                var grid = $("#ProducingProductGrid");
                grid.trigger('reloadGrid');
            }
            else {
            }
        });
    }
}
function addToProducingProductGrid(){
    loadOverlay('<g:createLink action="form" controller="producingProduct"
                               params="[producerId: producerInstance.id]"/>','<g:createLink action="save" controller="producingProduct"/>',function(){
        $("#ProducingProductGrid").trigger("reloadGrid")
    });
}
</g:javascript>

</div>