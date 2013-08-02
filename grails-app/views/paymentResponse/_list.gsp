<%@ page import="eshop.accounting.PaymentResponse" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'paymentResponse.label', default: 'PaymentResponse')}"/>
</head>

<body>
<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${PaymentResponse}"
             maxColumns="4"
             showCommand="false"
    >
        <rg:criteria>
            <rg:eq name="request.id" value="${params.id}"/>
        </rg:criteria>
        </rg:grid>
    <g:javascript>
        function deletePaymentResponse(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#PaymentResponseGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToPaymentResponseGrid(){
            loadOverlay('<g:createLink action="form"/>','<g:createLink action="save" />',function(){
                $("#PaymentResponseGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
</body>
</html>
