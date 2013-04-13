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
<<<<<<< HEAD

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
    =======
    <g:set var="actions" value="[]"/>
    <sec:ifAllGranted roles="${eshop.RoleHelper.ROLE_PRODUCT_TYPE_ADMIN}">
        <g:set var="actions" value="${[[handler: "deleteProducer(#id#)", icon: "application_delete"]]}"/>
    </sec:ifAllGranted>
    <div class="content scaffold-list" ng-controller="producerController" role="main">
        <rg:grid domainClass="${Producer}"
                 maxColumns="3"
                 showCommand="false"
                 commands="${actions}"
        />
        <rg:dialog id="producer" title="${message(code: "variation")}">
            <rg:fields bean="${new Producer()}">

            </rg:fields>
            <rg:saveButton domainClass="${eshop.Producer}" />
            <rg:cancelButton/>
        </rg:dialog>
        <input type="button" ng-click="openProducerCreateDialog()" value="<g:message code="new" />"/>
        <sec:ifAnyGranted roles="${eshop.RoleHelper.ROLE_PRODUCT_TYPE_ADMIN},${eshop.RoleHelper.ROLE_PRODUCER_ADD_EDIT}">
            <input type="button" ng-click="openProducerEditDialog()" value="<g:message code="edit" />"/>
        </sec:ifAnyGranted>
        >>>>>>> origin/master
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
