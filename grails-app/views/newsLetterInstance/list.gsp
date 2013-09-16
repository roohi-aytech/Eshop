<%@ page import="eshop.NewsLetter; eshop.NewsLetterInstance" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'newsLetterInstance.label', default: 'NewsLetterInstance')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<h2><g:message code="default.manage.label" args="[entityName]"/>: ${NewsLetter.get(params.newsLetter.id).subject}</h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${NewsLetterInstance}"
             maxColumns="3"
             firstColumnWidth="10"
             showCommand="false"
             toolbarCommands="${[]}"
             commands="${[[controller: "newsLetterLog", action: "list", param: "newsLetterInstance.id=#id#", icon: "application_form", title: "${message(code: "newsLetterInstance.logs")}"]]}">
        <rg:criteria>
            <rg:eq name="newsLetter.id" value="${params.newsLetter.id}"/>
        </rg:criteria>
    </rg:grid>
    <fieldset class="buttons">
        <a class="list"
           href="${createLink(controller: 'newsLetter', action: 'list')}"><g:message
                code="newsLetter.list"/></a>
    </fieldset>
    <script language="javascript" type="text/javascript">
        function deleteNewsLetterInstance(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#NewsLetterInstanceGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToNewsLetterInstanceGrid(){
            loadOverlay('<g:createLink action="form"/>','<g:createLink action="save"/>',function(){
                $("#NewsLetterInstanceGrid").trigger("reloadGrid")
            });
        }
    </script>
</div>
</body>
</html>
