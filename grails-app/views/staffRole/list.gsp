<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 5/28/13
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="eshop.StaffRole;" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'staffRole.label', default: 'StaffRole')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <div class="criteria-div">
        <rg:criteria>
            <rg:like name="role" label='staffRole.role'/>
            <rg:filterGrid grid="StaffRoleGrid" label='search'/>
        </rg:criteria>
        <script type="text/javascript">
            $(".criteria-div")
                    .find('div,label,input')
                    .css('display','inline')
                    .css('margin','3px');
        </script>
    </div>
    <rg:grid domainClass="${StaffRole}"
             maxColumns="4"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToStaffRoleGrid", icon: "plus"]]}"
             commands="${[[handler: "addToStaffRoleGrid(#id#)", icon: "application_edit"], [handler: "deleteStaffRole(#id#)", icon: "application_delete"]]}"
    />
    <script language="javascript" type="text/javascript">
        function deleteStaffRole(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#StaffRoleGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToStaffRoleGrid(id){
            var url='<g:createLink action="form"/>'
             if(id)
                url+="/"+id
            loadOverlay(url,'<g:createLink action="save" />',function(){
                $("#StaffRoleGrid").trigger("reloadGrid")
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
    </script>
</div>
</body>
</html>
