<%@ page import="eshop.Product" %>

<h3><g:message code="product.review.list"></g:message></h3>

<div id="noCustomerReviewPlaceHolder">
    <g:if test="${((Product) product)?.customerReviews?.findAll {it.parentReview == null && it.status == 'approved'}.isEmpty()}">
        <div class="form-comment">
            <g:message code="review.list.nothing"></g:message>
        </div>
    </g:if>
</div>
<g:each in="${product.customerReviews.findAll {it.parentReview == null && it.status == 'approved'}.sort {-it.totalVotes}}" var="customerReview">
    <g:render template="/customerReview/show" model="${['customerReviewInstance': customerReview]}"></g:render>
</g:each>
<div id="newCustomerReviews_0">
</div>
<hr/>