<%@ page import="eshop.CustomerReview" %>
<!doctype html>
<html>
<head>

    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'customerReview.label', default: 'CustomerReview')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" ng-controller="customerReviewController" role="main">
    <rg:grid domainClass="${CustomerReview}"
             maxColumns="5"
             showCommand="false"
             commands="${[[handler: "showCustomerReview(#id#)", icon: "application_view_detail"], [handler: "deleteCustomerReview(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="status" value="waiting"/>
        </rg:criteria>
    </rg:grid>
    <rg:dialog id="customerReview" title="${message(code: "customerReview")}">
        <rg:fields bean="${new CustomerReview()}">
            <rg:modify>
            %{--<rg:ignoreField field="responses"/>--}%
                <rg:readonlyField field="creationDate"/>
            %{--<rg:readonlyField field="creationDate"/>--}%
            </rg:modify>
        </rg:fields>
        <rg:saveButton domainClass="${CustomerReview}"/>
        <rg:cancelButton/>
    </rg:dialog>
    <script language="javascript" type="text/javascript">
        function showCustomerReview(id){
             window.location.href="${createLink(action: 'show')}/" + id;
        }
        function deleteCustomerReview(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#CustomerReviewGrid");
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
