<%@ page import="eshop.VariationGroup" %>

<g:set var="entityName" value="${message(code: 'variationGroup.label', default: 'VariationGroup')}"/>

<div class="content scaffold-list" ng-controller="variationGroupController" role="main">
    <rg:grid domainClass="${VariationGroup}"
             maxColumns="2"
             showCommand="false"
             commands="${[[handler: "deleteVariationGroup(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="productType.id" value="${params.id}"/>
        </rg:criteria>
    </rg:grid>
    <rg:dialog id="variationGroup" title="${message(code: "variation")}">
        <rg:fields bean="${new VariationGroup()}">
            <rg:modify>
                <rg:ignoreField field="variations"/>
                <rg:hiddenReference field="productType"/>
            </rg:modify>
        </rg:fields>
        <rg:saveButton domainClass="${VariationGroup}"/>
        <rg:cancelButton/>
    </rg:dialog>
    <input type="button" ng-click="window.alert('ok');openVariationGroupCreateDialog();" value="<g:message code="new"/>"/>
    <input type="button" ng-click="openVariationGroupEditDialog()" value="<g:message code="edit"/>"/>
    <script language="javascript" type="text/javascript">

        function deleteVariationGroup(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink controller="variationGroup" action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#VariationGroupGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }


         $(function(){
            $( "#variationGroup" ).on( "dialogopen", function( event, ui ) {
                setTimeout("$(\"input[name='productType.id']\").val(${params.id})",100)
            } );
        });
    </script>
</div>
