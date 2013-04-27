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
             maxColumns="4"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToGuaranteeGrid", icon: "plus"]]}"
             commands="${[[handler: "addToGuaranteeGrid(#id#)", icon: "application_edit"], [handler: "deleteGuarantee(#id#)", icon: "application_delete"]]}"
    />
    <g:javascript>
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
