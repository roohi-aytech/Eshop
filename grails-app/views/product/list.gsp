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
                gridComplete="productTypeGridComplete"
                onSelectRow="loadProducts">
        </rg:grid>
    </div>
    <g:javascript>
        var curSelectedProductType=${ptid?:0}
        var loadProducts = function (rowId) {
            curSelectedProductType = rowId
            var criteria = "[{'op':'in', 'field':'productTypeIds', 'val':" + rowId + "}]"
            loadGridWithCriteria("MongoProductGrid", criteria)
        }
    </g:javascript>
    <div style="margin: 10px;">
        <div class="criteria-div">
            <rg:criteria>
            %{--<rg:alias name="product" value="pt"/>--}%
            %{--<rg:nest name="product">--}%
                <rg:like name="name" label='product.name'/>
            %{--</rg:nest>--}%
                <rg:filterGrid grid="MongoProductGrid" label='search'/>
            </rg:criteria>
        </div>
        <script type="text/javascript">
            $(".criteria-div")
                    .find('div,label,input')
                    .css('display', 'inline')
                    .css('margin', '3px');
        </script>
        <rg:grid domainClass="${eshop.mongo.MongoProduct}"
                 maxColumns="4"
                 showCommand="false"
                 firstColumnWidth="30"
                 columns="[[name: 'name'],[name: 'type'], [name: 'brand'], [name: 'productTypes'], [name: 'manufactureCountry']]"
                 toolbarCommands="${[[caption: message(code: "add"), function: "addToProductGrid", icon: "plus"]]}"
                 commands="${[[handler:'editProduct(#id#)', icon: "application_form"], [handler: "deleteProduct(#id#)", icon: "application_delete"]]}">
            <g:if test="${ptid}">
                <rg:criteria>
                    <rg:alias name="productTypes" value="productTypes"/>
                    <rg:inCrit name="productTypeIds" value="${ptid as Long}"/>
                </rg:criteria>
            </g:if>
        </rg:grid>
    </div>
</div>
<g:javascript>
    function editProduct(id){
        window.location='<g:createLink action="productDetails" controller="product"/>?id='+id+"&ptid="+curSelectedProductType
    }
    function deleteProduct(id){
         if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
            var url = "<g:createLink action="delete"/>";
            $.ajax({
                type:"POST",
                url:url,
                data:{ id:id }
            }).done(function (response) {
                if (response == "0") {
                    var grid = $("#MongoProductGrid");
                    grid.trigger('reloadGrid');
                }
                else {
                }
            });
        }
    }
    function addTree(){
        var buttons=$(".ui-dialog-content").dialog('option','buttons')
        var newButtons={'<g:message code="save-and-edit-details"/>':function(){
            var r= $(".ui-dialog-content")
            r.ajaxSubmit({
                url:r.attr('action'),
                type:"post",
                success:function(resp){
                    if(resp==0 || typeof resp == 'object'){
                        var r=$(".ui-dialog-content")
                        r.dialog("destroy");
                        r.remove()
                        window.location='<g:createLink controller="product" action="productDetails"/>/'+resp.id;
                    }else{
                        var r=$(".ui-dialog-content")
                        r.html(resp);
                        r.dialog("open");
                    }
                }
            })
            $(this).dialog("close");
        }}
        for(var button in buttons){
            newButtons[button]=buttons[button]
        }
        $(".ui-dialog-content").dialog('option','buttons',newButtons)

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
        window.location='<g:createLink action="productDetails"/>'
%{--loadOverlay('<g:createLink action="form"/>','<g:createLink action="save"/>',function(){--}%
%{--$("#ProductGrid").trigger("reloadGrid")--}%
%{--},addTree);--}%
    }
    <g:set var="pt" value="${eshop.ProductType.get(ptid)}"/>
    <g:set var="curptidx" value="${0}"/>
    function expandProductTypeNode(id){
        var g = $("#ProductTypeGrid")[0]
        var d = g.p.data[g.p._index[id]]
        $("#ProductTypeGrid").expandNode(d)
    }
    function productTypeLoadComplete(){
    <g:while test="${pt}">
        if(curProductTypeGridNodeReload==${curptidx}){
        <g:if test="${curptidx == 0}">
            $("#${pt.id}").click()
        </g:if>
        <g:else>
            expandProductTypeNode(${pt.id})
        </g:else>
        }
        <g:set var="pt" value="${pt.parentProduct}"/>
        <g:set var="curptidx" value="${curptidx + 1}"/>
    </g:while>
    curProductTypeGridNodeReload--;
    if(curProductTypeGridNodeReload>-1)
        setTimeout(productTypeLoadComplete,2000)
   }
   function productTypeGridComplete(){
        setTimeout(productTypeLoadComplete,2000)
   }
   var curProductTypeGridNodeReload=${curptidx - 1}
</g:javascript>
</body>
</html>
