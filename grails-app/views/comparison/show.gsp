<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 4/23/13
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site">
    <title><g:message code="compare"/></title>
    <link href="${resource(dir: 'css/jquery.easyui/metro', file: 'easyui.css')}" rel="stylesheet" type="text/css"/>
    <link href="${resource(dir: 'css/jquery.easyui', file: 'easyui-rtl.css')}" rel="stylesheet" type="text/css"/>
    <link href="${resource(dir: 'css', file: 'jquery.msdropdown.css')}" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.panel.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.parser.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.validatebox.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.draggable.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.tree.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.msdropdown.js')}"></script>
    <style type="text/css">
    .ddcommon img {
        width: 20px;
        height: 20px;
    }

    .ddlabel {
        margin-right: 5px;
    }
    </style>
    <script language="javascript" type="text/javascript">
        function showProducts(productTypeId, brandId) {
            $("#productSelectorContainer").html('<img style="margin:auto;" class="loading" src="${resource(dir: 'images', file: 'loading.gif')}"/>');
            $("#productSelectorContainer").load('${createLink(controller: 'comparison', action: 'productSelector')}?productTypeId=' + productTypeId + "&brandId=" + brandId, function () {
            });
        }

        function addProductToCompareListAndShow(productTypeId) {
            var productId = $("#productCombo" + productTypeId).val();
            window.location.href = "${createLink(controller: 'comparison', action: 'addAndShow')}/" + productId;
        }
    </script>
</head>

<body>

<div class="tabbable">
<ul class="nav nav-tabs">
    <g:each in="${productTypeList}" var="productType">
        <li><a href="#tab${productType.item.id}" data-toggle="tab">
        %{--<img src="${createLink(controller: 'image', params:[type:'productType', id:productType.item.id, wh:'50x50'])}"/>--}%
            ${productType.item.name}</a></li>
    </g:each>
</ul>

<div class="tab-content">
    <g:each in="${productTypeList}" var="productType">
        <div id="tab${productType.item.id}" class="tab-pane">
            <div style="float: right;margin-bottom: 10px;">
                %{--<select name="brand" id="brandCombo${productType.item.id}" class="imageCombo"--}%
                %{--onchange="showProducts(${productType.item.id}, $(this).val())">--}%
                %{--<g:each in="${productType.brands}" var="brand">--}%
                %{--<option value="${brand.id}"--}%
                %{--data-image="${createLink(controller: 'image', params: [type: 'brand', id: brand.id])}">${brand.name}</option>--}%
                %{--</g:each>--}%
                %{--</select>--}%

                %{--<span id="productSelectorContainer"></span>--}%

                %{--<script language="javascript" type="text/javascript">--}%
                %{--$(document).ready(function(){--}%
                %{--showProducts(${productType.item.id}, $('#brandCombo${productType.item.id}').val());--}%
                %{--});--}%
                %{--</script>--}%
                <g:render template="productSearch" model="${[productType: productType.item]}"/>
            </div>

            <div style="float: left;margin-bottom: 10px;">
                <a class="btn btn-success" onclick="selectAttributes(${productType.item.id});"
                   style="height: 23px;"><g:message
                        code="comparison.selectAttributes.link"/></a>
            </div>

            <div class="comparison-container">
                <table class="comparison attribute-list" style="clear: both">
                    <tr class="comparisonTableHeader">
                        %{--<th></th>--}%
                        <th></th>
                        <g:each in="${productType.products}" var="product">
                            <th class="attributeValue">
                                <div class="imageBorder">
                                    <img onclick="enlargeProductImage(${product.id})"
                                         src="${createLink(controller: 'image', params: [id: product.id, wh: '100x100'])}"/>
                                </div>
                                <b>
                                    <a href="${createLink(controller: 'site', action: 'product', params: [id: product.id])}">${product}</a>
                                </b>
                                <span class="delete">
                                    [ <a
                                        href="${createLink(controller: 'comparison', action: 'remove', params: [id: product.id])}">
                                    <g:message code="application_delete"></g:message>
                                </a> ]
                                </span><br/>
                                <span><eshop:thumbnailPrice productId="${product.id}" hideLastUpdate="true"></eshop:thumbnailPrice></span>
                            </th>
                        </g:each>
                    </tr>
                    <tr>
                        %{--<td></td>--}%
                        <td class="attributeName"><g:message code="product.type"/></td>
                        <g:each in="${productType.products}" var="product">
                            <td class="attributeValue" ${productType.products.any { it.type?.title != productType.products.first().type?.title } ? 'style="font-weight:bold"' : ''}>
                                ${product.type?.title ?: '-'}
                            </td>
                        </g:each>
                    </tr>
                    <tr>
                        %{--<td></td>--}%
                        <td class="attributeName"><g:message code="product.brand"/></td>
                        <g:each in="${productType.products}" var="product">
                            <td class="attributeValue">
                                <img width="80px"
                                     src="${createLink(controller: 'image', params: [type: 'brand', id: product.brand.id])}"
                                     title="${product.brand}"/>
                            </td>
                        </g:each>
                    </tr>
                    <tr>
                        %{--<td></td>--}%
                        <td class="attributeName"><g:message code="productModel"/></td>
                        <g:each in="${productType.products}" var="product">
                            <td class="attributeValue">
                                ${product.name ?: '-'}
                            </td>
                        </g:each>
                    </tr>
                    <g:each in="${productType.rootAttributeCategories}" var="category">
                        <g:render template="attributeList"
                                  model="${[indent: 0, category: category, productType: productType]}"/>
                    </g:each>
                    <tr>
                        %{--<td></td>--}%
                        <td></td>
                        <g:each in="${productType.products}" var="product">
                            <td class="attributeValue">
                                <div class="buttons">
                                    <eshop:addToBasket prodcutId="${product.id}"
                                                       productTitle="${product}"
                                                       productPrice="price"></eshop:addToBasket>
                                    <eshop:addToWishList prodcutId="${product.id}"
                                                         productTitle="${product.toString()}"
                                                         productPrice="price"></eshop:addToWishList>
                                </div>
                            </td>
                        </g:each>
                    </tr>
                </table>
            </div>

            <div id="modal_${productType.item.id}" class="modal hide fade" tabindex="-1" role="window"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>

                <div class="modal-body">
                    <g:form controller="comparison" action="show">
                        <h3 class="font-koodak"><g:message code="comparison.selectAttributes.link"/></h3>

                        <div style="height: 300px;margin-bottom:10px;" class="scrollable">
                            <ul class="easyui-tree" id="tree-${productType.item.id}">
                                <g:each in="${productType.rootAttributeCategories}" var="category">
                                    <g:render template="attributeTree"
                                              model="${[category: category, productType: productType]}"/>
                                </g:each>
                            </ul>
                        </div>
                        <g:hiddenField name="productTypeId" value="${productType.item.id}"/>
                        <g:hiddenField name="selectedNodes" id="selectedNodes-${productType.item.id}"/>
                        <div>
                            <input type="submit" onclick="gatherData(${productType.item.id})" class="btn btn-primary"
                                   value="${message(code: 'comparison.selectAttributes.button')}"/>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </g:each>
