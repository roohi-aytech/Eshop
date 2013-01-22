<%@ page import="eshop.PageDetails" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'pageDetails.label', default: 'PageDetails')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${PageDetails}"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToPageDetailsGrid", icon: "plus"]]}"
             commands="${[[handler:'addToPageDetailsGrid(#id#)', icon: "application_edit"], [handler: "deletePageDetails(#id#)", icon: "application_delete"]]}"
    />
    <g:javascript>
        function deletePageDetails(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#PageDetailsGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToPageDetailsGrid(id){
            var url='<g:createLink action="form"/>'
             if(id)
                url+="/"+id
            loadOverlay(url,'<g:createLink action="save" />',function(){
                $("#PageDetailsGrid").trigger("reloadGrid")
            },undefined,{
                width:400
            });
        }
    </g:javascript>
</div>
</body>
</html>
