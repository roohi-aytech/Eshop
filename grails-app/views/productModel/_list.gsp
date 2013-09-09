<%@ page import="eshop.ProductModel;" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'productModel.label', default: 'ProductModel')}"/>
</head>

<body>
<script language="javascript" src="${resource(dir: 'js', file: 'jquery.quickselect.pack.js')}" type="text/javascript"></script>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<g:set var="actions" value="[]"/>
<sec:ifAllGranted roles="${eshop.RoleHelper.ROLE_PRODUCT_TYPE_ADMIN}">
    <g:set var="actions" value="${[[handler: "deleteProductModel(#id#)", icon: "application_delete"],
            [loadOverlay: "${g.createLink(action: "form",controller: "productModel", params: ['product.id': productInstance.id])}&id=#id#",saveAction:"${g.createLink(action: "save",controller: "productModel")}", icon: "application_edit"],
            [controller: "productModel", action: "productModelDetails", param: "id=#id#", icon: "application_form",title:"${message(code: "productModel-details")}"],
            ]}"/>

</sec:ifAllGranted>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${ProductModel}"
             showCommand="false"
             firstColumnWidth="50"
             maxColumns="9"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToProductModelGrid", icon: "plus"]]}"
             commands="${actions}">
        <rg:criteria>
            <rg:eq name="product.id" value="${productInstance.id}"/>
        </rg:criteria>
    </rg:grid>
    <g:javascript>
        function deleteProductModel(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete" controller="productModel"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#ProductModelGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToProductModelGrid(){
            loadOverlay('<g:createLink controller="productModel" action="form" params="['product.id': productInstance.id]"/>','<g:createLink action="save" controller="productModel"/>',function(){
                $("#ProductModelGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
