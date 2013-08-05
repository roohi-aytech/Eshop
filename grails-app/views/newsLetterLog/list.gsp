<%@ page import="eshop.NewsLetterInstance; eshop.NewsLetterLog" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'newsLetterLog.label', default: 'NewsLetterLog')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<g:set var="newsLetterInstance" value="${NewsLetterInstance.get(params.newsLetterInstance.id)}"/>
<h2><g:message code="default.manage.label" args="[entityName]"/>: ${newsLetterInstance.newsLetter.subject} - <rg:formatJalaliDate date="${newsLetterInstance.startDate}"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${NewsLetterLog}"
             showCommand="false"
             maxColumns="5"
             showFirstColumn="false"
             toolbarCommands="${[]}"
             commands="${[]}">
        <rg:criteria>
            <rg:eq name="newsLetterInstance.id" value="${params.newsLetterInstance.id}"/>
        </rg:criteria>
    </rg:grid>
    <fieldset class="buttons">
        <a class="list"
           href="${createLink(controller: 'newsLetterInstance', action: 'list', params: ['newsLetter.id': newsLetterInstance.newsLetter.id])}"><g:message
                code="newsLetterInstance.list"/></a>
    </fieldset>
    <g:javascript>
        function deleteNewsLetterLog(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#NewsLetterLogGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToNewsLetterLogGrid(){
            loadOverlay('<g:createLink action="form"/>','<g:createLink action="save"/>',function(){
                $("#NewsLetterLogGrid").trigger("reloadGrid")
            });
        }
    </g:javascript>
</div>
</body>
</html>
