<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 4/8/13
  Time: 11:49 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="eshop.Producer;" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'producer.label', default: 'Producer')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <div class="criteria-div">
        <rg:criteria>
            <rg:like name="name" label='producer.name'/>
            <rg:filterGrid grid="ProducerGrid" label='search'/>
        </rg:criteria>
        <script type="text/javascript">
            $(".criteria-div")
                    .find('div,label,input')
                    .css('display','inline')
                    .css('margin','3px');
        </script>
    </div>
    <rg:grid domainClass="${eshop.Producer}"
             maxColumns="8"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToProducerGrid", icon: "plus"]]}"
             commands="${[[handler: "addToProducerGrid(#id#)", icon: "application_edit"], [handler: "deleteProducer(#id#)", icon: "application_delete"]]}"
    />
    <g:javascript>
        function deleteProducer(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#ProducerGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToProducerGrid(id){
            var url='<g:createLink action="form"/>'
             if(id)
                url+="/"+id
            loadOverlay(url,'<g:createLink action="save" />',function(){
                $("#ProducerGrid").trigger("reloadGrid")
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
