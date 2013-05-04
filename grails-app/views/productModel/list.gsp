<%@ page import="eshop.ProductModel" %>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${ProductModel}"
             showCommand="false"
             maxColumns="9"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToProductModelGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form",controller: "productModel", params: ['product.id': productModelInstance.id])}&id=#id#",saveAction:"${g.createLink(action: "save",controller: "productModel")}", icon: "application_edit"], [handler: "deleteProductModel(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="product.id" value="${productModelInstance.id}"/>
        </rg:criteria>
    </rg:grid>
    <g:javascript>
        function deleteProductModel(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete" controller="productModel"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#ProductModelGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToProductModelGrid(){
            loadOverlay('<g:createLink controller="productModel" action="form" params="['product.id': productModelInstance.id]"/>','<g:createLink action="save" controller="productModel"/>',function(){
                $("#ProductModelGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
