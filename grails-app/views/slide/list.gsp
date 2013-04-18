<%@ page import="eshop.Slide" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'slide.label', default: 'Slide')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${Slide}"
             maxColumns="3"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToSlideGrid", icon: "plus"]]}"
             commands="${[[handler: "addToSlideGrid(#id#)", icon: "application_edit"], [handler: "deleteSlide(#id#)", icon: "application_delete"]]}"/>
    <g:javascript>
        function deleteSlide(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#SlideGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToSlideGrid(id){
            var url='<g:createLink action="form"/>'
             if(id)
                url+="/"+id
            loadOverlay(url,'<g:createLink action="save"/>',function(){
                $("#SlideGrid").trigger("reloadGrid")
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
    </g:javascript>
</div>
</body>
</html>
