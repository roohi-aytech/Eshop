<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 7/10/13
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='site'/>
    <title><g:message
            code="controlPanel.settings.profile.newsLetters.label"></g:message></title>
    <link rel="stylesheet" href="${resource(dir: 'css/jquery.easyui/metro', file: 'easyui.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css/jquery.easyui', file: 'easyui-rtl.css')}"/>
    <g:javascript src="jquery.easyui/jquery.panel.js"></g:javascript>
    <g:javascript src="jquery.easyui/jquery.parser.js"></g:javascript>
    <g:javascript src="jquery.easyui/jquery.validatebox.js"></g:javascript>
    <g:javascript src="jquery.easyui/jquery.draggable.js"></g:javascript>
    <g:javascript src="jquery.easyui/jquery.tree.js"></g:javascript>
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
    </style>
</head>

<body>
<div class="control-panel">
    <h2>
        <g:message code="controlPanel.settings.profile.newsLetters.label"></g:message>
    </h2>

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
                        <g:each in="${customer?.newsLetterCategories?.sort { it.name }}" var="category">
                            <div>
                                <g:checkBox name="categories" id="category${category.id}" value="${category.id}"
                                            checked="${customer?.newsLetterCategories?.contains(category)}"
                                            title="${category.name}"/>
                                <label for="category${category.id}">
                                    ${category.name}
                                </label>
                            </div>
                        </g:each>
                        <g:each in="${eshop.NewsLetterCategory.list().findAll { !it.deleted && !customer?.newsLetterCategories?.contains(it) }.sort { it.name }}"
                                var="category">
                            <div>
                                <g:checkBox name="categories" id="category${category.id}" value="${category.id}"
                                            checked="${customer?.newsLetterCategories?.contains(category)}"
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
            <input class="btn btn-primary" onclick="gatherData()" type="submit" value="${message(code: 'controlPanel.settings.profile.newsLetters.saveChanges')}"/>
        </div>
    </g:form>
</div>

<script language="javascript" type="text/javascript">
    $('.productTypesTree').tree({
        url: '${createLink(plugin:'rapid-grails', controller: 'rapidGrails', action: 'treeStructure', params:[domainClass: 'eshop.ProductType', relationProperty:'parentProduct', titleProperty:'name', selected:customer.newsLetterProductTypes?.collect{it.id}?.join(',')])}',
        checkbox: true,
        cascadeCheck: true
    });

    function gatherData(){
        var input = $('#selectedNodes');
        input.val('');
        var nodes = $('.productTypesTree').tree('getChecked');
        for(var i = 0; i < nodes.length; i++) {
            if(input.val())
                input.val(input.val() + ',');
            input.val(input.val() + nodes[i].id);
        }
    }
</script>
</body>
</html>