</div>

<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="window" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    </div>

    <div class="modal-body">
    </div>
</div>

<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('ul.nav.nav-tabs li').first().addClass('active');
        $('div.tab-content div.tab-pane').first().addClass('active');
        createRemoveButtons();


        $(document).scroll(function (e) {
            fixComparisonTableHeader();
        });

        $(window).resize(function(){
            fixComparisonTableHeader();
        });

        fixComparisonTableHeader();
    });

    function fixComparisonTableHeader() {
        var position = $(window).scrollTop();

        if (position > 114) {
            $('.comparison-container')
                    .addClass('fixed')
                    .each(function () {
                        $(this).css('padding-top', $($(this).find('.comparisonTableHeader')[0]).height() + 'px');
                    });
            fixHeaderSize();
        }
        else {
            $('.comparison-container')
                    .removeClass('fixed')
                    .css('padding-top', 0);
        }
    }

    function fixHeaderSize() {
        $('.comparisonTableHeader').each(function(){
            var headerCells = $(this).children('th');
            var firstRowCells = $(this).next('tr').children('td');
            for (var i = 0; i < headerCells.length; i++)
                $(headerCells[i]).width($(firstRowCells[i]).width());
        });
    }

    function enlargeProductImage(id) {

        $("#myModal .modal-body").html('<img class="loading" src="${resource(dir: 'images', file: 'loading.gif')}"/>');
        $("#myModal").modal({
            show: true
        });
        $("#myModal .modal-body").load('${createLink(controller: 'site', action: 'productImage')}/' + id, function () {
        });
    }

    function createRemoveButtons() {
        $('.attribute-list tr .removeThisRow').append('<div/>');
        $('.attribute-list tr .removeThisRow div').click(function () {
            if ($(this).parent().attr('categoryId'))
                $('.category_' + $(this).parent().attr('categoryId')).fadeOut();
            $(this).parent().parent().fadeOut();
        });
        $('.attribute-list tr').hoverIntent(function () {
            $(this).find('.removeThisRow div').fadeIn();
        }, function () {
            $(this).find('.removeThisRow div').fadeOut();
        });
    }

    function selectAttributes(id) {
        $("#modal_" + id).modal({
            show: true
        });
    }

    function gatherData(productTypeId) {
        var input = $('#selectedNodes-' + productTypeId);
        input.val('');
        var nodes = $('#tree-' + productTypeId).tree('getChecked');
        for (var i = 0; i < nodes.length; i++) {
            if (input.val())
                input.val(input.val() + ',');
            input.val(input.val() + nodes[i].id);
        }
    }
</script>
</body>
</html>