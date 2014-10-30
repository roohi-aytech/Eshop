<%@ page import="eshop.AddedValueType" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'addedValueType.label', default: 'AddedValueType')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main" ng-controller="addedValueTypeController" >
    <rg:grid domainClass="${AddedValueType}"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToAddedValueTypeGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#",saveAction:"${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deleteAddedValueType(#id#)", icon: "application_delete"]]}"
    />
<rg:dialog id="addedValueType" title="${message(code: "addedValueType")}">
    <rg:fields bean="${new AddedValueType()}">
        <rg:modify>
            <rg:ignoreField field="title"/>
            <rg:ignoreField field="description"/>
            <rg:ignoreField field="image"/>
            <rg:ignoreField field="needDescription"/>
            <rg:ignoreField field="hasCustomImage"/>
            <rg:ignoreField field="hasAddedValueCount"/>
            <rg:ignoreField field="defaultPrice"/>
            <rg:ignoreField field="defaultPrice"/>
            <rg:ignoreField field="addedValues"/>
            <rg:ignoreField field="productTypes"/>
        </rg:modify>
    </rg:fields>
    <rg:saveButton domainClass="${eshop.AddedValueType}"/>
    <rg:cancelButton/>
</rg:dialog>
    %{--<input type="button" ng-click="openAddedValueTypeCreateDialog()" value="<g:message code="new"/>"/>--}%
    <input type="button" ng-click="openAddedValueTypeEditDialog()" value="<g:message code="edit.sub.types"/>"/>
    <script language="javascript" type="text/javascript">
        function deleteAddedValueType(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#AddedValueTypeGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToAddedValueTypeGrid(){
            loadOverlay('<g:createLink action="form"/>','<g:createLink action="save" />',function(){
                $("#AddedValueTypeGrid").trigger("reloadGrid")
            });
        }
    </script>
</div>
</body>
</html>
