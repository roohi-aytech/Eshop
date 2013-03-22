<%@ page import="eshop.Producer" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'producer.label', default: 'Producer')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<g:javascript src="jquery.quickselect.pack.js"/>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" ng-controller="producerController" role="main">
    <rg:grid domainClass="${eshop.Producer}"
             showCommand="false"
             commands="${[[handler: "deleteProducer(#id#)", icon: "application_delete"]]}">

    </rg:grid>
    <rg:dialog id="producer" title="${message(code: "producer")}">
        <rg:fields bean="${new Producer()}">
            <rg:template>
                <div>
                    <div class="form-fields-part">
                        <rg:field name="name"/>
                        <rg:field name="address"/>
                    </div>
                </div>

                <div>
                    <fieldset>
                        <legend><g:message code="producerStaff"/></legend>
                        <div>
                            <rg:field name="producerStaffs"/>
                        </div>
                    </fieldset>
                </div>
                <div>
                    <fieldset>
                        <legend><g:message code="producingProducts"/></legend>
                        <div>
                            <rg:field name="producingProducts"/>
                        </div>
                    </fieldset>
                </div>

            </rg:template>
        </rg:fields>
        <rg:saveButton domainClass="${eshop.Producer}"/>
        <rg:cancelButton/>
    </rg:dialog>
    <input type="button" ng-click="openProducerCreateDialog()" value="<g:message code="new"/>"/>
    <input type="button" ng-click="openProducerEditDialog()" value="<g:message code="edit"/>"/>
    <g:javascript>
        function deleteProducer(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#ProducerGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        $(function(){
            $( "#producer" ).on( "dialogopen", function( event, ui ) {
                setTimeout("$(\"select.compositionField:visible\").quickselect()",100)
            } );
            $("[ng-click^=addCompositeproducerStaff], [ng-click^=addCompositeproducingProduct]").click(function(){
                setTimeout("$(\"select.compositionField:visible\").quickselect()",100)
            })
        })
    </g:javascript>
</div>
</body>
</html>
