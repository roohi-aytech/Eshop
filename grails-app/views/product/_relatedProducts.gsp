<%@ page import="eshop.RelatedProduct" %>
<rg:grid domainClass="${eshop.RelatedProduct}"
         maxColumns="3"
         showCommand="false"
         toolbarCommands="${[[caption: message(code: "add"), function: "addToRelatedProductGrid", icon: "plus"]]}"
         commands="${[[loadOverlay: "${g.createLink(action: "relatedProductForm", controller: "product", params: [baseProductId: baseProductInstance.id])}&id=#id#",
                 saveAction: "${g.createLink(action: "saveRelatedProduct", controller: "product")}", icon: "application_edit"],
                 [handler: "deleteRelatedProduct(#id#)", icon: "application_delete"]]}">
    <rg:criteria>
        <rg:eq name="baseProduct.id" value="${baseProductInstance.id}"/>
    </rg:criteria>
</rg:grid>

<g:javascript>
function deleteRelatedProduct(id){
     if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
        var url = "<g:createLink action="deleteRelatedProduct" controller="product"/>";
        $.ajax({
            type:"POST",
            url:url,
            data:{ id:id }
        }).done(function (response) {
            if (response == "0") {
                var grid = $("#RelatedProductGrid");
                grid.trigger('reloadGrid');
            }
            else {
            }
        });
    }
}
function addToRelatedProductGrid(){
    loadOverlay('<g:createLink action="relatedProductForm" controller="product"
                               params="[baseProductId: baseProductInstance.id]"/>','<g:createLink action="saveRelatedProduct"
                                                                                                  controller="product"/>',function(){
        $("#RelatedProductGrid").trigger("reloadGrid")
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
