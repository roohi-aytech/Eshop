<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 4/30/13
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="eshop.ProducerVariations" %>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${ProducerVariations}"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToProducerVariationsGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form",controller: "producerVariations", params: ['product.id': productInstance.id])}&id=#id#",saveAction:"${g.createLink(action: "save",controller: "producerVariations")}", icon: "application_edit"], [handler: "deleteProducerVariations(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="product.id" value="${productInstance.id}"/>
        </rg:criteria>
    </rg:grid>
    <g:javascript>
        function deleteProducerVariations(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete" controller="producerVariations"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#ProducerVariationsGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToProducerVariationsGrid(){
            loadOverlay('<g:createLink controller="producerVariations" action="form" params="['product.id': productInstance.id]"/>','<g:createLink action="save" controller="producerVariations"/>',function(){
                $("#ProducerVariationsGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
