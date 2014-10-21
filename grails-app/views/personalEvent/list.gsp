<%@ page import="eshop.PersonalEvent" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'personalEvent.label', default: 'PersonalEvent')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${PersonalEvent}"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToPersonalEventGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#",saveAction:"${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deletePersonalEvent(#id#)", icon: "application_delete"]]}"
    />
    <script language="javascript" type="text/javascript">
        function deletePersonalEvent(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#PersonalEventGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToPersonalEventGrid(){
            loadOverlay('<g:createLink action="form"/>','<g:createLink action="save" />',function(){
                $("#PersonalEventGrid").trigger("reloadGrid")
            });
        }
    </script>
</div>
</body>
</html>
