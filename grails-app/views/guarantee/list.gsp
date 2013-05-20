<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 4/27/13
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="eshop.Guarantee" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'guarantee.label', default: 'Guarantee')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">

    <rg:grid domainClass="${Guarantee}"
             maxColumns="3"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToGuaranteeGrid", icon: "plus"]]}"
             commands="${[[handler: "addToGuaranteeGrid(#id#)", icon: "application_edit"], [handler: "deleteGuarantee(#id#)", icon: "application_delete"],
                     [loadOverlay: "${g.createLink(action: "productTypeBrandForm")}?guarantee.id=#id#",saveAction:"${g.createLink(action: "saveProductTypeBrand")}", saveCallback:"productTypeBrandSaved", icon: "application_put",title:"${message(code: "add-productTypeBrand")}"]]}"
             onSelectRow="loadProductTypeBrands"
    />
    <g:javascript>
        var curSelectedGuarantee=${ptid?:0}
        var loadProductTypeBrands = function (rowId) {
            curSelectedGuarantee = rowId
            var criteria = "[{'op':'eq', 'field':'guarantee.id', 'val':" + rowId + "}]"
            loadGridWithCriteria("ProductTypeBrandGrid", criteria)
        }
    </g:javascript>

    <div style="margin: 10px;">
        <rg:grid domainClass="${eshop.ProductTypeBrand}" maxColumns="2"
                 firstColumnWidth="45" showCommand="false"

                 commands="${[[handler: 'editProductTypeBrand(#id#)', icon: "application_edit",title:"${message(code: "edit")}"],
                         [handler: "deleteProductTypeBrand(#id#)", icon: "application_delete",title:"${message(code: "delete")}"]
                 ]}">
            <rg:criteria>
                <rg:inCrit name="guarantee.id" value="${gurantee as Long}"/>
            </rg:criteria>

        </rg:grid>
    </div>

    <g:javascript>
         function productTypeBrandSaved(productTypeBrand){
            var grid = $("#ProductTypeBrandGrid");
            grid.trigger('reloadGrid');
         }

          function deleteProductTypeBrand(id) {
            if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {

                var url = "<g:createLink action="deleteProductTypeBrand"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                            if (response == "0") {
                                var grid = $("#ProductTypeBrandGrid");
                                grid.trigger('reloadGrid');
                            }
                            else {
                            }
                        });
            }
        }

         function editProductTypeBrand(id){
            loadOverlay('<g:createLink action="productTypeBrandForm"/>/'+id,
                    '<g:createLink action="saveProductTypeBrand"/>',
                    productTypeBrandSaved,
                    undefined,{width:600})
         }

        function deleteGuarantee(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#GuaranteeGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToGuaranteeGrid(id){
            var url='<g:createLink action="form"/>'
             if(id)
                url+="/"+id
            loadOverlay(url,'<g:createLink action="save" />',function(){
                $("#GuaranteeGrid").trigger("reloadGrid")
            },function(){
                $(".count-words").keypress(function(){
                    var inp=$(this)
                    inp.parent().find(".word-counter").html(inp.val().length)
                }).each(function(){
                    $("<span class='word-counter'></span>").insertAfter($(this))
                    $(this).keypress()

                })
            },{width:400});
        }
    </g:javascript>
</div>
</body>
</html>
