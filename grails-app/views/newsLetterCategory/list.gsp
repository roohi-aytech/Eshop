<%@ page import="eshop.NewsLetterCategory" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'newsLetterCategory.label', default: 'NewsLetterCategory')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${NewsLetterCategory}"
             maxColumns="2"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToNewsLetterCategoryGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(action: "form")}/#id#", saveAction: "${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deleteNewsLetterCategory(#id#)", icon: "application_delete"]]}"/>
    <script language="javascript" type="text/javascript">
        function deleteNewsLetterCategory(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#NewsLetterCategoryGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToNewsLetterCategoryGrid(){
            loadOverlay('<g:createLink action="form"/>','<g:createLink action="save"/>',function(){
                $("#NewsLetterCategoryGrid").trigger("reloadGrid")
            },function(){
                $(".count-words").keypress(function(){
                    var inp=$(this)
                    inp.parent().find(".word-counter").html(inp.val().length)
                }).each(function(){
                    $("<span class='word-counter'></span>").insertAfter($(this))
                    $(this).keypress()

                });
            },{
                width:300
            });
        }
    </script>
</div>
</body>
</html>
