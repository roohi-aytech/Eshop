<%@ page import="eshop.discout.Discount" %>
<!doctype html>
<html>
<head>

    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'discount.label', default: 'Discount')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.quickselect.pack.js')}"></script>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" ng-controller="discountController" role="main">
    <rg:grid domainClass="${Discount}"
             showCommand="false"
             commands="${[[handler: "deleteDiscount(#id#)", icon: "application_delete"]]}">

    </rg:grid>
    <rg:dialog id="discount" title="${message(code: "discount")}">
        <rg:fields bean="${new Discount()}">
            <rg:template>
                <div>
                    <div class="form-fields-part">
                        <rg:field name="code"/>
                        <rg:field name="remainCount"/>
                        <rg:field name="usageType"/>
                    </div>

                    <div class="form-fields-part">
                        <rg:field name="type"/>
                        <rg:field name="fromDate"/>
                    </div>

                    <div class="form-fields-part">
                        <rg:field name="value"/>
                        <rg:field name="toDate"/>
                    </div>
                </div>



                <div>
                    <fieldset>
                        <legend><g:message code="basket-elements"/></legend>

                        <div class="form-fields-part">
                            <rg:field name="basketCountMin"/>
                        </div>

                        <div class="form-fields-part">
                            <rg:field name="basketPriceMin"/>
                        </div>

                        <div class="form-fields-part">
                            <rg:field name="basketPriceMax"/>
                        </div>

                        <div>
                            <rg:field name="basketProductCriteria"/>
                        </div>
                    </fieldset>
                </div>

                <div>
                    <fieldset>
                        <legend><g:message code="product-elements"/></legend>
                        <rg:field name="discountProductsCriteria"/>
                    </fieldset>
                </div>
            </rg:template>
        </rg:fields>
        <rg:saveButton domainClass="${eshop.discout.Discount}"/>
        <rg:cancelButton/>
    </rg:dialog>
    <input type="button" ng-click="openDiscountCreateDialog()" value="<g:message code="new"/>"/>
    <input type="button" ng-click="openDiscountEditDialog()" value="<g:message code="edit"/>"/>
    <script language="javascript" type="text/javascript">
        function deleteDiscount(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#DiscountGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        $(function(){
            $( "#discount" ).on( "dialogopen", function( event, ui ) {
                setTimeout("$(\"select.compositionField:visible\").quickselect()",100)
            } );
            $("[ng-click^=addCompositebasketProductCriteria],[ng-click^=addCompositediscountProductsCriteria]").click(function(){
                setTimeout("$(\"select.compositionField:visible\").quickselect()",100)
            })
        })
    </script>
</div>
</body>
</html>
