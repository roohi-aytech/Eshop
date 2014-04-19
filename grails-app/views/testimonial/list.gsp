<%@ page import="eshop.Testimonial" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'testimonial.label', default: 'Testimonial')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${Testimonial}"
             showCommand="false"
             maxColumns="8"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToTestimonialGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#", saveAction: "${g.createLink(action: "save")}", icon: "application_edit", width:500], [handler: "deleteTestimonial(#id#)", icon: "application_delete"]]}"/>
    <script language="javascript" type="text/javascript">
        function deleteTestimonial(id) {
            if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type: "POST",
                    url: url,
                    data: { id: id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#TestimonialGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToTestimonialGrid() {
            loadOverlay('<g:createLink action="form"/>', '<g:createLink action="save" />', function () {
                $("#TestimonialGrid").trigger("reloadGrid")
            }, null, {width: 500});
        }
    </script>
</div>
</body>
</html>
