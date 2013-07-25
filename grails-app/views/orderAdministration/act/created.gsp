<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 5/9/13
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.tipsy.css')}"/>
    <g:javascript src="jquery.tipsy.js"/>
    <style>
    table {
        border: 1px solid #eeeeee;
        background-color: #ffffff;
    }

    h3 {
        margin: 10px;
    }

    th, td {
        text-align: right;
        border: 1px solid #eeeeee;
    }

    .no-border {
        border-width: 0;
    }

    .hideIt {
        display: none;
    }

    .fieldcontain label, .fieldcontain .property-label {
        display: inline-block;
        width: auto;
        margin-right: 10px;
    }

    input[type="button"], input[type="submit"] {
        padding: 1px 10px !important;
        font-family: tahoma !important;
        font-size: 11px !important;
        margin-right: 10px;
        font-weight: normal !important;
    }
    </style>
    <g:javascript>
        $(document).ready(function () {
            $('.tip').tipsy({live: true});
        })
    </g:javascript>
</head>

<body>
<% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
<div>
    <g:render template="show" model="${[orderInstance:order]}"/>
    <table class="clear table-simulated" dir="rtl">
        <tr>
            <th><g:message code="orderItem.product"/></th>
            <th><g:message code="orderItem.productModel"/></th>
            <th><g:message code="orderItem.unitPrice"/></th>
            <th><g:message code="orderItem.orderCount"/></th>
            <th><g:message code="orderItem.totalPrice"/></th>
            <th><g:message code="productModel.status"/></th>
            <th><g:message code="orderItem.action"></g:message></th>
        </tr>
        <g:each in="${order.items}" var="orderItem">
            <tr>
                <td>
                    ${orderItem.productModel.product}
                </td>
                <td>
                    ${orderItem.productModel}
                </td>
                <g:set var="price" value="${priceService.calcProductModelPrice(orderItem.productModel.id).valueAddedVal}"/>
                <td>
                    <g:formatNumber number="${price?price:0}" type="number"/>
                </td>
                <td>
                    ${orderItem.orderCount}
                </td>
                <td>
                    <g:formatNumber number="${orderItem.orderCount * (price?price:0)}" type="number"/>
                </td>
                <td>
                    <g:message code="productModel.status.${orderItem.productModel.status}"/>
                </td>
                <td>
                    <b><a onclick="$('#producers_${orderItem.id}').fadeIn('slow');"><g:message
                            code="orderItem.showProducers"/></a></b> -
                    <b><a onclick="$('#price_${orderItem.id}').fadeIn('slow');"><g:message
                            code="orderItem.newPrice"/></a></b> -
                    <b><a onclick="$('#status_${orderItem.id}').fadeIn('slow');"><g:message
                            code="orderItem.changeStatus"/></a></b>
                </td>
            </tr>
            <tr class="hideIt" id="producers_${orderItem.id}">
                <td colspan="7" class="no-border">
                    <h3><a onclick="$('#producers_${orderItem.id}').fadeOut('slow');"><img
                            src="${resource(dir: 'images', file: 'close.png')}"/></a>
                        <g:message code="producers"/></h3>
                    <g:set var="producers"
                           value="${eshop.ProducerProductModel.findAllByProductModel(orderItem.productModel)}"/>
                    <table>
                        <tr>
                            <th><g:message code="producer"/></th>
                            <th><g:message code="producingProduct.discount"/></th>
                            <th><g:message code="producingProduct.refundable"/></th>
                            <th><g:message code="producingProduct.volume"/></th>
                            <th><g:message code="producingProduct.retail"/></th>
                            <th><g:message code="producingProduct.priceType"/></th>
                            <th><g:message code="producingProduct.cooperationPrice"/></th>
                            <th><g:message code="producingProduct.settlement"/></th>
                            <th><g:message code="producingProduct.testPeriod"/></th>
                            <th><g:message code="producingProduct.deliveryPlace"/></th>
                            <th><g:message code="producingProduct.transportationCost"/></th>
                            <th><g:message code="producingProduct.addedValue"/></th>
                        </tr>
                        <g:each in="${producers}" var="producer">
                            <tr>
                                <td>${producer.producer}</td>
                                <td>${producer.discount} ${producer.discountType == "percent" ? '%' : ''}</td>
                                <td class="tip" original-title="${producer.refundableDescription}"><g:message
                                        code="producingProduct.refundable.${producer.refundable}"/></td>
                                <td class="tip" original-title="${producer.volumeDescription}"><img
                                        src="${resource(dir: 'images', file: "${producer.volume ? 'yes' : 'no'}.png")}"/>
                                </td>
                                <td class="tip" original-title="${producer.retailDescription}"><img
                                        src="${resource(dir: 'images', file: "${producer.retail ? 'yes' : 'no'}.png")}"
                                </td>
                                <td><g:message code="producingProduct.priceType.${producer.priceType}"/></td>
                                <td>${producer.cooperationPrice}</td>
                                <td class="tip"
                                    original-title="${producer.settlementDescription}">${producer.settlement}</td>
                                <td>${producer.testPeriod}</td>
                                <td>${producer.deliveryPlace}</td>
                                <td>${producer.transportationCost}</td>
                                <td>${producer.addedValue}</td>
                            </tr>
                        </g:each>
                    </table>
                </td>
            </tr>
            <tr class="hideIt" id="price_${orderItem.id}">
                <td colspan="7" class="no-border">
                    <g:form controller="orderAdministration" action="updatePrice">
                        <h3><a onclick="$('#price_${orderItem.id}').fadeOut('slow');"><img
                                src="${resource(dir: 'images', file: 'close.png')}"/></a>
                            <g:message code="price"/></h3>
                        <g:hiddenField name="order.id" value="${params.id}"/>
                        <g:hiddenField name="orderItem.id" value="${orderItem.id}"/>
                        <g:hiddenField name="productModel.id" value="${orderItem.productModel.id}"/>
                        <span class="fieldcontain required">
                            <label for="currency">
                                <g:message code="price.currency.label" default="Currency"/>
                                <span class="required-indicator">*</span>
                            </label>
                            <g:select id="currency" name="currency" from="${eshop.Currency.list()}"
                                      optionKey="id" noSelection="['': message(code: 'rial')]" class="many-to-one"/>
                        </span>


                        <span class="fieldcontain required">
                            <label for="price">
                                <g:message code="price.price.label" default="Price"/>
                                <span class="required-indicator">*</span>
                            </label>
                            <g:field type="number" name="price" step="any" required="" value="${price}"/>
                        </span>

                        <span class="fieldcontain">
                            <input type="submit" value="${message(code: 'save')}"/>
                        </span>
                    </g:form>
                </td>
            </tr>
            <tr class="hideIt" id="status_${orderItem.id}">
                <td colspan="7" class="no-border">
                    <g:form controller="orderAdministration" action="updateProductModelStatus">
                        <h3><a onclick="$('#status_${orderItem.id}').fadeOut('slow');"><img
                                src="${resource(dir: 'images', file: 'close.png')}"/></a>
                            <g:message code="productModel.status"/> <g:message code="productModel"/></h3>
                        <g:hiddenField name="order.id" value="${params.id}"/>
                        <g:hiddenField name="orderItem.id" value="${orderItem.id}"/>
                        <g:hiddenField name="productModel.id" value="${orderItem.productModel.id}"/>
                        <span class="fieldcontain required">
                            <label for="status">
                                <g:message code="productModel.status.label" default="Status"/>

                            </label>
                            <g:select name="status" from="${orderItem.productModel.constraints.status.inList}" value="${orderItem?.productModel?.status}"
                                      valueMessagePrefix="productModel.status"/>
                        </span>

                        <span class="fieldcontain">
                            <input type="submit" value="${message(code: 'save')}"/>
                        </span>
                    </g:form>
                </td>
            </tr>
        </g:each>
    </table>
    <g:form controller="orderAdministration" action="act${order.status}" params="${[id:order.id]}">
        <div>
            <label for="description" style="margin:5px;">
                <g:message code="description"/>
            </label>
        </div>
    <div>
        <textarea name="description" id="description" cols="100" rows="5" style="margin:0"></textarea>
    </div>
    <div>
        <input type="submit" value='${message(code:"order.actions.${order.status}")}'/>
    </div>
    </g:form>
</div>
</body>
</html>