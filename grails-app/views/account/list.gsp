<%@ page import="eshop.accounting.Account" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}"/>
<title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
<rg:grid domainClass="${Account}"
         maxColumns="7"
         firstColumnWidth="30"
         showCommand="false"
         toolbarCommands="${[[caption: message(code: "add"), function: "addToAccountGrid", icon: "plus"]]}"
         commands="${[[handler: "addToAccountGrid(#id#)", icon: "application_edit"], [handler: "deleteAccount(#id#)", icon: "application_delete"]]}"/>
    <g:javascript>
        function deleteAccount(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#AccountGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToAccountGrid(id){
            var url = '<g:createLink action="form"/>';
            if(id)
                url+='/'+id
            loadOverlay(url,'<g:createLink action="save"/>',function(){
                $("#AccountGrid").trigger("reloadGrid")
            },function(){},{
            width:550});
        }
    </g:javascript>
    </div>
    </body>
    </html>
