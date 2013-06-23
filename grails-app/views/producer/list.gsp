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

<g:set var="actions" value="[]"/>
<sec:ifAllGranted roles="${eshop.RoleHelper.ROLE_PRODUCT_TYPE_ADMIN}">
    <g:set var="actions" value="${[[handler: "deleteProducer(#id#)", icon: "application_delete"],
            [controller: "producer", action: "details", param: "id=#id#", icon: "application_form",title:"${message(code: "producer-details")}"]]}"/>
</sec:ifAllGranted>
<div class="content scaffold-list" ng-controller="producerController" role="main">

    <div class="criteria-div">
        <rg:criteria>
            <rg:like name="name" label='producer.name'/>

            <rg:nest name="producingProducts">
                <rg:nest name="brand">
                    <rg:like name="name" label='brand'/>
                </rg:nest>
                <rg:nest name="productTypes">
                    <rg:like name="name" label='productType'/>
                </rg:nest>
            </rg:nest>
            <rg:nest name="producerStaffs">

                    <rg:like name="lastName" label='lastName'/>

            </rg:nest>



            <rg:filterGrid grid="ProducerGrid" label='search'/>
        </rg:criteria>
    </div>
    <script type="text/javascript">
        $(".criteria-div")
                .find('div,label,input')
                .css('display', 'inline')
                .css('margin', '3px');
    </script>
    <rg:grid domainClass="${Producer}"
             maxColumns="8"
             showCommand="true"
             commands="${actions}"
             firstColumnWidth="50"
    />

    <rg:dialog id="producer" title="${message(code: "producer")}">
        <rg:fields bean="${new Producer()}">
            <rg:modify>
                <rg:ignoreField field="producingProducts"/>
                <rg:ignoreField field="producerStaffs"/>
            </rg:modify>
        </rg:fields>
        <rg:saveButton domainClass="${eshop.Producer}" />
        <rg:cancelButton/>
    </rg:dialog>
    <input type="button" ng-click="openProducerCreateDialog()" value="<g:message code="new" />"/>
    <sec:ifAnyGranted roles="${eshop.RoleHelper.ROLE_PRODUCT_TYPE_ADMIN},${eshop.RoleHelper.ROLE_PRODUCER_ADD_EDIT}">
        <input type="button" ng-click="openProducerEditDialog()" value="<g:message code="edit" />"/>
    </sec:ifAnyGranted>
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
