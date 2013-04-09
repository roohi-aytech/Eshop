<%@ page import="eshop.Producer" %>
<!doctype html>
<html>
<head>

    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'producer.label', default: 'Producer')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" ng-controller="producerController" role="main">
    <rg:grid domainClass="${Producer}"
             maxColumns="3"
             showCommand="false"
             commands="${[[handler: "deleteProducer(#id#)", icon: "application_delete"]]}"
    />
    <rg:dialog id="producer" title="${message(code: "variation")}">
        <rg:fields bean="${new Producer()}">

        </rg:fields>
        <rg:saveButton domainClass="${eshop.Producer}" />
        <rg:cancelButton/>
    </rg:dialog>
    <input type="button" ng-click="openProducerCreateDialog()" value="<g:message code="new" />"/>
    <input type="button" ng-click="openProducerEditDialog()" value="<g:message code="edit" />"/>
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
    </g:javascript>
</div>
</body>
</html>
