<div class="customer-review table">
    <div class="table-row" style="${customerReviewInstance.id == selectedId?'background-color:#e3e3e3;border:1px solid white;':''}">
        <div class="table-cell vote">
            <span>
                <span id="voteValue_${customerReviewInstance.id}">${customerReviewInstance.totalVotes}</span>
            </span>
        </div>

        <div class="table-cell body">

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
                <eshop:rate identifier="hidCustomerReviewRate${customerReviewInstance.id}"
                            currentValue="${customerReviewInstance.rate}" readOnly="true"/>
            </g:if>

            <g:if test="${customerReviewInstance?.body}">
                <div>
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
                <g:each in="${customerReviewInstance.customerReviewReviews.sort {-it.totalVotes}}">
                    <g:render template="/customerReview/showToAdmin" model="${[customerReviewInstance:it, selectedId:selectedId]}"/>
                </g:each>
            </div>

            <div id="newCustomerReviews_${customerReviewInstance?.id}">
            </div>
        </div>
    </div>

</div>
