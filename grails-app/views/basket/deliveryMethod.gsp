<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 7/14/13
  Time: 6:33 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site">
    <title><g:message code="deliveryMethod.selection"></g:message></title>
</head>

<body>
<div class="control-panel">
    <h2><g:message code="deliveryMethod.selection"></g:message></h2>
    <g:form action="invoice">
        <g:hiddenField id="price" name="price"/>
        <ul class="deliveryMethodList">
            <g:each in="${deliveryMethods}" var="deliveryMethod" status="indexer">
                <g:if test="${indexer == 0}">
                    <script language="javascript" type="text/javascript">
                        $('#price').val('${deliveryMethod.price}');
                    </script>
                </g:if>
                <li>
                    <table cellspacing="5" cellpadding="5">
                        <tr>
                            <td rowspan="3">
                                <input type="radio" id="deliverySourceStation${deliveryMethod.sourceStation?.id}"
                                       name="deliverySourceStation" ${indexer == 0 ? 'checked' : ''}
                                       value="${deliveryMethod.sourceStation?.id}" onchange="if (this.checked) { $('#price').val('${deliveryMethod.price}'); }"/>
                            </td>
                            <td rowspan="3">
                                <label for="deliverySourceStation${deliveryMethod.sourceStation?.id}">
                                    <img src="${createLink(controller: 'image', params: [id: deliveryMethod.deliveryMethod.id, type: 'deliveryMethod'])}"/>
                                </label>
                            </td>
                            <td>
                                <label for="deliverySourceStation${deliveryMethod.sourceStation?.id}">
                                    <b>${deliveryMethod.deliveryMethod}</b>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <g:if test="${!deliveryMethod.deliveryMethod.insuranceIsRequired && deliveryMethod.deliveryMethod.insurancePercent > 0}">
                                    <input type="checkbox" id="insurance${deliveryMethod.sourceStation?.id}" name="insurance${deliveryMethod.sourceStation?.id}"
                                        onchange="if (this.checked) { $('#price').val('${deliveryMethod.priceWithInsurance}'); } else { $('#price').val('${deliveryMethod.price}'); }" />
                                    <label for="insurance${deliveryMethod.sourceStation?.id}">
                                        <g:message code="applyInsurance"/> (${deliveryMethod.deliveryMethod.insurancePercent}%)
                                    </label>
                                </g:if>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="deliverySourceStation${deliveryMethod.sourceStation?.id}">
                                    <g:message
                                            code="deliveryPrice"/>: ${(deliveryMethod.price) == 0 ? message(code: 'free') : deliveryMethod.price + ' ' + eshop.currencyLabel()}
                                </label>
                            </td>
                        </tr>
                        %{--${deliveryMethod.sourceStation}--}%
                    </table>
                </li>
            </g:each>
            <g:if test="${deliveryMethods.size == 0}">
                <g:message code="noDeliveryMethod"/>
            </g:if>
        </ul>
        <br/>

        <div>
            <common:link action="checkout" class="btn" https="${false}"><g:message code="invoice.return"/></common:link>
            <g:if test="${deliveryMethods.size > 0}">
                <input type="submit" class="btn btn-primary" style="height:30px;"
                       value="<g:message code="basket.invoice"/>"/>
            </g:if>
        </div>
    </g:form>
</div>

</body>
</html>