<%@ page import="eshop.VariationGroup" %>
<!doctype html>
<html>
<head>

    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'variationGroup.label', default: 'VariationGroup')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" ng-controller="variationGroupController" role="main">
    <g:set var="actions" value="${[[handler: "deleteVariationGroup(#id#)", icon: "application_delete"]]}"/>
    <g:if test="${grailsApplication.config.variationValueImage}">
        <g:set var="actions" value="${[[handler: "deleteVariationGroup(#id#)", icon: "application_delete"],[handler: "edit_photoes(#id#)", icon: "application_edit"]]}"/>
    </g:if>
    <rg:grid domainClass="${VariationGroup}"
             maxColumns="2"
             showCommand="false"
             commands="${actions}">
        <rg:criteria>
            <rg:isNull name="productType"/>
        </rg:criteria>
    </rg:grid>
    <rg:dialog id="variationGroup" title="${message(code: "variation")}">
        <rg:fields bean="${new VariationGroup()}">
            <rg:modify>
                <rg:ignoreField field="variations"/>
                <rg:ignoreField field="productType"/>
            </rg:modify>
        </rg:fields>
        <rg:saveButton domainClass="${VariationGroup}" />
        <rg:cancelButton/>
    </rg:dialog>
    <input type="button" ng-click="openVariationGroupCreateDialog()" value="<g:message code="new" />"/>
    <input type="button" ng-click="openVariationGroupEditDialog()" value="<g:message code="edit" />"/>
    <script language="javascript" type="text/javascript">
        function deleteVariationGroup(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#VariationGroupGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function edit_photoes(id){
            $('#edit_photoes').load('<g:createLink controller="variationGroup" action="variationImages" />/'+id).dialog('open')
        }
    </script>
</div>
</body>
</html>
