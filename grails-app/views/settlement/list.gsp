<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 4/28/13
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="eshop.Settlement;" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'settlement.label', default: 'settlement')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <div class="criteria-div">
        <rg:criteria>
            <rg:like name="name" label='settlement.name'/>
            <rg:filterGrid grid="SettlementGrid" label='search'/>
        </rg:criteria>
        <script type="text/javascript">
            $(".criteria-div")
                    .find('div,label,input')
                    .css('display','inline')
                    .css('margin','3px');
        </script>
    </div>

    <rg:grid domainClass="${Settlement}"
             maxColumns="2"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToSettlementGrid", icon: "plus"]]}"
             commands="${[[handler: "addToSettlementGrid(#id#)", icon: "application_edit"], [handler: "deleteSettlement(#id#)", icon: "application_delete"]]}"
    />
    <g:javascript>
        function deleteSettlement(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#SettlementGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToSettlementGrid(id){
            var url='<g:createLink action="form"/>'
             if(id)
                url+="/"+id
            loadOverlay(url,'<g:createLink action="save" />',function(){
                $("#SettlementGrid").trigger("reloadGrid")
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
