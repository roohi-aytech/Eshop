<%--
  Created by IntelliJ IDEA.
  User: Zanbil
  Date: 4/27/13
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="eshop.Guarantee;" %>

<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'guarantee.label', default: 'Guarantee')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<g:javascript src="jquery.quickselect.pack.js"/>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<g:set var="actions" value="[]"/>
<sec:ifAllGranted roles="${eshop.RoleHelper.ROLE_PRODUCT_TYPE_ADMIN}">
    <g:set var="actions" value="${[[handler: "deleteGuarantee(#id#)", icon: "application_delete"]]}"/>
</sec:ifAllGranted>
<div class="content scaffold-list" ng-controller="guaranteeController" role="main">

    <div class="criteria-div">
        <rg:criteria>
            <rg:like name="name" label='guarantee.name'/>

            <rg:filterGrid grid="GuaranteeGrid" label='search'/>
        </rg:criteria>
    </div>
    <script type="text/javascript">
        $(".criteria-div")
                .find('div,label,input')
                .css('display', 'inline')
                .css('margin', '3px');
    </script>
    <rg:grid domainClass="${Guarantee}"
             maxColumns="8"
             showCommand="true"
             commands="${actions}"
    />
    <rg:dialog id="guarantee" title="${message(code: "guarantee")}">
        <rg:fields bean="${new Guarantee()}">

        </rg:fields>
        <rg:saveButton domainClass="${eshop.Guarantee}" />
        <rg:cancelButton/>
    </rg:dialog>
    <input type="button" ng-click="openGuaranteeCreateDialog()" value="<g:message code="new" />"/>
    <sec:ifAnyGranted roles="${eshop.RoleHelper.ROLE_PRODUCT_TYPE_ADMIN},${eshop.RoleHelper.ROLE_PRODUCER_ADD_EDIT}">
        <input type="button" ng-click="openGuaranteeEditDialog()" value="<g:message code="edit" />"/>
    </sec:ifAnyGranted>
    <g:javascript>
        function deleteGuarantee(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#GuaranteeGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
         $(function(){
            $( "#guarantee" ).on( "dialogopen", function( event, ui ) {
                setTimeout("$(\"select.compositionField:visible\").quickselect()",100)
            } );
            $("[ng-click^=addCompositeproductTypeBrands]").click(function(){
                setTimeout("$(\"select.compositionField:visible\").quickselect()",100)
            })
        })

    </g:javascript>
</div>
</body>
</html>
