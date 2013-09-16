<%@ page import="eshop.AddedValue" %>


<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${AddedValue}"
             showCommand="false"
             maxColumns="5"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToAddedValueGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form",controller: "addedValue")}/#id#",saveAction:"${g.createLink(action: "save",controller: "addedValue")}", icon: "application_edit"], [handler: "deleteAddedValue(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="baseProduct.id" value="${baseProductInstance?.id}"/>
        </rg:criteria>
    </rg:grid>
    <script language="javascript" type="text/javascript">
        function deleteAddedValue(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete" controller="addedValue"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#AddedValueGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToAddedValueGrid(){
            loadOverlay('<g:createLink action="form" controller="addedValue" params="['baseProduct.id':baseProductInstance?.id]"/>','<g:createLink action="save"  controller="addedValue"/>',function(){
                $("#AddedValueGrid").trigger("reloadGrid")
            });
        }
    </script>
</div>

