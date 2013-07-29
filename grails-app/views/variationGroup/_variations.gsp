<%@ page import="eshop.Product; eshop.VariationGroup; eshop.Variation" %>
<rg:grid domainClass="${Variation}"
         maxColumns="3"
         showCommand="false"
         toolbarCommands="${[[caption: message(code: "add"), function: "addToVariationGrid", icon: "plus"]]}"
         commands="${[[loadOverlay: "${g.createLink(action: "variationForm", controller: "variationGroup", params: [baseProductId: baseProductInstance.id])}&id=#id#", saveAction: "${g.createLink(action: "saveVariation", controller: "variationGroup")}", icon: "application_edit"], [handler: "deleteVariation(#id#)", icon: "application_delete"]]}">
    <rg:criteria>
        <rg:eq name="baseProduct.id" value="${baseProductInstance.id}"/>
    </rg:criteria>
</rg:grid>
<div ng-controller="variationGroupController">
    <rg:dialog id="variationGroup" title="${message(code: "variation")}">
        <rg:fields bean="${new VariationGroup()}">
            <rg:modify>
                <rg:ignoreField field="variations"/>
                <rg:hiddenReference field="productType"/>
            </rg:modify>
        </rg:fields>
        <rg:saveButton domainClass="${VariationGroup}" params="[saveCallback: 'variationGroupSaved']"/>
        <rg:cancelButton/>
    </rg:dialog>
    <input id="vgc-button" style="display: none;" type="button" value="${message(code: "new-variation-group")}"
           ng-click="openVariationGroupCreateDialog()">
    <g:javascript>
        function variationGroupSaved(){
            $.ajax({
                url:'<g:createLink action="variationGroups" controller="variationGroup"
                                   params="[baseProductId: baseProductInstance.id]"/>'
            }).success(function(resp){
                $("[name=variationGroup\\.id]").html("<option></option>")
                $(resp).each(function(){
                    $("[name=variationGroup\\.id]").append("<option value="+this.id+">"+this.name+"</option>")
                })
            })
        }
    </g:javascript>
</div>
<g:javascript>
function deleteVariation(id){
     if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
        var url = "<g:createLink action="deleteVariation" controller="variationGroup"/>";
        $.ajax({
            type:"POST",
            url:url,
            data:{ id:id }
        }).done(function (response) {
            if (response == "0") {
                var grid = $("#VariationGrid");
                grid.trigger('reloadGrid');
            }
            else {
            }
        });
    }
}
function addToVariationGrid(){
    loadOverlay('<g:createLink action="variationForm" controller="variationGroup"
                               params="[baseProductId: baseProductInstance.id]"/>','<g:createLink action="saveVariation"
                                                                                                  controller="variationGroup"/>',function(){
        $("#VariationGrid").trigger("reloadGrid")
    },undefined,{width:400});
}


 $(function(){
    $( "#variationGroup" ).on( "dialogopen", function( event, ui ) {
        setTimeout("$(\"input[name='productType.id']\").val(${baseProductInstance instanceof Product ? ((Product)baseProductInstance)?.productTypes?.toArray()?.first()?.id : baseProductInstance?.id})",100)
    } );
});
</g:javascript>

<fieldset class="buttons">

    <g:if test="${baseProductInstance instanceof eshop.Product}">
        <g:link class="list" controller="product" action="list" params="[ptid: ptid]"><g:message
                code="default.product.list" default="Product List"/></g:link>
    </g:if>
    <g:else>
        <g:link class="list" controller="productType" action="list"><g:message code="productType.list"
                                                                               default="Product List"/></g:link>
    </g:else>

</fieldset>
