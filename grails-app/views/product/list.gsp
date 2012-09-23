<%@ page import="eshop.ProductType; eshop.Product" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div id="list-product" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div style="margin: 10px;">
    <rg:grid
            domainClass="${ProductType}"
            maxColumns="5"
            tree="parentProduct"
            showFirstColumn="false"
            onSelectRow="loadProducts">
    </rg:grid>
    </div>
    <g:javascript>
        var loadProducts = function (rowId) {
            var criteria = '[{\'op\':\'createAlias\', \'field\':\'productTypes\', \'val\':\'pt\'}, {\'op\':\'eq\', \'field\':\'pt.id\', \'val\':\'' + rowId + '\'}]'
            loadGridWithCriteria("ProductGrid", criteria)
        }
    </g:javascript>
    <div style="margin: 10px;">
    <rg:grid domainClass="${Product}"
             maxColumns="5"
             showCommand="false"
             firstColumnWidth="30"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToProductGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#",saveAction:"${g.createLink(action: "save")}",loadCallback:"addTree", icon: "application_edit"], [controller: "product", action: "productDetails", param: "id=#id#", icon: "application_form"], [handler: "deleteProduct(#id#)", icon: "application_delete"]]}">
    </rg:grid>
    </div>
</div>
<g:javascript>
    function deleteProduct(id){
         if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
            var url = "<g:createLink action="delete"/>";
            $.ajax({
                type:"POST",
                url:url,
                data:{ id:id }
            }).done(function (response) {
                if (response == "0") {
                    var grid = $("#ProductGrid");
                    grid.trigger('reloadGrid');
                }
                else {
                }
            });
        }
    }
    function addTree(){
        var productTypeTree = $("#productTypes").jstree({
                plugins : ["themes","json_data","checkbox"],
                core : {
                    load_open: true,
                    rtl: true
                },
                checkbox:{
                    two_state:true
                },
                themes:{
                    theme: "default-rtl",
                    icons: false
                },
                json_data:{
                    ajax:{
                        cache: false,
                        url:'<g:createLink action="getProductTypes" controller="ProductType"/>',
                        type:'POST'
                    }
                }
            });
            productTypeTree.bind("loaded.jstree refresh.jstree", function (event, data) {
//                productTypeTree.jstree("open_all");
                var productTypes=$("[name=producttypes]").val().split(",");
                $(productTypes).each(function(index){
                    productTypeTree.jstree('check_node',"#"+productTypes[index])
                })

            });
            productTypeTree.bind("change_state.jstree", function (e, d) {
                var tagName = d.args[0].tagName;
                var refreshing = d.inst.data.core.refreshing;
                if ((tagName == "A" || tagName == "INS") &&
                  (refreshing != true && refreshing != "undefined")) {
                    var checked = productTypeTree.jstree("get_checked");
                    var checkIds=checked.map(function(){return this.id}).get().join()
                    $("[name=producttypes]").val(checkIds)
                }
            });

    }
    function addToProductGrid(){
        loadOverlay('<g:createLink action="form"/>','<g:createLink action="save" />',function(){
            $("#ProductGrid").trigger("reloadGrid")
        },addTree);
    }
</g:javascript>
</body>
</html>
