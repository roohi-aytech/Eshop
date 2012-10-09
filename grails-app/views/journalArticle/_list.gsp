<%@ page import="eshop.JournalArticle" %>
<g:set var="entityName" value="${message(code: 'journalArticle.label', default: 'Journal Article')}"/>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${JournalArticle}"
             showCommand="false"
             maxColumns="2"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToGrid", icon: "plus"]]}"
             commands="${[[loadOverlay: "${g.createLink(controller: "journalArticle", action: "form")}/#id#", saveAction: "${g.createLink(action: "save")}", icon: "application_edit"], [handler: "deleteJournalArticle(#id#)", icon: "application_delete"]]}">
        <rg:criteria>
            <rg:eq name="baseProduct.id" value="${baseProductInstance.id}"/>
        </rg:criteria>
    </rg:grid>
    <g:javascript>
        function deleteJournalArticle(id){
             if (confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
                var url = "<g:createLink controller="journalArticle" action="delete"/>";
                $.ajax({
                    type:"POST",
                    url:url,
                    data:{ id:id }
                }).done(function (response) {
                    if (response == "0") {
                        var grid = $("#JournalArticleGrid");
                        grid.trigger('reloadGrid');
                    }
                    else {
                    }
                });
            }
        }
        function addToGrid(){
            if(CKEDITOR.instances['text']){
                CKEDITOR.remove(CKEDITOR.instances['text'])
            }
            loadOverlay('<g:createLink controller="journalArticle" action="form" params="['baseProduct.id': baseProductInstance.id]"/>','<g:createLink
             controller="journalArticle" action="save"/>',function(){
                $("#JournalArticleGrid").trigger("reloadGrid")
            },undefined,{
            width:970,
            afterSave:function(){
                    CKEDITOR.remove(CKEDITOR.instances['text'])
                }
            });
        }
    </g:javascript>
</div>
