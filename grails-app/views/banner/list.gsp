<%@ page import="eshop.Banner" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'banner.label', default: 'Banner')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${Banner}"
             maxColumns="5"
             sortname="gridSortIndex"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToBannerGrid", icon: "plus"]]}"
             commands="${[[handler: "addToBannerGrid(#id#)", icon: "application_edit"], [handler: "deleteBanner(#id#)", icon: "application_delete"]]}"/>
    <script language="javascript" type="text/javascript">
        function deleteBanner(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#BannerGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToBannerGrid(id){
            var url='<g:createLink action="form"/>'
             if(id)
                url+="/"+id
            loadOverlay(url,'<g:createLink action="save"/>',function(){
                $("#BannerGrid").trigger("reloadGrid")
            },function(){
                $(".count-words").keypress(function(){
                    var inp=$(this)
                    inp.parent().find(".word-counter").html(inp.val().length)
                }).each(function(){
                    $("<span class='word-counter'></span>").insertAfter($(this))
                    $(this).keypress()

                });

                //prepare combotrees

            },{width:400});
        }
    </script>
</div>
</body>
</html>
