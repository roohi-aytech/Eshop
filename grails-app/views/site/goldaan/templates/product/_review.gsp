<%@ page import="org.ocpsoft.prettytime.PrettyTime" %>
<table class="customer-review table-simulated" itemprop="review" itemscope itemtype="http://schema.org/Review">
    <tr class="table-row">

        <td class="table-cell">

            <g:if test="${customerReviewInstance?.user}">
                <span itemprop="author" itemscope itemtype="http://schema.org/Person">
                    <span itemprop="name"  class="comment-user">
                        ${customerReviewInstance?.user?.encodeAsHTML()}
                    </span>
                </span>
            </g:if>
            <g:if test="${customerReviewInstance?.lastUpdate}">
                (<span class="date">${new PrettyTime(new Locale('fa')).format(customerReviewInstance?.lastUpdate)}</span>)
                <meta itemprop="datePublished" content="${customerReviewInstance?.lastUpdate}">
            </g:if>
            <g:if test="${customerReviewInstance?.body}">
                :<span itemprop="reviewBody" class="comment-body">
                    ${customerReviewInstance.body}
                </span>
            </g:if>

            <g:if test="${customerReviewInstance?.rate}">
                <span class="aggregateRating" itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">

                    %{--<span class="hidden meta" itemprop="value">${customerReviewInstance?.rate}</span>--}%
                    <meta itemprop="bestRating" content="5">
                    <meta itemprop="worstRating" content="0">
                    <meta itemprop="ratingValue" content="${customerReviewInstance?.rate}">

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
