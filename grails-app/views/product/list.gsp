<%@ page import="eshop.ProductType; eshop.Product" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <style>
    td[aria-describedby='ProductGrid_name'] {
        direction: ltr;
    }
    </style>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>
<script type="text/javascript">
    function productTypeGridComplete() {
        setTimeout(productTypeLoadComplete, 400)
    }
    function editProduct(id) {
        window.location = '<g:createLink action="productDetails" controller="product"/>?id=' + id + "&ptid=" + curSelectedProductType
    }
    function deleteProduct(id) {
        if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
            var url = "<g:createLink action="delete"/>";
            $.ajax({
                type: "POST",
                url: url,
                data: { id: id }
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
    function addTree() {
        var buttons = $(".ui-dialog-content").dialog('option', 'buttons')
        var newButtons = {'<g:message code="save-and-edit-details"/>': function () {
            var r = $(".ui-dialog-content")
            r.ajaxSubmit({
                url: r.attr('action'),
                type: "post",
                success: function (resp) {
                    if (resp == 0 || typeof resp == 'object') {
                        var r = $(".ui-dialog-content")
                        r.dialog("destroy");
                        r.remove()
                        window.location = '<g:createLink controller="product" action="productDetails"/>/' + resp.id;
                    } else {
                        var r = $(".ui-dialog-content")
                        r.html(resp);
                        r.dialog("open");
                    }
                }
            })
            $(this).dialog("close");
        }}
        for (var button in buttons) {
            newButtons[button] = buttons[button]
        }
        $(".ui-dialog-content").dialog('option', 'buttons', newButtons)

        var productTypeTree = $("#productTypes").jstree({
            plugins: ["themes", "json_data", "checkbox"],
            core: {
                load_open: true,
                rtl: true
            },
            checkbox: {
                two_state: true
            },
            themes: {
                theme: "default-rtl",
                icons: false
            },
            json_data: {
                ajax: {
                    cache: false,
                    url: '<g:createLink action="getProductTypes" controller="ProductType"/>',
                    type: 'POST'
                }
            }
        });
        productTypeTree.bind("loaded.jstree refresh.jstree", function (event, data) {
//                productTypeTree.jstree("open_all");
            var productTypes = $("[name=producttypes]").val().split(",");
            $(productTypes).each(function (index) {
                productTypeTree.jstree('check_node', "#" + productTypes[index])
            })

        });
        productTypeTree.bind("change_state.jstree", function (e, d) {
            var tagName = d.args[0].tagName;
            var refreshing = d.inst.data.core.refreshing;
            if ((tagName == "A" || tagName == "INS") &&
                    (refreshing != true && refreshing != "undefined")) {
                var checked = productTypeTree.jstree("get_checked");
                var checkIds = checked.map(function () {
                    return this.id
                }).get().join()
                $("[name=producttypes]").val(checkIds)
            }
        });

    }
    function addToProductGrid() {
        window.location = '<g:createLink action="productDetails"/>'
        %{--loadOverlay('<g:createLink action="form"/>','<g:createLink action="save"/>',function(){--}%
        %{--$("#ProductGrid").trigger("reloadGrid")--}%
        %{--},addTree);--}%
    }
    <g:set var="pt" value="${eshop.ProductType.get(ptid)}"/>
    <g:set var="curptidx" value="${0}"/>
    function expandProductTypeNode(id) {
        var g = $("#ProductTypeGrid")[0]
        var d = g.p.data[g.p._index[id]]
        $("#ProductTypeGrid").expandNode(d)
    }
    function productTypeLoadComplete() {
        <g:while test="${pt}">
        if (curProductTypeGridNodeReload ==${curptidx}) {
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
        if (curProductTypeGridNodeReload > -1)
            setTimeout(productTypeLoadComplete, 400)
    }

    var curProductTypeGridNodeReload =
    ${curptidx - 1}
</script>
<div style="clear: both;background: #ffffff;border:1px solid #eeeeee;border-radius: 4px;padding: 5px;">
    <g:message code="product.unSynchronized.count"/>: <b><g:formatNumber number="${unSynchronizedProductsCount}" type="number"/></b> <g:message code="product"/>
</div>
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
    <script language="javascript" type="text/javascript">
        var curSelectedProductType=${ptid ?: 0}
        var loadProducts = function (rowId) {
            var url = "<g:createLink controller="productType" action="getChildProductTypesIdList"/>";
            $.ajax({
                type: "POST",
                url: url,
                data: { id: rowId }
            }).success(function (idList) {
                curSelectedProductType = idList
                var criteria = "[{'op':'productTypes','data':[{'op':'in','val':[" + idList + "],'field':'id'}]}]"
                loadGridWithCriteria("ProductGrid", criteria)
            });
        }

        function formatIsVisible(cellvalue, options, rowObject){  debugger
        window.alert(cellvalue);
            if(cellvalue.toString() == 'true')
                return '${message(code: 'mongoProduct.isVisible.true')}'
            else
                return '${message(code: 'mongoProduct.isVisible.false')}'
        }
    </script>
    <div style="margin: 10px;">
        <div class="criteria-div">
            <rg:criteria>
                <rg:eq name="id" label="product.baseProductId"/>
                <rg:nest name="productTypes">
                    <rg:like name="name" label='product.productType'/>
                </rg:nest>
                <rg:nest name="type">
                    <rg:like name="title" label='product.type'/>
                </rg:nest>
                <rg:nest name="brand">
                    <rg:eq name="name" label='product.brand'/>
                </rg:nest>
                <rg:ilike name="name" label='product.name'/>
                <rg:filterGrid grid="ProductGrid" label='search'/>
            </rg:criteria>
        </div>
        <script type="text/javascript">
            $(".criteria-div")
                    .find('div,label,input')
                    .css('display', 'inline')
                    .css('margin', '3px');
        </script>
        <g:set var="productActions" value="[]"/>
        <sec:ifAllGranted roles="${eshop.RoleHelper.ROLE_PRODUCT_ADD_EDIT}">
            <g:set var="productActions"
                   value="${[[controller: 'product', action: 'productDetails', param: 'pid=#id#', icon: "application_form"]]}"/>
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="${eshop.RoleHelper.ROLE_PRODUCT_ADMIN}">
            <g:set var="productActions"
                   value="${[[controller: 'product', action: 'productDetails', param: 'pid=#id#', icon: "application_form"], [handler: "deleteProduct(#id#)", icon: "application_delete"]]}"/>
        </sec:ifAllGranted>
        <rg:grid domainClass="${eshop.Product}"
                 maxColumns="4"
                 showCommand="false"
                 firstColumnWidth="30"
                 columns="[[name: 'id'], [name: 'image', expression: '\\\'%3cimg height=30 src=%22\\\'%2bg.createLink(controller: \\\'image\\\',id:obj.id )%2b\\\'%22/%3e\\\''], [name: 'productTypes', expression: 'obj[\\\'productTypes\\\']?.find{true}?.name'], [name: 'type', expression: 'obj[\\\'type\\\'][\\\'title\\\']'], [name: 'brand', expression: 'obj[\\\'brand\\\'][\\\'name\\\']'], [name: 'name'], [name: 'guaranteeList'], [name: 'isVisible', expression: 'g.message(code:  obj[\\\'isVisible\\\'].toString() )']]"
                 toolbarCommands="${[[caption: message(code: "add"), function: "addToProductGrid", icon: "plus"]]}"
                 commands="${productActions}">
            <g:if test="${ptid}">
                <rg:criteria>
                    <rg:inCrit name="productTypes.id" value="${ptid as Long}"/>
                </rg:criteria>
            </g:if>
        </rg:grid>
    </div>
</div>
</body>
</html>
