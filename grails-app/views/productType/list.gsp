<%@ page import="eshop.ProductType" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'productType.label', default: 'Product Type')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="form" id="edit-form-productType">
    <g:render template="form_ProductType"/>
</div>
%{--<div class="form" id="edit-form-attributeType">--}%
    %{--<g:render template="form_Attribute"/>--}%
%{--</div>--}%
<div class="form" id="move-product-type-form"></div>

<div id="list-productType" class="content scaffold-list" role="main">

    <script type="text/javascript">
        jQuery(document).ready(function () {
            var allFields = $("#edit-form-productType input");
            $("#edit-form-productType").dialog({
                autoOpen:false,
                modal:true,
                resizable:false,
                title:'${message(code: "producttype.definition")}',
                buttons:{
                    "${message(code: "save")}":function () {
                        $.ajax({
                            type:"POST",
                            url:$("#edit-form-productType").attr('url'),
                            data:{
                                name: $("#edit-form-productType input[name=name]").val(),
                                description: $("#edit-form-productType input[name=description]").val()
                            }
                        }).done(function (response) {
                            if (response == "0") {
                                var parent = $("#edit-form-productType").attr('parentId');
                                if(parent)
                                    reloadProductTypeGridNode(parent)
                                else{
                                    var grid = $("#ProductTypeGrid");
                                    grid.trigger('reloadGrid');
                                }
                                var grid = $("#AttributeTypeGrid");
                                grid.trigger('reloadGrid');
                            }
                            else {
                            }
                        });
                        allFields.removeClass("ui-state-error");
                        $(this).dialog("close");
                    },
                    "${message(code: "cancel")}":function () {
                        $(this).dialog("close");
                    }
                },
                close:function () {
                    allFields.val("").removeClass("ui-state-error");
                }
            });
        });
        %{--jQuery(document).ready(function () {--}%
            %{--var allFields = $("#edit-form-attributeType input[type!=button]");--}%
            %{--$("#edit-form-attributeType").dialog({--}%
                %{--autoOpen:false,--}%
                %{--modal:true,--}%
                %{--width:350,--}%
                %{--resizable:false,--}%
                %{--title:"${message(code: "attributetype.definition")}",--}%
                %{--buttons:{--}%
                    %{--"${message(code: "save")}":function () {--}%
                        %{--$.ajax({--}%
                            %{--type:"POST",--}%
                            %{--url:$("#edit-form-attributeType").attr('url'),--}%
                            %{--data:{--}%
                                %{--name: $("#edit-form-attributeType input[name=name]").val(),--}%
                                %{--attributeType: $("#edit-form-attributeType select[name=attributeType]").val(),--}%
                                %{--defaultValue: $("#edit-form-attributeType input[name=defaultValue]").val(),--}%
                                %{--values: $("#edit-form-attributeType input[name=values]")--}%
                                        %{--.map(function(){return this.value})--}%
                                        %{--.get()--}%
                                        %{--.join(),--}%
                                %{--"productType.id": $("#edit-form-attributeType").attr('productTypeId')--}%
                            %{--}--}%
                        %{--}).done(function (response) {--}%
                                    %{--if (response == "0") {--}%
                                        %{--var grid = $("#AttributeTypeGrid");--}%
                                        %{--grid.trigger('reloadGrid');--}%
                                    %{--}--}%
                                    %{--else {--}%
                                    %{--}--}%
                                %{--});--}%
                        %{--allFields.removeClass("ui-state-error");--}%
                        %{--$(this).dialog("close");--}%
                    %{--},--}%
                    %{--"${message(code: "cancel")}":function () {--}%
                        %{--$(this).dialog("close");--}%
                    %{--}--}%
                %{--},--}%
                %{--close:function () {--}%
                    %{--allFields.val("").removeClass("ui-state-error");--}%
                    %{--$("#edit-form-attributeType .attributeTypeValue").remove()--}%
                    %{--$(".valueslabel")--}%
                            %{--.html("")--}%
                            %{--.first()--}%
                            %{--.html("<g:message code="attributeType.values.label" default="Values" />");--}%
                %{--}--}%
            %{--});--}%
        %{--});--}%
        jQuery(document).ready(function () {
            var productTypeTree = $("#move-product-type-form").jstree({
                plugins : ["themes","json_data","radio"],
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
                        url:'<g:createLink action="getProductTypes"/>',
                        type:'POST',
                        data:{
                            curProductTypeId:function(){
                                var cid= $("#move-product-type-form").attr("curProductTypeId")
                                return cid?cid:"0"
                            }
                        }
                    }
                }
            });
            productTypeTree.bind("loaded.jstree refresh.jstree", function (event, data) {
                var nodeId=jQuery("#move-product-type-form").attr("parentId")
                productTypeTree.jstree('check_node',"#"+nodeId)
                productTypeTree.jstree("open_all");
            });

            $("#move-product-type-form").dialog({
                autoOpen:false,
                modal:true,
                title:'${message(code: "move-product-type")}',
                resizable:false,
                buttons:{
                    "${message(code: "save")}":function () {
                        $.ajax({
                            type:"POST",
                            url:'<g:createLink action="moveProductType"/>',
                            data:{
                                parentId: productTypeTree.jstree('get_checked').attr("id"),
                                id: $("#move-product-type-form").attr("curProductTypeId")
                            }
                        }).done(function (response) {
                            if (response == "0") {
                                var grid = $("#ProductTypeGrid");
                                grid.trigger('reloadGrid');
                                var grid = $("#AttributeTypeGrid");
                                grid.trigger('reloadGrid');
                            }
                            else {
                            }
                        });

                        $(this).dialog("close");
                    },
                    "${message(code: "cancel")}":function () {
                        $(this).dialog("close");
                    }
                },
                close:function () {
                },
                open:function(){
                    productTypeTree.jstree("refresh");
                }
            });
        });
        function addToProductTypeGrid(parentId) {
            var url = '<g:createLink action="saveProductType"/>';
            if (parentId)
                url += '?parentProduct.id=' + parentId;

            if(parentId)
                $("#edit-form-productType").attr("parentId", parentId);
            else
                $("#edit-form-productType").attr("parentId", "");
            $("#edit-form-productType").attr("url", url);
            $("#edit-form-productType").dialog("open");
        }
        %{--function addToAttributeGrid(parentId) {--}%
            %{--var url = '<g:createLink action="saveAttributeType"/>';--}%
            %{--$("#edit-form-attributeType").attr("url", url);--}%
            %{--$("#edit-form-attributeType").attr("productTypeId", parentId);--}%
            %{--$("#edit-form-attributeType").dialog("open");--}%
        %{--}--}%


        function editProductTypeGrid(id) {
            var url = '<g:createLink action="saveProductType"/>';
            if (id)
                url += '?id=' + id;
            var grid = jQuery("#ProductTypeGrid")
            var row = grid.getRowData(id)
            $("#edit-form-productType").attr("parentId", row.parent);
            $("#edit-form-productType input[name=name]").val(row.name)
            $("#edit-form-productType input[name=description]").val(row.description)

            $("#edit-form-productType").attr("url", url)
            $("#edit-form-productType").dialog("open")
        }
        %{--function editAttributeGrid(id) {--}%
            %{--var url = '<g:createLink action="saveAttributeType"/>';--}%
            %{--if (id)--}%
                %{--url += '?id=' + id;--}%
            %{--var grid = jQuery("#AttributeTypeGrid")--}%
            %{--var row = grid.getRowData(id)--}%
            %{--$("#edit-form-attributeType input[name=name]").val(row.name)--}%
            %{--$("#edit-form-attributeType select[name=attributeType]").val(row.attributeType)--}%
            %{--$("#edit-form-attributeType input[name=defaultValue]").val(row.defaultValue)--}%
            %{--$("#edit-form-attributeType select[name=category]").val(row.category)--}%

            %{--$.ajax({--}%
                %{--type:"POST",--}%
                %{--url:'<g:createLink action="getAttributeTypeValues"/>',--}%
                %{--data:{--}%
                    %{--id: id--}%
                %{--}--}%
            %{--}).done(function (response) {--}%
                %{--$(response).each(function(index){--}%
                    %{--addattributeTypeValueTemplate(response[index])--}%
                %{--})--}%
            %{--});--}%
            %{--$("#edit-form-attributeType").attr("url", url)--}%
            %{--$("#edit-form-attributeType").dialog("open")--}%
        %{--}--}%
        %{--function editProductGrid(id) {--}%
            %{--var url = '<g:createLink action="saveProduct"/>';--}%
            %{--if (id)--}%
                %{--url += '?id=' + id;--}%
            %{--var grid = jQuery("#ProductGrid")--}%
            %{--var row = grid.getRowData(id)--}%
            %{--$("#edit-form input[name=name]").val(row.name)--}%
            %{--$("#edit-form input[name=description]").val(row.description)--}%

            %{--$("#edit-form").attr("url", url)--}%
            %{--$("#edit-form").dialog("open")--}%
        %{--}--}%
        %{--function deleteProductGrid(id) {--}%
            %{--if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {--}%

                %{--var url = "<g:createLink action="deleteProduct"/>";--}%
                %{--$.ajax({--}%
                    %{--type:"POST",--}%
                    %{--url:url,--}%
                    %{--data:{ id:id }--}%
                %{--}).done(function (response) {--}%
                    %{--if (response == "0") {--}%
                        %{--var grid = $("#ProductGrid");--}%
                        %{--grid.trigger('reloadGrid');--}%
                    %{--}--}%
                    %{--else {--}%
                    %{--}--}%
                %{--});--}%
            %{--}--}%
        %{--}--}%
        function deleteProductTypeGrid(id) {
            if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {

                var url = "<g:createLink action="deleteProductType"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#ProductTypeGrid")
                        var parent=grid.getRowData(id).parent
                        if(parent)
                            reloadProductTypeGridNode(parent)
                        else
                            grid.trigger('reloadGrid')
                        var grid = $("#AttributeTypeGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                        alert(response);
                    }
                });
            }
        }
        function deleteAttributeGrid(id) {
            if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {

                var url = "<g:createLink action="deleteAttributeType"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                            if (response == "0") {
                                var grid = $("#AttributeTypeGrid");
                                grid.trigger('reloadGrid');
                            }
                            else {
                            }
                        });
            }
        }
        function deleteAttributeCategory(id) {
            if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {

                var url = "<g:createLink action="deleteAttributeCategory"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                            if (response == "0") {
                                var grid = $("#AttributeCategoryGrid");
                                grid.trigger('reloadGrid');
                            }
                            else {
                                alert(response)
                            }
                        });
            }
        }
        function moveProductType(id){
            var grid = jQuery("#ProductTypeGrid")
            var row = grid.getRowData(id)
            $("#move-product-type-form").attr("parentId", row.parent);
            $("#move-product-type-form").attr("curProductTypeId",id)
            $("#move-product-type-form").dialog("open")
        }
        function attributeCategorySaved(attributeCategory){
            if(attributeCategory.parentCategory)
                reloadAttributeCategoryGridNode(attributeCategory.parentCategory.id)
            else{
                var grid = jQuery("#AttributeCategoryGrid")
                grid.trigger('reloadGrid');
            }
        }
        function attributeSaved(attribute){
            var grid = $("#AttributeTypeGrid");
            grid.trigger('reloadGrid');
        }

    </script>

    <div style="margin: 10px;">
        <rg:grid domainClass="${eshop.ProductType}" maxColumns="2"
                 firstColumnWidth="30" showCommand="false"
                 tree="parentProduct"
                 childGrid="${["AttributeType":"productType","AttributeCategory":"productType"]}"
                 toolbarCommands="${[[caption: message(code: "add"), function: "addToProductTypeGrid", icon: "plus"]]}"
                 commands="${[[handler: "addToProductTypeGrid(#id#)", icon: "application_add" ,title:"${message(code: "add-sub-product-type")}"],
                         [loadOverlay: "${g.createLink(action: "attributeCategoryForm")}?productType.id=#id#",saveAction:"${g.createLink(action: "saveAttributeCategory")}",saveCallback:"attributeCategorySaved", icon: "application_link",title:"${message(code: "add-category")}"],
                         [loadOverlay: "${g.createLink(action: "attributeForm")}?productType.id=#id#",saveAction:"${g.createLink(action: "saveAttributeType")}",saveCallback:"attributeSaved", icon: "application_put",title:"${message(code: "add-attribute")}"],
                         [handler: "editProductTypeGrid(#id#)", icon: "application_edit",title:"${message(code: "edit-product-type")}"],
                         [controller: "productType", action: "details", param: "id=#id#", icon: "application_form",title:"${message(code: "product-type-details")}"],
                         [handler: "deleteProductTypeGrid(#id#)", icon: "application_delete",title:"${message(code: "delete-product-type")}"],
                         [handler: "moveProductType(#id#)", icon: "cut",title:"${message(code: "move-product-type")}"]]}"/>
    </div>
    <div style="margin: 10px;">
        <rg:grid domainClass="${eshop.AttributeCategory}" maxColumns="1"
                 firstColumnWidth="10" showCommand="false"
                 tree="parentCategory"
                 commands="${[[loadOverlay: "${g.createLink(action: "attributeCategoryForm")}?parentCategory.id=#id#",saveCallback: "attributeCategorySaved",saveAction:"${g.createLink(action: "saveAttributeCategory")}", icon: "application_add",title:"${message(code: "add-sub-category")}"],
                         [loadOverlay: "${g.createLink(action: "attributeCategoryForm")}/#id#",saveAction:"${g.createLink(action: "saveAttributeCategory")}", icon: "application_edit",title:"${message(code: "edit-category")}"],
                         [handler: "deleteAttributeCategory(#id#)", icon: "application_delete",title:"${message(code: "delete-category")}"]]}">
            <rg:criteria>
                <rg:eq name="productType.id" value="0"/>
            </rg:criteria>
        </rg:grid>
    </div>
    <div style="margin: 10px;">
        <rg:grid domainClass="${eshop.AttributeType}" maxColumns="4"
                 firstColumnWidth="15" showCommand="false"
                 commands="${[[loadOverlay: "${g.createLink(action: "attributeForm")}/#id#",saveAction:"${g.createLink(action: "saveAttributeType")}",saveCallback:"attributeSaved", icon: "application_edit",title:"${message(code: "edit-attribute")}"],
                         [handler: "deleteAttributeGrid(#id#)", icon: "application_delete",title:"${message(code: "delete-attribute")}"]]}">
            <rg:criteria>
                <rg:eq name="productType.id" value="0"/>
            </rg:criteria>
        </rg:grid>
    </div>
    %{--<div style="clear: both;"></div>--}%
    %{--<div>--}%
        %{--<g:render template="details"/>--}%
    %{--</div>--}%


</div>
</body>
</html>
