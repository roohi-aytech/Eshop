<%@ page import="eshop.ProducerAccount" %>
<style>
#content table tbody td {
    direction: ltr !important;
}
</style>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${eshop.ProducerAccount}"
             maxColumns="7"
             showCommand="false"
             firstColumnWidth="30"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToProducerAccountGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "producerAccountForm", controller: "producer", params: [producerId: producerInstance.id])}&id=#id#", saveAction: "${g.createLink(action: "saveProducerAccount", controller: "producer")}", icon: "application_edit"], [handler: "deleteProducerAccount(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="producer.id" value="${producerInstance.id}"/>
        </rg:criteria>
    </rg:grid>

    <script language="javascript" type="text/javascript">
function deleteProducerAccount(id){
     if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
        var url = "<g:createLink action="deleteProducerAccount" controller="producer"/>";
        $.ajax({
            type:"POST",
            url:url,
            data:{ id:id }
        }).done(function (response) {
            if (response == "0") {
                var grid = $("#ProducerAccountGrid");
                grid.trigger('reloadGrid');
            }
            else {
            }
        });
    }
}
function addToProducerAccountGrid(){
    loadOverlay('<g:createLink action="producerAccountForm" controller="producer"
                               params="[producerId: producerInstance.id]"/>','<g:createLink action="saveProducerAccount"
                                                                                            controller="producer"/>',function(){
        $("#ProducerAccountGrid").trigger("reloadGrid")
    });
}
    </script>

</div>