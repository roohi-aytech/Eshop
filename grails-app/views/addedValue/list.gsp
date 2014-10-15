<%@ page import="eshop.AddedValue" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'addedValue.label', default: 'AddedValue')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${AddedValue}"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToAddedValueGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#", saveAction: "${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deleteAddedValue(#id#)", icon: "application_delete"],[handler: "edit_photoes_addedValue(#id#)", icon: "application_add"]]}">
        <rg:criteria>
            <rg:isNull name="baseProduct"/>
        </rg:criteria>
    </rg:grid>

    <rg:dialog id="edit_photoes_addedValue">

    </rg:dialog>
    <script language="javascript" type="text/javascript">
        function deleteAddedValue(id) {
            if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type: "POST",
                    url: url,
                    data: { id: id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#AddedValueGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToAddedValueGrid() {
            loadOverlay('<g:createLink action="form"/>', '<g:createLink action="save" />', function () {
                $("#AddedValueGrid").trigger("reloadGrid")
            });
        }
        function edit_photoes_addedValue(id){
            $('#edit_photoes_addedValue').load('<g:createLink controller="addedValue" action="addedValueImages" />/'+id).dialog('open')
        }
    </script>
</div>
</body>
</html>
