<table class="customer-review table-simulated">
    <tr class="table-row">
        <td class="table-cell vote">
            <g:render template="/customerReview/vote" model="${[customerReviewInstance: customerReviewInstance]}"/>
        </td>

        <td class="table-cell">

            <g:if test="${customerReviewInstance?.title}">
                <h4><g:fieldValue bean="${customerReviewInstance}" field="title"/></h4>
            </g:if>

            <g:if test="${customerReviewInstance?.lastUpdate}">
                <span class="date"><rg:formatJalaliDate date="${customerReviewInstance?.lastUpdate}"
                                                        hm="true"></rg:formatJalaliDate></span>
            </g:if>

            <g:if test="${customerReviewInstance?.user}">
                <div class="comment">
                    <g:message code="customerReview.writtenBy" default="By"/>
                    <g:link controller="user" action="show"
                            id="${customerReviewInstance?.user?.id}">${customerReviewInstance?.user?.encodeAsHTML()}</g:link>

                </div>
            </g:if>

            <g:if test="${customerReviewInstance?.rate}">
                <div itemprop="aggregateRating" itemscope itemtype="http://data-vocabulary.org/Rating">
                    <g:message code="rate"/>:
                    <span class="meta" itemprop="value">${customerReviewInstance?.rate}</span>
                    <meta itemprop="best" content="5"/>
                    <eshop:rate identifier="hidCustomerReviewRate${customerReviewInstance.id}"
                                currentValue="${customerReviewInstance.rate}" readOnly="true"/>
                </div>
            </g:if>

            <g:if test="${customerReviewInstance?.body}">
                <div class="comment-body">
                    ${customerReviewInstance.body}
                </div>
            </g:if>

            <g:if test="${customerReviewInstance.status == 'waiting'}">
                <div class="info">
                    <div><g:message code="review.approveRequired"/></div>
                </div>
            </g:if>

            <sec:ifLoggedIn>
                <a id="reviewThisReviewButton_${customerReviewInstance?.id}" class="link-button reviewThisReviewButton"
                   onclick="showReviewForm(${customerReviewInstance?.id})"><img
                        src="${resource(dir: 'images/icons', file: 'comment.png')}"/><g:message
                        code="reviewOnReview.label"/></a>
            </sec:ifLoggedIn>

            <div id="reviewThisReview_${customerReviewInstance?.id}">

            </div>

            <div class="childCustomerReviews">
                <g:each in="${customerReviewInstance.customerReviewReviews.findAll { it.status == 'approved' }.sort { -it.totalVotes }}">
                    <g:render template="/customerReview/show" model="${[customerReviewInstance: it]}"/>
                </g:each>
            </div>

            <div id="newCustomerReviews_${customerReviewInstance?.id}">
            </div>
        </td>
    </tr>

</table>
