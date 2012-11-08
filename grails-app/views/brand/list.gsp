<%@ page import="eshop.Brand; eshop.VariationGroup" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'brand.label', default: 'Brand')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <div class="criteria-div">
        <rg:criteria>
            <rg:like name="name" label='brand.name'/>
            <rg:filterGrid grid="BrandGrid" label='search'/>
        </rg:criteria>
        <script type="text/javascript">
            $(".criteria-div")
                    .find('div,label,input')
                    .css('display','inline')
                    .css('margin','3px');
        </script>
    </div>
    <rg:grid domainClass="${Brand}"
             maxColumns="4"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToBrandGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#",saveAction:"${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deleteBrand(#id#)", icon: "application_delete"]]}"
    />
    <g:javascript>
        function deleteBrand(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#BrandGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToBrandGrid(){
            loadOverlay('<g:createLink action="form"/>','<g:createLink action="save" />',function(){
                $("#BrandGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
</body>
</html>
