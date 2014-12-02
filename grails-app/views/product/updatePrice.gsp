<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/22/14
  Time: 2:57 PM
--%>

<%@ page import="eshop.ProductModel; eshop.Price" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="updatePrice.title"/> ${product}</title>
    <style>
    .open-link{
        font-family: tahoma;
        font-size:12px;
        direction: rtl;
    }
    .open-link span{
        color:#4169e1;
        cursor: pointer;
    }
    </style>
</head>

<body>
<h2><g:message code="updatePrice.title"/> ${product}</h2>

<div class="clear panel">
    <g:form controller="product" action="bulkUpdate">
        <g:hiddenField name="id" value="${product.id}"/>
        <table style="width: auto;">
            <tr>
                <th><g:message code="productModel"/></th>
                <th><g:message code="price"/></th>
                <th><g:message code="productModel.status.label"/></th>
            </tr>
            <g:each in="${models}" var="model" status="index">
                <tr class="${index % 2 ? 'odd' : 'even'}">
                    <td style="text-align: right">${model}</td>
                    <td style="text-align: right">
                        <g:set var="price" value="${Price.findByProductModelAndEndDateIsNull(model)}"/>
                        <g:textField name="price_${model.id}" onKeyup="formatPrice(this);"
                                     value="${g.formatNumber(number: price?.price ?: 0, type: 'number')}"/>
                        <g:select name="currency_${model.id}" from="${eshop.Currency.list()}"
                                  optionKey="id" noSelection="['': message(code: 'rial')]"
                                  value="${price?.currency?.id}" class="many-to-one"/>
                    </td>
                    <td style="text-align: right">
                        <g:select name="status_${model.id}" from="${ProductModel.constraints.status.inList}"
                                  value="${model.status}" valueMessagePrefix="productModel.status"/>
                    </td>
                </tr>
            </g:each>
        </table>

        <div style="padding:10px;">
            <g:submitButton name="submit" value="${message(code: 'save')}"/>
        </div>
    </g:form>
</div>
<script type="text/javascript" language="javascript">

    function formatPrice(item) {
        $(item).val(addCommasOnKeyPress($(item).val()));
    }


    function addCommasOnKeyPress(nStr) {
        nStr = nStr.replace(/\,/g, '');
        nStr += '';
        var x = nStr.split('.');
        var x1 = x[0];
        var x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1 + x2;
    }
    <g:each in="${models}" var="model">
    $('#price_${model.id}').val(addCommasOnKeyPress($('#price_${model.id}').val()));
    </g:each>
</script>

<g:if test="${links?.size()}">
    <div id="details-tabs">
        <ul>
            <g:each in="${links}" var="link">
                <li><a href="#link${link.id}">${link.name}</a></li>
            </g:each>
        </ul>

        <g:each in="${links}" var="link">
            <div id="link${link.id}">
                <div>
                    <g:if test="${link.showType == 'window'}">
                        <div id="linkContainer${link?.id}"></div>
                        <script language="javascript" type="text/javascript">
                            window.open('${link.url}', '_blank');
                            $('#linkContainer${link?.id}').html('<div class="open-link">${message(code:'pricingLink.newTab.message')} (<span>${message(code:'pricingLink.newTab.open')}</span>)</div>')
                                    .find('span')
                                    .click(function () {
                                        window.open('${link.url}', '_blank');
                                    });
                        </script>
                    </g:if>
                    <g:elseif test="${link.showType == 'inline'}">
                        <iframe src="${createLink(controller: 'pricingLink', action: 'load', id: link.id)}"
                                style="width:100%;min-height: 600px;" frameborder="0"></iframe>
                    </g:elseif>
                    <g:else>
                        <iframe src="${link?.url}"
                                style="width:100%;min-height: 600px;" frameborder="0"></iframe>
                    </g:else>
                </div>
            </div>
        </g:each>

    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            $("#details-tabs").tabs();
        });
    </script>
</g:if>
</body>
</html>