<%@ page import="org.ocpsoft.prettytime.PrettyTime" %>
<table class="customer-review table-simulated">
    <tr class="table-row">

        <td class="table-cell">
            <g:if test="${customerReviewInstance?.user}">
                <span class="comment-user">
                    ${customerReviewInstance?.user?.encodeAsHTML()}
                </span>
            </g:if>
            <g:if test="${customerReviewInstance?.lastUpdate}">
                (<span class="date">${new PrettyTime(new Locale('fa')).format(customerReviewInstance?.lastUpdate)}</span>)
            </g:if>
            <g:if test="${customerReviewInstance?.body}">
                :<span class="comment-body">
                    ${customerReviewInstance.body}
                </span>
            </g:if>

            <g:if test="${customerReviewInstance?.rate}">
                <span class="aggregateRating" itemprop="aggregateRating" itemscope itemtype="http://data-vocabulary.org/Rating">

                    <span class="hidden meta" itemprop="value">${customerReviewInstance?.rate}</span>
                    <meta itemprop="best" content="5"/>
                    <eshop:rate identifier="hidCustomerReviewRate${customerReviewInstance.id}"
                                currentValue="${customerReviewInstance.rate}" readOnly="true"/>
                </span>
            </g:if>



            <g:if test="${customerReviewInstance.status == 'waiting'}">
                <div class="info">
                    <div><g:message code="review.approveRequired"/></div>
                </div>
            </g:if>
        </td>
    </tr>

</table>
