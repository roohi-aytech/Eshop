<%@ page import="eshop.Testimonial" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'testimonial.label', default: 'Testimonial')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-testimonial" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-testimonial" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list testimonial">

        <g:if test="${testimonialInstance?.body}">
            <li class="fieldcontain">
                <span id="body-label" class="property-label"><g:message code="testimonial.body.label"
                                                                        default="Body"/></span>

                <span class="property-value" aria-labelledby="body-label"><g:fieldValue bean="${testimonialInstance}"
                                                                                        field="body"/></span>

            </li>
        </g:if>

        <g:if test="${testimonialInstance?.approved}">
            <li class="fieldcontain">
                <span id="approved-label" class="property-label"><g:message code="testimonial.approved.label"
                                                                            default="Approved"/></span>

                <span class="property-value" aria-labelledby="approved-label"><g:formatBoolean
                        boolean="${testimonialInstance?.approved}"/></span>

            </li>
        </g:if>

        <g:if test="${testimonialInstance?.creationDate}">
            <li class="fieldcontain">
                <span id="creationDate-label" class="property-label"><g:message code="testimonial.creationDate.label"
                                                                                default="Creation Date"/></span>

                <span class="property-value" aria-labelledby="creationDate-label"><g:formatDate
                        date="${testimonialInstance?.creationDate}"/></span>

            </li>
        </g:if>

        <g:if test="${testimonialInstance?.lastModifyDate}">
            <li class="fieldcontain">
                <span id="lastModifyDate-label" class="property-label"><g:message
                        code="testimonial.lastModifyDate.label" default="Last Modify Date"/></span>

                <span class="property-value" aria-labelledby="lastModifyDate-label"><g:formatDate
                        date="${testimonialInstance?.lastModifyDate}"/></span>

            </li>
        </g:if>

        <g:if test="${testimonialInstance?.lastReviewer}">
            <li class="fieldcontain">
                <span id="lastReviewer-label" class="property-label"><g:message code="testimonial.lastReviewer.label"
                                                                                default="Last Reviewer"/></span>

                <span class="property-value" aria-labelledby="lastReviewer-label"><g:link controller="user"
                                                                                          action="show"
                                                                                          id="${testimonialInstance?.lastReviewer?.id}">${testimonialInstance?.lastReviewer?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${testimonialInstance?.purchasedProduct}">
            <li class="fieldcontain">
                <span id="purchasedProduct-label" class="property-label"><g:message
                        code="testimonial.purchasedProduct.label" default="Purchased Product"/></span>

                <span class="property-value" aria-labelledby="purchasedProduct-label"><g:fieldValue
                        bean="${testimonialInstance}" field="purchasedProduct"/></span>

            </li>
        </g:if>

        <g:if test="${testimonialInstance?.writer}">
            <li class="fieldcontain">
                <span id="writer-label" class="property-label"><g:message code="testimonial.writer.label"
                                                                          default="Writer"/></span>

                <span class="property-value" aria-labelledby="writer-label"><g:link controller="customer" action="show"
                                                                                    id="${testimonialInstance?.writer?.id}">${testimonialInstance?.writer?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${testimonialInstance?.writerInfo}">
            <li class="fieldcontain">
                <span id="writerInfo-label" class="property-label"><g:message code="testimonial.writerInfo.label"
                                                                              default="Writer Info"/></span>

                <span class="property-value" aria-labelledby="writerInfo-label"><g:fieldValue
                        bean="${testimonialInstance}" field="writerInfo"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${testimonialInstance?.id}"/>
            <g:link class="edit" action="edit" id="${testimonialInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
