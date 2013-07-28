<%@ page import="eshop.JournalArticle" %>
<g:javascript src="jquery.ui.modal.ckEditorFix.js"/>
<g:set var="entityName" value="${message(code: 'journalArticle.label', default: 'Journal Article')}"/>
<h2><g:message code="default.manage.label" args="[entityName]"/></h2>

<div class="content scaffold-list" role="main">
    <rg:grid domainClass="${JournalArticle}"
             showCommand="false"
             maxColumns="3"
             toolbarCommands="${[[caption: message(code: "add"), function: "addToJournalGrid", icon: "plus"]]}"
             commands="${[[handler: "addToJournalGrid(#id#)", icon: "application_edit"], [handler: "deleteJournalArticle(#id#)", icon: "application_delete"]]}">
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
        function addToJournalGrid(id){
            if(CKEDITOR.instances['text']){
                CKEDITOR.remove(CKEDITOR.instances['text'])
            }
            var url='<g:createLink controller="journalArticle" action="form"
                                   params="['baseProduct.id': baseProductInstance.id]"/>';
            if(id)
                url+='&id='+id
            loadOverlay(url,'<g:createLink
            controller="journalArticle" action="save"/>',function(){
                $("#JournalArticleGrid").trigger("reloadGrid")
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
            width:970,
            afterSave:function(){
                    CKEDITOR.remove(CKEDITOR.instances['text'])
                },
            beforeSubmit:function(){
                $('[name=text]').val(CKEDITOR.instances['text'].getData())
                }
            });
        }
    </g:javascript>
</div>
