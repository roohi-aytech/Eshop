<%@ page import="eshop.Product" %>

<h3><g:message code="product.review.list"></g:message></h3>

<div id="noCustomerReviewPlaceHolder">
    <g:if test="${((Product) product)?.customerReviews?.findAll {it.parentReview == null && it.status == 'approved'}.isEmpty()}">
        <div class="form-comment">
            <g:message code="review.list.nothing"></g:message>
        </div>
    </g:if>
</div>
<g:each in="${product.customerReviews.findAll {it.parentReview == null && it.status == 'approved'}.sort {('-'+(it.totalVotes+''+it.lastUpdate.time))as Long }}" var="customerReview">
    <g:if test="${grailsApplication.config.customCustomerReviewTemplate}">

        <g:render template="/site/${grailsApplication.config.eShop.instance}/templates/product/review" model="${['customerReviewInstance': customerReview]}"></g:render>
    </g:if>
    <g:else>
        <g:render template="/customerReview/show" model="${['customerReviewInstance': customerReview]}"></g:render>
    </g:else>
</g:each>
<div id="newCustomerReviews_0">
</div>
<hr/>