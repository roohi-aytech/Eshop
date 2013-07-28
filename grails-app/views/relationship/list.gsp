<%@ page import="eshop.Relationship" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'relationship.label', default: 'Relationship')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${Relationship}"
             maxColumns="2"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToRelationshipGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#", saveAction: "${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deleteRelationship(#id#)", icon: "application_delete"]]}"/>
    <g:javascript>
        function deleteRelationship(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#RelationshipGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToRelationshipGrid(){
            loadOverlay('<g:createLink action="form"/>','<g:createLink action="save"/>',function(){
                $("#RelationshipGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
</body>
</html>
