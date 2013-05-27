
<%@ page import="eshop.ProducerStaff" %>


<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${eshop.ProducerStaff}"
             maxColumns="8"
             showCommand="false"
             firstColumnWidth="30"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToProducerStaffGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "producerStaffForm", controller: "producer", params: [producerId: producerInstance.id])}&id=#id#",saveAction: "${g.createLink(action: "saveProducerStaff", controller: "producer")}", icon: "application_edit"], [handler: "deleteProducerStaff(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="producer.id" value="${producerInstance.id}"/>
        </rg:criteria>
    </rg:grid>

    <g:javascript>
function deleteProducerStaff(id){
     if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
        var url = "<g:createLink action="deleteProducerStaff" controller="producer"/>";
        $.ajax({
            type:"POST",
            url:url,
            data:{ id:id }
        }).done(function (response) {
            if (response == "0") {
                var grid = $("#ProducerStaffGrid");
                grid.trigger('reloadGrid');
            }
            else {
            }
        });
    }
}
function addToProducerStaffGrid(){
    loadOverlay('<g:createLink action="producerStaffForm" controller="producer"
                               params="[producerId: producerInstance.id]"/>','<g:createLink action="saveProducerStaff" controller="producer"/>',function(){
        $("#ProducerStaffGrid").trigger("reloadGrid")
    });
}
    </g:javascript>

</div>