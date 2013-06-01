<%@ page import="eshop.CustomerReview" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'customerReview.label', default: 'CustomerReview')}"/>
    <title><g:message code="customerReview.investigate.label"></g:message></title>
</head>

<body>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<h2><g:message code="customerReview.investigate.label"></g:message></h2>

<div id="show-customerReview" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list customerReview">

        <g:if test="${customerReviewInstance?.product}">
            <li class="fieldcontain">
                <span id="account-label" class="property-label"><g:message code="customerReview.product"
                                                                           default="product"/></span>

                <span class="property-value" aria-labelledby="account-label"><g:link controller="product"
                                                                                     action="productDetails"
                                                                                     id="${customerReviewInstance?.product?.id}">${customerReviewInstance?.product}</g:link></span>

            </li>
        </g:if>

        <g:if test="${customerReviewInstance?.title}">
            <li class="fieldcontain">
                <span id="value-label" class="property-label"><g:message code="customerReview.title.label"
                                                                         default="title"/></span>

                <span class="property-value" aria-labelledby="value-label"><g:fieldValue
                        bean="${customerReviewInstance}" field="title"/></span>

            </li>
        </g:if>

        <g:if test="${customerReviewInstance?.body}">
            <li class="fieldcontain">
                <span id="value-label" class="property-label"><g:message code="customerReview.body.label"
                                                                         default="body"/></span>

                <span class="property-value" aria-labelledby="value-label">${customerReviewInstance?.body}</span>

            </li>
        </g:if>

        <g:if test="${customerReviewInstance?.rate}">
            <li class="fieldcontain">
                <span id="trackingCode-label" class="property-label"><g:message code="customerReview.rate.label"
                                                                                default="rate"/></span>

                <span class="property-value" aria-labelledby="trackingCode-label"><g:fieldValue
                        bean="${customerReviewInstance}" field="rate"/></span>

            </li>
        </g:if>

        <g:if test="${customerReviewInstance?.user}">
            <li class="fieldcontain">
                <span id="owner-label" class="property-label"><g:message code="customerReview.user.label"
                                                                         default="Owner"/></span>

                <span class="property-value" aria-labelledby="owner-label"><g:link controller="customer" action="show"
                                                                                   id="${customerReviewInstance?.user?.id}">${customerReviewInstance?.user?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${customerReviewInstance?.creationDate}">
            <li class="fieldcontain">
                <span id="creationDate-label" class="property-label"><g:message code="customerReview.creationDate.label"
                                                                                default="Creation Date"/></span>

                <span class="property-value" aria-labelledby="creationDate-label"><rg:formatJalaliDate hm="true"
                                                                                                       date="${customerReviewInstance?.creationDate}"/></span>

            </li>
        </g:if>

        <li class="fieldcontain">
            <span id="approved-label" class="property-label"><g:message code="customerReview.status"/></span>

            <span class="property-value" aria-labelledby="approved-label">
                <g:if test="${customerReviewInstance?.status == 'approved'}">
                    <g:message code="customerReview.status.approved"></g:message>
                </g:if>
                <g:else>
                    <g:if test="${customerReviewInstance?.status == 'rejected'}">
                        <g:message code="customerReview.status.rejected"></g:message>
                    </g:if>
                    <g:else>
                        <g:message code="customerReview.status.waiting"></g:message>
                    </g:else>
                </g:else>
            </span>

        </li>

    </ol>
    <g:render template="form"></g:render>
    <br/>
    <h2><g:message code="customerReview.list"></g:message></h2>
    <g:each in="${customerReviewInstance.product.customerReviews.findAll {it.parentReview == null}.sort {-it.totalVotes}}" var="customerReview">
        <g:render template="/customerReview/showToAdmin" model="${['customerReviewInstance': customerReview, selectedId:customerReviewInstance.id]}"></g:render>
    </g:each>
    <br/>
    <g:render template="form"></g:render>
</div>
</body>
</html>
