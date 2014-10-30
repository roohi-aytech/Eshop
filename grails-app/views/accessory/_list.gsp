<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 4/8/13
  Time: 11:49 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="eshop.Accessory;" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'accessory.label', default: 'Accessory')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.quickselect.pack.js')}"></script>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

 <g:set var="actions" value="${[[handler: "deleteAccessory(#id#)", icon: "application_delete"]]}"/>
<div class="content scaffold-list" ng-controller="accessoryController" role="main">

    <rg:grid domainClass="${eshop.Accessory}"
             maxColumns="8"
             showCommand="true"
             commands="${actions}"
    />
    <rg:dialog id="accessory" title="${message(code: "variation")}">
        <rg:fields bean="${new Accessory()}">
            <rg:modify>
                <rg:ignoreField field="baseProduct"/>
            </rg:modify>
        </rg:fields>
        <rg:saveButton domainClass="${eshop.Accessory}" />
        <rg:cancelButton/>
    </rg:dialog>
    <input type="button" ng-click="openAccessoryCreateDialog()" value="<g:message code="new" />"/>
    <input type="button" ng-click="openAccessoryEditDialog()" value="<g:message code="edit" />"/>

    <script language="javascript" type="text/javascript">
        function deleteAccessory(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#AccessoryGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
         $(function(){
            $( "#accessory" ).on( "dialogopen", function( event, ui ) {
                setTimeout("$(\"select.compositionField:visible\").quickselect()",100)
            } );
            $("[ng-click^=addCompositeattributeMappings]").click(function(){
                setTimeout("$(\"select.compositionField:visible\").quickselect()",100)
            })
        })

    </script>
</div>
</body>
</html>
