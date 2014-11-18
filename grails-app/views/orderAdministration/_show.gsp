<%@ page import="eshop.accounting.OnlinePayment; eshop.OrderHelper; eshop.Order" %>

<g:if test="${modified}">
    <div id="modificationFlag">
        <g:message code="order.modified"/>
    </div>
</g:if>

<div id="show-order" class="content scaffold-show" role="main">
    <ol class="property-list order" style="padding: 0;margin: 0;margin-bottom:10px;">

        <g:if test="${orderInstance?.trackingCode}">
            <li class="fieldcontain">
                <span id="trackingCode-label" class="property-label"><g:message code="order.trackingCode"/></span>

                <span class="property-value" aria-labelledby="trackingCode-label">${orderInstance.trackingCode}</span>

            </li>
        </g:if>

        <g:if test="${orderInstance?.status}">
            <li class="fieldcontain">
                <span id="status-label" class="property-label"><g:message code="order.status"
                                                                          default="Status"/></span>

                <span class="property-value" aria-labelledby="status-label"><g:message
                        code="order.status.${orderInstance.status}"/></span>

            </li>
        </g:if>

        <g:if test="${orderInstance?.ownerName}">
            <li class="fieldcontain">
                <span id="customer-label" class="property-label"><g:message code="order.customer"
                                                                            default="Customer"/></span>

                <span class="property-value"
                      aria-labelledby="customer-label">${orderInstance?.ownerName?.encodeAsHTML()}</span>

            </li>
        </g:if>

        <g:if test="${orderInstance?.ownerMobile}">
            <li class="fieldcontain">
                <span id="ownerMobile-label" class="property-label"><g:message code="order.ownerMobile"
                                                                               default="Owner Mobile"/></span>

                <span class="property-value" aria-labelledby="ownerMobile-label"><g:fieldValue bean="${orderInstance}"
                                                                                               field="ownerMobile"/></span>

            </li>
        </g:if>

        <g:if test="${orderInstance?.ownerTelephone}">
            <li class="fieldcontain">
                <span id="ownerTelephone-label" class="property-label"><g:message code="order.ownerTelephone"
                                                                                  default="Owner Telephone"/></span>

                <span class="property-value" aria-labelledby="ownerTelephone-label"><g:fieldValue
                        bean="${orderInstance}" field="ownerTelephone"/></span>

            </li>
        </g:if>

        %{--<g:if test="${orderInstance?.billingAddress}">--}%
            %{--<li class="fieldcontain">--}%
                %{--<span id="billingAddress-label" class="property-label"><g:message code="order.billingAddress"--}%
                                                                                  %{--default="Billing Address"/></span>--}%

                %{--<span class="property-value"--}%
                      %{--aria-labelledby="billingAddress-label">${orderInstance?.billingAddress?.encodeAsHTML()}</span>--}%

            %{--</li>--}%
        %{--</g:if>--}%

        <g:if test="${orderInstance?.sendingAddress}">
            <li class="fieldcontain">
                <span id="sendingAddress-label" class="property-label"><g:message code="order.sendingAddress"
                                                                                  default="Sending Address"/></span>

                <span class="property-value"
                      aria-labelledby="sendingAddress-label">${orderInstance?.sendingAddress?.encodeAsHTML()}</span>

            </li>
        </g:if>
        <g:if test="${orderInstance?.deliveryTime}">
            <li class="fieldcontain">
                <span id="deliveryTime-label" class="property-label"><g:message code="order.deliveryTime"
                                                                                  default="DeliveryTime"/></span>

                <span class="property-value"
                      aria-labelledby="sendingAddress-label">${orderInstance?.deliveryTime?.encodeAsHTML()}</span>

            </li>
        </g:if>

        <g:if test="${orderInstance?.ownerEmail}">
            <li class="fieldcontain">
                <span id="ownerEmail-label" class="property-label"><g:message code="order.ownerEmail"
                                                                              default="Owner Email"/></span>

                <span class="property-value" aria-labelledby="ownerEmail-label"><g:fieldValue bean="${orderInstance}"
                                                                                              field="ownerEmail"/></span>

            </li>
        </g:if>

        %{--<g:set var="creationTrackingLogItem"--}%
               %{--value="${orderInstance?.trackingLogs.find { it?.action == OrderHelper.ACTION_CREATION }}"/>--}%
        %{--<g:if test="${creationTrackingLogItem}">--}%
            %{--<li class="fieldcontain">--}%
                %{--<span id="creationDate-label" class="property-label"><g:message code="order.created.date"/></span>--}%

                %{--<span class="property-value" aria-labelledby="creationDate-label"><rg:formatJalaliDate--}%
                        %{--date="${creationTrackingLogItem?.date}" hm="true"/></span>--}%

            %{--</li>--}%
        %{--</g:if>--}%

        %{--<li class="fieldcontain">--}%
            %{--<span id="vendors-label" class="property-label"><g:message code="order.vendors"/></span>--}%

            %{--<div class="property-value" aria-labelledby="vendors-label" style="line-height: 18px">--}%
                %{--<% def orderTrackingService = grailsApplication.classLoader.loadClass('eshop.OrderTrackingService').newInstance() %>--}%
                %{--<g:set var="vendors" value="${orderTrackingService.findAllVendorsOfOrder(orderInstance)}"></g:set>--}%
                %{--<g:each in="${vendors}">--}%
                    %{--<div>${it}</div>--}%
                %{--</g:each>--}%
            %{--</div>--}%

        %{--</li>--}%

        <li class="fieldcontain">
            <g:if test="${orderInstance?.sendFactorWith}">
                <span id="sendFactorWith-label" class="property-value"><b><g:message code="sendFactorWith"/></b></span>
            </g:if>

            <g:else>
                <span id="sendFactorWith-label" class="property-value"><b><g:message code="dont-send-factor"/></b></span>
            </g:else>


        </li>
    <li class="fieldcontain">
        <g:if test="${orderInstance?.callBeforeSend}">
            <span id="sendFactorWith-label" class="property-value"><g:message code="call-before-send"/></span>
        </g:if>

        <g:else>
            <span id="sendFactorWith-label" class="property-value"><b><g:message code="send-surprise"/></b></span>
        </g:else>


    </li>
    <g:if test="${orderInstance?.buyerName}">
        <li class="fieldcontain">
            <span class="property-label"><g:message code="order.buyerName"/></span>

            <span class="property-value" aria-labelledby="deliverySourceStation-label">
                ${orderInstance?.buyerName}
            </span>

        </li>
    </g:if>
    <g:if test="${orderInstance?.buyerAmount}">
        <li class="fieldcontain">
            <span class="property-label"><g:message code="order.buyerAmount"/></span>

            <span class="property-value" aria-labelledby="deliverySourceStation-label">
                ${orderInstance?.buyerAmount}
            </span>

        </li>
    </g:if>
        <g:if test="${orderInstance?.deliverySourceStation}">
            <li class="fieldcontain">
                <span id="deliverySourceStation-label" class="property-label"><g:message code="deliveryMethod"/></span>

                <span class="property-value" aria-labelledby="deliverySourceStation-label">
                    ${orderInstance?.deliverySourceStation.method}: ${orderInstance?.deliverySourceStation}
                </span>

            </li>
        </g:if>
        <g:if test="${!orderInstance?.deliverySourceStation?.method?.hidePrice}">
            <g:if test="${orderInstance?.deliveryPrice || orderInstance?.deliveryPrice == 0}">
                <li class="fieldcontain">
                    <span id="deliveryPrice-label" class="property-label"><g:message code="deliveryPrice"/></span>

                    <span class="property-value" aria-labelledby="deliveryPrice-label">
                        <g:if test="${orderInstance?.deliveryPrice == 0}">
                            <g:message code="free"/>
                        </g:if>
                        <g:else>
                            <g:formatNumber number="${orderInstance?.deliveryPrice}" type="number"/>
                        </g:else>
                    </span>

                </li>
            </g:if>
        </g:if>
        <g:if test="${orderInstance?.totalPrice}">
            <li class="fieldcontain">
                <span id="totalPrice-label" class="property-label"><g:message code="orderItem.totalPrice"/></span>

                <span class="property-value" aria-labelledby="totalPrice-label">
                    <g:formatNumber number="${orderInstance?.totalPrice}" type="number"/>
                </span>

            </li>
        </g:if>
        <g:if test="${orderInstance?.usedAccountValue}">
            <li class="fieldcontain">
                <span id="usedAccountValue-label" class="property-label"><g:message code="orderItem.usedAccountValue"/></span>

                <span class="property-value" aria-labelledby="totalPrice-label">
                    <g:formatNumber number="${orderInstance?.usedAccountValue}" type="number"/>
                </span>

            </li>
            <li class="fieldcontain">
                <span id="totalPayablePrice-label" class="property-label"><g:message code="orderItem.totalPayablePrice"/></span>

                <span class="property-value" aria-labelledby="totalPrice-label">
                    <g:formatNumber number="${orderInstance?.totalPayablePrice}" type="number"/>
                </span>

            </li>


        </g:if>

    <li class="fieldcontain">
        <span id="paymenttype-label" class="property-label"><g:message code="payment.type"/></span>

        <span class="property-value" aria-labelledby="totalPrice-label">
            <g:message code="${orderInstance?.paymentType}"/>
        </span>

    </li>
    <g:if test="${orderInstance?.paymentType=='online'}">
        <li class="fieldcontain">
            <span id="paymentDone-label" class="property-label"><g:message code="payment.done"/></span>

            <span class="property-value" aria-labelledby="totalPrice-label">
                <g:message code="payment.done.${orderInstance?.paymentDone}"/>
            </span>

        </li>
    </g:if>
    <g:if test="${orderInstance}">
        <g:set var="payments" value="${OnlinePayment.findAllByOrderAndTransactionReferenceCodeIsNotNullAndResultCodeGreaterThan(orderInstance,0)}"/>
        <g:if test="${payments}">
            <g:each in="${payments}">
                <li class="fieldcontain">
                    <span id="payment${it.id}-label" class="property-label"><g:message code="payment.online.payed"/></span>

                    <span class="property-value" aria-labelledby="totalPrice-label">
                        <g:formatNumber number="${it?.amount}" type="number"/> <g:message code="rial"/> -
                        ${it.account} - ${it.referenceId} - ${it.transactionReferenceCode}
                    </span>

                </li>
            </g:each>
        </g:if>
    </g:if>

    </ol>
</div>
