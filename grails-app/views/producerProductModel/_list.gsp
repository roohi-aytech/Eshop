<%@ page import="eshop.ProducerProductModel" %>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${ProducerProductModel}"
             showCommand="false"
             maxColumns="5"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToProducerProductModelGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form",controller: "producerProductModel", params: ['productModel.id': productModelInstance.id])}&id=#id#",saveAction:"${g.createLink(action: "save",controller: "producerProductModel")}", icon: "application_edit"], [handler: "deleteProducerProductModel(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="productModel.id" value="${productModelInstance.id}"/>
        </rg:criteria>
    </rg:grid>
    <g:javascript>
        function deleteProducerProductModel(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete" controller="producerProductModel"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#ProducerProductModelGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToProducerProductModelGrid(){
            loadOverlay('<g:createLink controller="producerProductModel" action="form" params="['productModel.id': productModelInstance.id]"/>','<g:createLink action="save" controller="producerProductModel"/>',function(){
                $("#ProducerProductModelGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
