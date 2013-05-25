

<div class="customer-review">

    <g:if test="${customerReviewInstance?.title}">
        <h4><g:fieldValue bean="${customerReviewInstance}" field="title"/></h4>
    </g:if>

    <g:if test="${customerReviewInstance?.lastUpdate}">
        <span class="date"><rg:formatJalaliDate date="${customerReviewInstance?.lastUpdate}" hm="true"></rg:formatJalaliDate></span>
    </g:if>

    <g:if test="${customerReviewInstance?.user}">
        <div class="comment">
            <g:message code="customerReview.writtenBy" default="By"/>
            <g:link controller="user" action="show" id="${customerReviewInstance?.user?.id}">${customerReviewInstance?.user?.encodeAsHTML()}</g:link>

        </div>
    </g:if>

    <g:if test="${customerReviewInstance?.rate}">
        <eshop:rate identifier="hidCustomerReviewRate${customerReviewInstance.id}" currentValue="${customerReviewInstance.rate}" readOnly="true"/>
    </g:if>

    <g:if test="${customerReviewInstance?.body}">
        <div>
            ${customerReviewInstance.body}
        </div>
    </g:if>

    <sec:ifLoggedIn>
        <a class="link-button"><img src="${resource(dir:'images/icons', file: 'comment.png')}"/><g:message code="reviewOnReview.label"/></a>
    </sec:ifLoggedIn>

    <div class="childCustomerReviews">

    </div>

    <div class="reviewThisReview">

    </div>

</div>
