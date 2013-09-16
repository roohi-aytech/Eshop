<%@ page import="eshop.CultureEvent" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cultureEvent.label', default: 'CultureEvent')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${CultureEvent}"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToCultureEventGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#",saveAction:"${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deleteCultureEvent(#id#)", icon: "application_delete"]]}"
    />
    <script language="javascript" type="text/javascript">
        function deleteCultureEvent(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#CultureEventGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToCultureEventGrid(){
            loadOverlay('<g:createLink action="form"/>','<g:createLink action="save" />',function(){
                $("#CultureEventGrid").trigger("reloadGrid")
            });
        }
    </script>
</div>
</body>
</html>
