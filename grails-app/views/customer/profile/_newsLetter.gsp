
<link href="${resource(dir: 'css/jquery.easyui/metro', file: 'easyui.css')}" rel="stylesheet" type="text/css"/>
<link href="${resource(dir: 'css/jquery.easyui', file: 'easyui-rtl.css')}" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.panel.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.parser.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.validatebox.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.draggable.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.tree.js')}"></script>
<style>
h3 {
    margin-bottom: 0px !important;
}

td {
    vertical-align: top;
}

.tree li {
    display: block !important;
}

.checkBoxList {
    padding: 5px;
    border: 1px solid #eeeeee;
    border-radius: 5px;
    height: 100px;
    width: 690px;
    overflow: auto;
    display: block !important;
}

.checkBoxList div {
    display: block !important;
}

.checkBoxList label {
    width: auto;
    display: inline-block;
    font-size: 11px;
}

td {
    text-align: right;
}

.jstree-default-rtl.jstree-focused {
    background: none;
}

.fieldcontain div {
    display: inline;
}

#sendDateContainer input {
    width: 148px;
    text-align: center !important;
}

input[type=checkbox] {
    display: inline !important;
}
</style>

<div>
    %{--<h2><g:message code="controlPanel.settings.profile.newsLetters.label"/></h2>--}%

    <div>
        <g:message code="controlPanel.settings.profile.newsLetters.description"></g:message>
    </div>
    <g:form controller="customer" action="saveNewsLetter">
        <table class="table-simulated" cellspacing="5" cellpadding="5">
            <tr>
                <td width="50%">
                    <h3>
                        <g:message code="newsLetter.productTypes.label" default="Categories"/>
                    </h3>
                    <ul class="productTypesTree">

                    </ul>
                </td>
                <td width="50%">
                    <h3>
                        <g:message code="newsLetter.categories.label" default="Categories"/>
                    </h3>

                    <div class="checkBoxList">
                        <g:each in="${customerInstance?.newsLetterCategories?.sort { it.name }}" var="category">
                            <div>
                                <g:checkBox name="categories" id="category${category.id}" value="${category.id}"
                                            checked="${customerInstance?.newsLetterCategories?.contains(category)}"
                                            title="${category.name}"/>
                                <label for="category${category.id}">
                                    ${category.name}
                                </label>
                            </div>
                        </g:each>
                        <g:each in="${eshop.NewsLetterCategory.list().findAll { !it.deleted && !customerInstance?.newsLetterCategories?.contains(it) }.sort { it.name }}"
                                var="category">
                            <div>
                                <g:checkBox name="categories" id="category${category.id}" value="${category.id}"
                                            checked="${customerInstance?.newsLetterCategories?.contains(category)}"
                                            title="${category.name}"/>
                                <label for="category${category.id}">
                                    ${category.name}
                                </label>
                            </div>
                        </g:each>
                    </div>
                    <g:hiddenField name="newsLetterProductTypes" id="selectedNodes"/>
                </td>
            </tr>
        </table>
        <br/>

        <div>
            <input class="btn btn-primary" onclick="gatherNewsLetterData()" type="submit"
                   value="${message(code: 'controlPanel.settings.profile.newsLetters.saveChanges')}"/>
        </div>
    </g:form>
</div>

<script language="javascript" type="text/javascript">
    $('.productTypesTree').tree({
        url: '${createLink(plugin:'rapid-grails', controller: 'rapidGrails', action: 'treeStructure', params:[domainClass: 'eshop.ProductType', relationProperty:'parentProduct', titleProperty:'name', selected:customerInstance?.newsLetterProductTypes?.collect{it.id}?.join(',')])}',
        checkbox: true,
        cascadeCheck: true
    });

    function gatherNewsLetterData() {
        var input = $('#selectedNodes');
        input.val('');
        var nodes = $('.productTypesTree').tree('getChecked');
        for (var i = 0; i < nodes.length; i++) {
            if (input.val())
                input.val(input.val() + ',');
            input.val(input.val() + nodes[i].id);
        }
    }
</script>