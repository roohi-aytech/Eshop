<%@ page import="eshop.PaymentRequest" %>
<!doctype html>
<html>
<head>

    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'paymentRequest.label', default: 'PaymentRequest')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" ng-controller="paymentRequestController" role="main">
    <rg:grid domainClass="${PaymentRequest}"
             maxColumns="5"
             showCommand="false"
             commands="${[[handler: "showPaymentRequest(#id#)", icon: "application_view_detail"],[handler: "deletePaymentRequest(#id#)", icon: "application_delete"]]}"
    />
    <rg:dialog id="paymentRequest" title="${message(code: "paymentRequest")}">
        <rg:fields bean="${new PaymentRequest()}">
            <rg:modify>
                %{--<rg:ignoreField field="responses"/>--}%
                <rg:readonlyField field="creationDate"/>
                %{--<rg:readonlyField field="creationDate"/>--}%
            </rg:modify>
        </rg:fields>
        <rg:saveButton domainClass="${PaymentRequest}" />
        <rg:cancelButton/>
    </rg:dialog>
    <g:javascript>
        function showPaymentRequest(id){
             window.location.href="${createLink(action:'show')}/" + id;
        }
        function deletePaymentRequest(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#PaymentRequestGrid");
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
