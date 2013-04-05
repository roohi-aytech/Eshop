<%@ page import="eshop.CustomerReview" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'customerReview.label', default: 'CustomerReview')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-customerReview" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                     default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-customerReview" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list customerReview">

        <g:if test="${customerReviewInstance?.product}">
            <li class="fieldcontain">
                <span id="product-label" class="property-label"><g:message code="customerReview.product.label"
                                                                           default="Product"/></span>

                <span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show"
                                                                                     id="${customerReviewInstance?.product?.id}">${customerReviewInstance?.product?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${customerReviewInstance?.rate}">
            <li class="fieldcontain">
                <span id="rate-label" class="property-label"><g:message code="customerReview.rate.label"
                                                                        default="Rate"/></span>

                <span class="property-value" aria-labelledby="rate-label"><g:fieldValue bean="${customerReviewInstance}"
                                                                                        field="rate"/></span>

            </li>
        </g:if>

        <g:if test="${customerReviewInstance?.title}">
            <li class="fieldcontain">
                <span id="title-label" class="property-label"><g:message code="customerReview.title.label"
                                                                         default="Title"/></span>

                <span class="property-value" aria-labelledby="title-label"><g:fieldValue
                        bean="${customerReviewInstance}" field="title"/></span>

            </li>
        </g:if>

        <g:if test="${customerReviewInstance?.body}">
            <li class="fieldcontain">
                <span id="body-label" class="property-label"><g:message code="customerReview.body.label"
                                                                        default="Body"/></span>

                <span class="property-value" aria-labelledby="body-label"><g:fieldValue bean="${customerReviewInstance}"
                                                                                        field="body"/></span>

            </li>
        </g:if>

        <g:if test="${customerReviewInstance?.creationDate}">
            <li class="fieldcontain">
                <span id="creationDate-label" class="property-label"><g:message code="customerReview.creationDate.label"
                                                                                default="Creation Date"/></span>

                <span class="property-value" aria-labelledby="creationDate-label"><g:formatDate
                        date="${customerReviewInstance?.creationDate}"/></span>

            </li>
        </g:if>

        <g:if test="${customerReviewInstance?.lastUpdate}">
            <li class="fieldcontain">
                <span id="lastUpdate-label" class="property-label"><g:message code="customerReview.lastUpdate.label"
                                                                              default="Last Update"/></span>

                <span class="property-value" aria-labelledby="lastUpdate-label"><g:formatDate
                        date="${customerReviewInstance?.lastUpdate}"/></span>

            </li>
        </g:if>

        <g:if test="${customerReviewInstance?.user}">
            <li class="fieldcontain">
                <span id="user-label" class="property-label"><g:message code="customerReview.user.label"
                                                                        default="User"/></span>

                <span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show"
                                                                                  id="${customerReviewInstance?.user?.id}">${customerReviewInstance?.user?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${customerReviewInstance?.customerReviewRates}">
            <li class="fieldcontain">
                <span id="customerReviewRates-label" class="property-label"><g:message
                        code="customerReview.customerReviewRates.label" default="Customer Review Rates"/></span>

                <g:each in="${customerReviewInstance.customerReviewRates}" var="c">
                    <span class="property-value" aria-labelledby="customerReviewRates-label"><g:link
                            controller="customerReviewRate" action="show"
                            id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${customerReviewInstance?.id}"/>
            <g:link class="edit" action="edit" id="${customerReviewInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
