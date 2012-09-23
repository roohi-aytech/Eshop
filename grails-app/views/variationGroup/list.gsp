<%@ page import="eshop.VariationGroup" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'variationGroup.label', default: 'VariationGroup')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${VariationGroup}"
             maxColumns="3"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#",saveAction:"${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deleteVariationGroup(#id#)", icon: "application_delete"]]}"
    />
    <g:javascript>
        function deleteVariationGroup(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
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
        function addToGrid(){
            loadOverlay('<g:createLink action="form"/>','<g:createLink action="save" />',function(){
                $("#VariationGroupGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
</body>
</html>
