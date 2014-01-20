<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 1/11/14
  Time: 6:54 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="navigation.manage.menuConfig"/></title>
    %{--<link rel="stylesheet" type="text/css" href="${resource(plugin: 'rapid-grails', dir:'dynatree/skin', file: 'ui.dynatree.css')}"/>--}%
    <link rel="stylesheet" type="text/css"
          href="${resource(plugin: 'rapid-grails', dir: 'dynatree/skin-vista', file: 'ui.dynatree.css')}"/>
    <script type="text/javascript"
            src="${resource(plugin: 'rapid-grails', dir: 'dynatree/js', file: 'jquery.dynatree.dev.js')}"></script>

    <style type="text/css">

    ul.dynatree-container {
        text-align: right;
    }

    .dynatree-container.dynatree-rtl .dynatree-title {
        text-align: right;
    }

    ul.dynatree-container.dynatree-rtl ul {
        padding: 0 16px 0 0;
        text-align: right;
    }

    ul.dynatree-container.dynatree-rtl li {
        background-position: right 0;
        background-image: url(${resource(plugin: 'rapid-grails', dir: 'dynatree/skin', file: 'vline-rtl.gif')});
    }

    .dynatree-container.dynatree-rtl span.dynatree-connector,
    .dynatree-container.dynatree-rtl span.dynatree-expander,
    .dynatree-container.dynatree-rtl span.dynatree-icon,
    .dynatree-container.dynatree-rtl span.dynatree-drag-helper-img,
    .dynatree-container.dynatree-rtl #dynatree-drop-marker {
    }
    </style>


    <script type="text/javascript"><!--
    $(function () {
        <g:each in="${productTypes}" var="productType">

        for (var i = 1; i <= 6; i++)
            setupColumnTree(i, ${productType.id});
        </g:each>

    });

    function setupColumnTree(index, pt) {
        $("#columnTree" + index + "_" + pt).dynatree({
            initAjax: {
                url: "menuColumnProductTypesJson/" + index + "?pt=" + pt
            },
            dnd: {
                autoExpandMS: 1000,
                preventVoidMoves: true,
                onDragStart: function (node) {
                    return true;
                },
                onDragEnter: function (node, sourceNode) {
                    return true;
                },
                onDrop: function (node, sourceNode, hitMode, ui, draggable) {
                    var copynode;
                    if (sourceNode) {
                        copynode = sourceNode.toDict(true, function (dict) {
                            dict.title = dict.title;
                            dict.key = dict.key
//                            delete dict.key;
                        });
                    } else {
                        copynode = {title: "This node was dropped here (" + ui.helper + ")."};
                    }
                    if (hitMode == "over") {
                        node.addChild(copynode);
                        node.expand(true);
                    } else if (hitMode == "before") {
                        node.parent.addChild(copynode, node);
                    } else if (hitMode == "after") {
                        node.parent.addChild(copynode, node.getNextSibling());
                    }
                    sourceNode.remove();
                }
            },
            onPostInit: function () {
                this.$tree.find("ul.dynatree-container").attr("DIR", "RTL").addClass("dynatree-rtl");
            }
        });
    }

    function saveMenuConfig() {

        var obj = [];
        <g:each in="${productTypes}" var="productType">
        <g:each in="${1..6}" var="i">
        var rootNode = $("#columnTree${i}_${productType.id}").dynatree("getRoot");
        var nodeList = rootNode.getChildren();
        obj = [];
        if (nodeList)
            for (var i = 0; i < nodeList.length; i++)
                obj[obj.length] = getNodeData(nodeList[i]);
        $("#column_${productType.id}_${i}").val(JSON.stringify(obj));
        </g:each>
        </g:each>
    }

    function getNodeData(node) {
        var item = {}
        item.key = node.data.key.replace("_", "");
        item.children = [];
        item.expand = true;
        item.title = node.data.title;
        var nodeList = node.getChildren();
        if (nodeList && nodeList.length > 0) {
            item.isFolder = true
            for (var i = 0; i < nodeList.length; i++)
                item.children[item.children.length] = getNodeData(nodeList[i]);
        }
        else {
            item.isFolder = false
        }
        return item;
    }
    -->
    </script>

</head>

<body>
<h2><g:message code="navigation.manage.menuConfig"/></h2>

<div class="content" role="main">
    <g:if test="${flash.message}">
        <div style="background-color:lightgreen;border-radius: 4px;padding:5px;margin-bottom: 10px;">
            ${flash.message}
        </div>
    </g:if>
    <g:form controller="menuConfig" action="save" onsubmit="saveMenuConfig();">
        <div id="menu-tabs">
            <ul>
                <g:each in="${productTypes}" var="productType">
                    <li><a href="#items_${productType.id}">${productType.name}</a></li>
                </g:each>
            </ul>
            <g:each in="${productTypes}" var="productType">
                <g:each in="${1..6}" var="i">
                    <g:hiddenField name="column_${productType.id}_${i}" id="column_${productType.id}_${i}"/>
                </g:each>
                <div id="items_${productType.id}">
                    <table>
                        <tbody>
                        <tr valign="top">
                            <td>
                                <div id="columnTree1_${productType.id}"></div>
                            </td>
                            <td>
                                <div id="columnTree2_${productType.id}"></div>
                            </td>
                            <td>
                                <div id="columnTree3_${productType.id}"></div>
                            </td>
                            <td>
                                <div id="columnTree4_${productType.id}"></div>
                            </td>
                            <td>
                                <div id="columnTree5_${productType.id}"></div>
                            </td>
                            <td>
                                <div id="columnTree6_${productType.id}"></div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </g:each>
        </div>
        <script language="javascript" type="text/javascript">
            $(function () {
                $("#menu-tabs").tabs({
                    selected: 0
                });
            });
        </script>

        <div class="toolbar">
            <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
                   style="padding:10px;margin:10px;" value="${message(code: 'save')}"/>
            <g:link controller="menuConfig" action="clear" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
                    style="padding:10px;margin:10px;">${message(code: 'clearAll')}</g:link>
        </div>
    </g:form>

</div>
</body>
</html>