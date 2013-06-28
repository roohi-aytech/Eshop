<%@ page import="eshop.OrderHelper; eshop.Order" %>


<div id="show-order" class="content scaffold-show" role="main">
    <ol class="property-list order">

        <g:if test="${orderInstance?.status}">
            <li class="fieldcontain">
                <span id="status-label" class="property-label"><g:message code="order.status"
                                                                          default="Status"/></span>

                <span class="property-value" aria-labelledby="status-label"><g:message code="status.${orderInstance.status}"/></span>

            </li>
        </g:if>

        <g:if test="${orderInstance?.customer}">
            <li class="fieldcontain">
                <span id="customer-label" class="property-label"><g:message code="order.customer"
                                                                            default="Customer"/></span>

                <span class="property-value" aria-labelledby="customer-label">${orderInstance?.customer?.encodeAsHTML()}</span>

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

        <g:if test="${orderInstance?.billingAddress}">
            <li class="fieldcontain">
                <span id="billingAddress-label" class="property-label"><g:message code="order.billingAddress"
                                                                                  default="Billing Address"/></span>

                <span class="property-value" aria-labelledby="billingAddress-label">${orderInstance?.billingAddress?.encodeAsHTML()}</span>

            </li>
        </g:if>

        <g:if test="${orderInstance?.sendingAddress}">
            <li class="fieldcontain">
                <span id="sendingAddress-label" class="property-label"><g:message code="order.sendingAddress"
                                                                                  default="Sending Address"/></span>

                <span class="property-value" aria-labelledby="sendingAddress-label">${orderInstance?.sendingAddress?.encodeAsHTML()}</span>

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

        <g:set var="creationTrackingLogItem" value="${orderInstance?.trackingLogs.find{it?.action == OrderHelper.ACTION_CREATION}}"/>
        <g:if test="${creationTrackingLogItem}">
            <li class="fieldcontain">
                <span id="creationDate-label" class="property-label"><g:message code="order.created.date"/></span>

                <span class="property-value" aria-labelledby="creationDate-label"><rg:formatJalaliDate date="${creationTrackingLogItem?.date}" hm="true" /></span>

            </li>
        </g:if>

    </ol>
</div>
