<%@ page import="eshop.NewsLetter" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'newsLetter.label', default: 'NewsLetter')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.ui.modal.ckEditorFix.js')}" type="text/javascript"></script>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${NewsLetter}"
             maxColumns="4"
             firstColumnWidth="25"
             showCommand="false"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToNewsLetterGrid", icon: "plus"]]}"
             commands="${[[handler: "addToNewsLetterGrid(#id#)", icon: "application_edit"], [handler: "deleteNewsLetter(#id#)", icon: "application_delete"],
                     [controller: "newsLetterInstance", action: "list", param: "newsLetter.id=#id#", icon: "application_form",title:"${message(code: "newsLetter.instances")}"]]}"/>
    <script language="javascript" type="text/javascript">
        function deleteNewsLetter(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#NewsLetterGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToNewsLetterGrid(id){
            var url = '<g:createLink action="form"/>';
            if(id)
                url+='/'+id
            loadOverlay(url,'<g:createLink action="save"/>',function(){
                $("#NewsLetterGrid").trigger("reloadGrid")
            },function(){
                $(".count-words").keypress(function(){
                    var inp=$(this)
                    inp.parent().find(".word-counter").html(inp.val().length)
                }).each(function(){
                    $("<span class='word-counter'></span>").insertAfter($(this))
                    $(this).keypress()

                });

                //prepare combotrees

            },{
            width:800,
            afterSave:function(){
                    CKEDITOR.remove(CKEDITOR.instances['body_editor'])
                },
            beforeSubmit:function(){
                $('[name=body]').val(CKEDITOR.instances['body_editor'].getData())
                }
            });
        }
    </script>
</div>
</body>
</html>
