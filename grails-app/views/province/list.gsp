<%@ page import="eshop.Province" %>
<!doctype html>
<html>
<head>

    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'province.label', default: 'Province')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" ng-controller="provinceController" role="main">
    <rg:grid domainClass="${Province}"
             maxColumns="3"
             showCommand="false"
             commands="${[[handler: "deleteProvince(#id#)", icon: "application_delete"]]}"
    />
    <rg:dialog id="province" title="${message(code: "province")}">
        <rg:fields bean="${new Province()}">
            <rg:modify>
                <rg:ignoreField field="citys"/>
            </rg:modify>
        </rg:fields>
        <rg:saveButton domainClass="${Province}" />
        <rg:cancelButton/>
    </rg:dialog>
    <input type="button" ng-click="openProvinceCreateDialog()" value="<g:message code="new" />"/>
    <input type="button" ng-click="openProvinceEditDialog()" value="<g:message code="edit" />"/>
    <script language="javascript" type="text/javascript">
        function deleteProvince(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#ProvinceGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
    </script>
</div>
</body>
</html>
