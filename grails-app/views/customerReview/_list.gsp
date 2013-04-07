<%@ page import="eshop.Product" %>
<h3><g:message code="product.review.list"></g:message></h3>
<g:if test="${((Product) product).customerReviews.isEmpty()}">
    <div class="form-comment">
        <g:message code="review.list.nothing"></g:message>
    </div>
</g:if>
<g:each in="${product.customerReviews}" var="customerReview">
    <g:render template="../customerReview/show" model="${['customerReviewInstance': customerReview]}"></g:render>
</g:each>
<div id="newCustomerReviews">
</div>
<hr/>