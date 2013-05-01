<%@ page import="eshop.accounting.Transaction" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${Transaction}"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToTransactionGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#",saveAction:"${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deleteTransaction(#id#)", icon: "application_delete"]]}"
    />
    <g:javascript>
        function deleteTransaction(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#TransactionGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToTransactionGrid(){
            loadOverlay('<g:createLink action="form"/>','<g:createLink action="save" />',function(){
                $("#TransactionGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
</body>
</html>
