<%=packageName%>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="\${${className}}"
             showCommand="false"
             toolbarCommands="\${[[caption: message(code: "add"), function: "addTo${className}Grid", icon: "plus"]]}"
             commands="\${[[loadOverlay: "\${g.createLink(action: "form")}/#id#",saveAction:"\${g.createLink(action: "save")}", icon: "application_edit"], [handler: "delete${className}(#id#)", icon: "application_delete"]]}"
    />
    <script language="javascript" type="text/javascript">
        function delete${className}(id){
             if (confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                \$.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = \$("#${className}Grid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addTo${className}Grid(){
            loadOverlay('<g:createLink action="form"/>','<g:createLink action="save" />',function(){
                \$("#${className}Grid").trigger("reloadGrid")
            });
        }
    </script>
</div>
</body>
</html>
