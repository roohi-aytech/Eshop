<%@ page import="eshop.Price" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'price.label', default: 'Price')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
%{--<h2><g:message code="default.manage.label" args="[entityName]"/></h2>--}%

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${Price}"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToPriceGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form",controller: "price", params: ['product.id': productInstance.id])}&id=#id#",saveAction:"${g.createLink(action: "save",controller: "price")}", icon: "application_edit"], [handler: "deletePrice(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="product.id" value="${productInstance.id}"/>
        </rg:criteria>
    </rg:grid>
    <g:javascript>
        function deletePrice(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete" controller="price"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#PriceGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToPriceGrid(){
            loadOverlay('<g:createLink controller="price" action="form" params="['product.id': productInstance.id]"/>','<g:createLink action="save" controller="price"/>',function(){
                $("#PriceGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
</body>
</html>
