<%@ page import="eshop.SpecialSaleSlide" %>
<!doctype html>
<html>
<head>

    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'specialSaleSlide.label', default: 'Special Sale Slide')}"/>
</head>

<body>
<p:javascript src="jquery.quickselect.pack"/>

<div class="content scaffold-list" ng-controller="specialSaleSlideController" role="main">
    <rg:grid domainClass="${SpecialSaleSlide}"
             showCommand="false"
             maxColumns="5"
             commands="${[[handler: "deleteSpecialSaleSlide(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="product.id" value="${baseProductInstance?.id}"/>
        </rg:criteria>
    </rg:grid>
    <rg:dialog id="specialSaleSlide" title="${message(code: "specialSaleSlide")}">
        <rg:fields bean="${new SpecialSaleSlide()}">
            <rg:template>
                <div>
                    <div class="form-fields-part">
                        <rg:field name="product"/>
                        <rg:field name="totalCount"/>
                        <rg:field name="image1024"/>
                    </div>

                    <div class="form-fields-part">
                        <rg:field name="startDate"/>
                        <rg:field name="remainingCount"/>
                        <rg:field name="image1280"/>
                    </div>

                    <div class="form-fields-part">
                        <rg:field name="finishDate"/>
                        <rg:field name="price"/>
                        <rg:field name="image1440"/>
                    </div>
                </div>
            </rg:template>
        </rg:fields>
        <rg:saveButton domainClass="${SpecialSaleSlide}"/>
        <rg:cancelButton/>
    </rg:dialog>
    <input type="button" ng-click="openSpecialSaleSlideCreateDialog()" value="<g:message code="new"/>"/>
    <input type="button" ng-click="openSpecialSaleSlideEditDialog()" value="<g:message code="edit"/>"/>
    <g:javascript>
        function deleteSpecialSaleSlide(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#SpecialSaleSlideGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        $(function(){
            $( "#specialSaleSlide" ).on( "dialogopen", function( event, ui ) {
                setTimeout("$(\"select.compositionField:visible\").quickselect()",100)
            } );
            $("[ng-click^=addCompositebasketProductCriteria],[ng-click^=addCompositespecialSaleSlideProductsCriteria]").click(function(){
                setTimeout("$(\"select.compositionField:visible\").quickselect()",100)
            })
        })
    </g:javascript>
</div>
</body>
</html>
