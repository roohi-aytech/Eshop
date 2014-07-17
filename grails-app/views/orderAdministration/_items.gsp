
<% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>

<table class="clear table-simulated" dir="rtl">
    <tr class="ui-widget-header">
        <th><g:message code="orderItem.product"/></th>
        <th><g:message code="invoice.item.price"></g:message></th>
        <th><g:message code="invoice.item.addedValue"></g:message></th>
        <th><g:message code="invoice.item.realPrice"></g:message></th>
        <th><g:message code="orderItem.orderCount"/></th>
        <th><g:message code="orderItem.totalPrice"/></th>
        <th><g:message code="productModel.status"/></th>
        <th><g:message code="orderItem.action"></g:message></th>
    </tr>
    <g:each in="${order.items.findAll {!it.deleted}}" var="orderItem">
        <tr>
            <td>
                ${orderItem.productModel}
                <g:if test="${orderItem.productModel.variationValues?.size() > 0}">
                    <g:each in="${orderItem.productModel.variationValues}" var="variationValue" status="index">
                        <g:if test="${index == 0}">
                            (
                        </g:if>
                        ${variationValue.variationGroup}: ${variationValue}
                        <g:if test="${index < orderItem.productModel.variationValues?.size() - 1}">
                            ,
                        </g:if>
                        <g:else>
                            )
                        </g:else>
                    </g:each>
                </g:if>
                <g:each in="${orderItem.addedValues}">
                    + ${it}
                </g:each>
            </td>
            <td><g:formatNumber number="${orderItem.baseUnitPrice}"
                                type="number"/></td>
            <td><g:formatNumber number="${orderItem.addedValuesPrice}"
                                type="number"/></td>
            <td><g:formatNumber number="${orderItem.unitPrice}"
                                type="number"/></td>
            <td class="center">${orderItem.orderCount}</td>
            <td><g:formatNumber number="${orderItem.totalPrice}"
                                type="number"/></td>
            <td>
                <g:message code="productModel.status.${orderItem.productModel.status}"/>
            </td>
            <td>
                <b><a onclick="$('#producers_${orderItem.id}').fadeIn('slow');" style="cursor: pointer"><g:message
                        code="orderItem.showProducers"/></a></b>
                <g:if test="${order.status == eshop.OrderHelper.STATUS_UPDATING || order.status == eshop.OrderHelper.STATUS_PAID }">-
                    <b><a onclick="$('#price_${orderItem.id}').fadeIn('slow');" style="cursor: pointer"><g:message
                            code="orderItem.newPrice"/></a></b> -
                    <b><a onclick="$('#status_${orderItem.id}').fadeIn('slow');" style="cursor: pointer"><g:message
                            code="orderItem.changeStatus"/></a></b> -
                    <b><a onclick="$('#count_${orderItem.id}').fadeIn('slow');" style="cursor: pointer"><g:message
                            code="orderItem.changeCount"/></a></b>
                </g:if>
            </td>
        </tr>
        <tr class="hideIt" id="producers_${orderItem.id}">
            <td colspan="8" class="no-border">
                <h3><a style="cursor: pointer" onclick="$('#producers_${orderItem.id}').fadeOut('slow');"><img
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
                            <td class="tip" original-title="${producer.testPeriodDescription}"><img
                                    src="${resource(dir: 'images', file: "${producer.testPeriod ? 'yes' : 'no'}.png")}"/>
                            </td>
                            <td>${producer.deliveryPlace}</td>
                            <td>${producer.transportationCost}</td>
                            <td class="tip" original-title="${producer.addedValueDescription}"><img
                                    src="${resource(dir: 'images', file: "${producer.addedValue ? 'yes' : 'no'}.png")}"/>
                            </td>
                        </tr>
                    </g:each>
                </table>
            </td>
        </tr>
        <tr class="hideIt" id="price_${orderItem.id}">
            <td colspan="8" class="no-border">
                <form id="updatePriceForm${orderItem.id}">
                    <h3><a style="cursor: pointer" onclick="$('#price_${orderItem.id}').fadeOut('slow');"><img
                            src="${resource(dir: 'images', file: 'close.png')}"/></a>
                        <g:message code="price"/></h3>
                    <g:hiddenField name="order.id" value="${params.id}"/>
                    <g:hiddenField name="orderItem.id" value="${orderItem.id}"/>
                    <g:hiddenField name="productModel.id" value="${orderItem.productModel.id}"/>

                    <span class="fieldcontain required">
                        <label for="price">
                            <g:message code="price.price.label" default="Price"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:field type="number" name="price" step="any" required="" value="${price}"/>
                    </span>

                    <span class="fieldcontain required">
                        <label for="currency">
                            <g:message code="price.currency.label" default="Currency"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:select id="currency" name="currency.id" from="${eshop.Currency.list()}"
                                  optionKey="id" noSelection="['': message(code: 'rial')]" class="many-to-one"/>
                    </span>

                    <span class="fieldcontain">
                        <input type="button" onclick="updatePrice(${orderItem.id});" value="${message(code: 'save')}"/>
                    </span>
                </form>
            </td>
        </tr>
        <tr class="hideIt" id="status_${orderItem.id}">
            <td colspan="8" class="no-border">
                <form id="updateProductModelStatusForm${orderItem.id}">
                    <h3><a style="cursor: pointer" onclick="$('#status_${orderItem.id}').fadeOut('slow');"><img
                            src="${resource(dir: 'images', file: 'close.png')}"/></a>
                        <g:message code="productModel.status"/> <g:message code="productModel"/></h3>
                    <g:hiddenField name="order.id" value="${params.id}"/>
                    <g:hiddenField name="orderItem.id" value="${orderItem.id}"/>
                    <g:hiddenField name="productModel.id" value="${orderItem.productModel.id}"/>
                    <span class="fieldcontain required">
                        <label for="status">
                            <g:message code="productModel.status.label" default="Status"/>

                        </label>
                        <g:select name="status" from="${orderItem.productModel.constraints.status.inList}"
                                  value="${orderItem?.productModel?.status}"
                                  valueMessagePrefix="productModel.status"/>
                    </span>

                    <span class="fieldcontain">
                        <input type="button" onclick="updateProductModelStatus(${orderItem.id});" value="${message(code: 'save')}"/>
                    </span>
                </form>
            </td>
        </tr>
        <tr class="hideIt" id="count_${orderItem.id}">
            <td colspan="8" class="no-border">
                <form id="updateCountForm${orderItem.id}">
                    <h3><a style="cursor: pointer" onclick="$('#count_${orderItem.id}').fadeOut('slow');"><img
                            src="${resource(dir: 'images', file: 'close.png')}"/></a>
                        <g:message code="count"/></h3>
                    <g:hiddenField name="order.id" value="${params.id}"/>
                    <g:hiddenField name="orderItem.id" value="${orderItem.id}"/>

                    <span class="fieldcontain required">
                        <label for="count">
                            <g:message code="count" default="Count"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:field type="number" name="count" step="any" required="" value="${orderItem.orderCount}"/>
                    </span>

                    <span class="fieldcontain">
                        <input type="button" onclick="updateCount(${orderItem.id});" value="${message(code: 'save')}"/>
                    </span>
                </form>
            </td>
        </tr>
    </g:each>
</table>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('.tip').tipsy({live: true});
    })
</script>