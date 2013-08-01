<%@ page import="eshop.accounting.AccountFilter;" %>
<g:set var="entityName" value="${message(code: 'accountFilter.label', default: 'AccountFilter')}"/>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${eshop.accounting.AccountFilter}"
             maxColumns="2"
             firstColumnWidth="10"
             showCommand="false"
             width="90%"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToAccountFilterGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(controller: 'accountFilter', action: "form")}/#id#", saveAction: "${g.createLink(controller: 'accountFilter', action: "save")}", icon: "application_edit"], [handler: "deleteAccountFilter(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="productType.id" value="${baseProductInstance.id}"/>
        </rg:criteria>
    </rg:grid>
    <g:javascript>
        function deleteAccountFilter(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink controller="accountFilter" action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#AccountFilterGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToAccountFilterGrid(){
            loadOverlay('<g:createLink controller="accountFilter" action="form"
                                       params="['productType.id': baseProductInstance.id]"/>','<g:createLink
            controller="accountFilter" action="save"/>',function(){
                $("#AccountFilterGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
