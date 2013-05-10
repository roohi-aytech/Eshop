<%@ page import="eshop.Order" %>
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
    <rg:grid domainClass="${Order}"
             maxColumns="3"
             showCommand="false"
             commands="${[[handler: "deleteProvince(#id#)", icon: "application_delete"]]}"
    />
    <g:javascript>
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
    </g:javascript>
</div>
</body>
</html>
