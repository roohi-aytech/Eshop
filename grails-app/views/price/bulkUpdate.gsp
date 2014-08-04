<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 4/27/14
  Time: 2:38 PM
--%>

<%@ page import="grails.converters.JSON" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="price.bulkUpdate"/></title>
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap.min.css', plugin: 'rapid-grails')}"/>
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-rtl.css', plugin: 'rapid-grails')}"/>
    %{--<link rel="stylesheet"--}%
    %{--href="${resource(dir: 'bootstrap/css', file: 'bootstrap-responsive.min.css', plugin: 'rapid-grails')}"/>--}%
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap-select.css')}"/>
    <script language="javascript" type="text/javascript"
            src="${resource(dir: 'js', file: 'bootstrap-select.min.js')}"></script>
    <style type="text/css">
    body {
        background-color: #f5f5f5 !important;
    }

    #header h2, h3 {
        margin: 0 !important;
        font-family: "times new roman", serif !important;
    }

    * {
        font-family: tahoma, serif !important;
    }

    .nav a.home, .nav a.login, .nav a.logout, .nav a.profile {
        font-size: 10px;
    }

    .nav {
        margin: 0;
    }

    ul, ol {
        margin: 0;
    }

    .combo {
        border-radius: 0;
        height: 25px !important;
        border-color: #cccccc !important;
    }

    .combo-text {
        background: transparent !important;
        box-shadow: none !important;
        height: 25px !important;
    }

    .combo-arrow {
        background-color: transparent !important;
        height: 25px !important;
    }

    .bootstrap-select.btn-group .btn .caret {
        left: 12px;
        right: auto;
    }

    .bootstrap-select.btn-group .btn .filter-option {
        float: right;
        text-align: right;
    }

    .btn-group > .btn:first-child {
        border-radius: 0;
        padding-right: 5px;
        padding-left: 25px;
    }

    .bootstrap-select.btn-group .dropdown-menu li a span.text {
        font-size: 12px;
    }

    .btn-group > .btn, .btn-group > .dropdown-menu {
        font-size: 12px;
    }

    .dropdown-menu {
        border-radius: 0;
        max-height: 250px !important;
    }

    .btn_selectAll, .btn_clearAll {
        display: inline-block;
        font-size: 11px;
        margin-right: 20px;
        cursor: pointer;
    }

    form {
        background: none repeat scroll 0 0 #fcfcfc;
        border: 1px solid #ddd;
        padding: 10px;
    }
    </style>
</head>

<body>
<h2><g:message code="price.bulkUpdate"/></h2>

<h3 style="clear: both;padding-top:20px;"><g:message code="price.bulkUpdate.excel"/></h3>
<form action="${createLink(action: 'exportPriceList')}" id="criteriaForm" method="post">

    <div class="fieldcontain">
        <label><g:message code="productType"/></label>
        <select name="productTypes" id="productTypes" multiple class="easyui-combotree" style="width:500px;"></select>

        <a class="btn_selectAll" onclick="selectAllProductTypes();"><g:message code="selectAll"/></a>
        <a class="btn_clearAll" onclick="clearAllProductTypes();"><g:message code="clearAll"/></a>
    </div>

    <div id="criteriaContainer">
    <g:render template="bulkUpdateForm" />
    </div>
    <br/>
    <input type="submit" value="<g:message code="price.bulkUpdate.excel"/>"/>
</form>
<h3 style="clear: both;padding-top:20px;"><g:message code="price.bulkUpdate.excel.import"/></h3>
<g:uploadForm action="importPriceList">
    <div class="fieldcontain">
        <input type="file" name="file" style="max-width: 500px;width: 490px;padding-bottom: 5px;"/>
    </div>
    <br/>
    <input type="submit" value="<g:message code="price.bulkUpdate.excel.import"/>"/>
</g:uploadForm>
<g:render template="bulkUpdateResults"/>
<script src="${resource(dir: 'bootstrap/js', file: 'bootstrap.min.js', plugin: 'rapid-grails')}"></script>
<script language="javascript" type="text/javascript">

    function clearAllProductTypes() {
        var tree = $('#productTypes').combotree('tree');
        var nodes = tree.tree('getChecked', 'checked');
        for (var i = 0; i < nodes.length; i++)
            tree.tree('uncheck', nodes[i].target);

        $('#productTypesFieldContainer [name=productTypes]').remove();
        var input = $('<input class="combo-value" type="hidden" name="productTypes" value=""/>');
        $('#productTypesFieldContainer .combo').append(input);
    }

    function selectAllProductTypes() {
        var tree = $('#productTypes').combotree('tree');
        var nodes = tree.tree('getChecked', 'unchecked');
        for (var i = 0; i < nodes.length; i++) {
            tree.tree('check', nodes[i].target);
            var input = $('<input class="combo-value" type="hidden" name="productTypes" value="' + nodes[i].id + '"/>');
            $('#productTypesFieldContainer .combo').append(input);
        }
    }

    function reloadCriteriaForm(){
        $('.combo-p').hide();
        $('#criteriaContainer').slideUp(1000, function(){
            $(this).html('${message(code:'waiting')}').slideDown(1000);
        });
        $.ajax({
            type: "POST",
            url: "${createLink(action: 'bulkUpdateForm')}",
            data: $('#criteriaForm').serialize()
        }).done(function (response) {
            $('#criteriaContainer').slideUp(1000, function(){
                $(this).html(response).slideDown(1000);
            });
        });
    }
</script>
</body>
</html>