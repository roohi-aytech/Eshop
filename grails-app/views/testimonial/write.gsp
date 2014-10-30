<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 4/18/14
  Time: 4:03 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='site'/>
    <title><g:message code="testimonial.write"/></title>
</head>

<body>
<div class="control-panel">
    <h2><g:message code="testimonial.write"/></h2>

    <p>
        <g:message code="testimonial.write.description"/>
    </p>
    <br/>
    <sec:ifNotLoggedIn>
        <div class="info">
            <div><g:message code="testimonial.loginRequired"/></div>
            <common:loginLink class="btn btn-success"/>
            <common:registerLink class="btn btn-primary"/>
        </div>
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>
        <g:form onsubmit="return validateTestimonial();" controller="testimonial" action="saveNew">
            <input type="hidden" name="productId" id="productId_${params?.parentReviewId ?: 0}"
                   value="${product?.id ?: params.productId}"/>
            <input type="hidden" name="parentReviewId" value="${params?.parentReviewId ?: 0}"/>

            <div>
                <div class="field-name">
                    <g:message code="testimonial.write.writerInfo"/>
                </div>

                <div class="field-value">
                    <input class="testimonialWriterInfo" type="text"
                           id="testimonialWriterInfo"
                           name="writerInfo"/>
                </div>

                <div class="field-name">
                    <g:message code="testimonial.write.purchasedProduct"/>
                </div>

                <div class="field-value">
                    <input class="testimonialPurchasedProduct" type="text"
                           id="testimonialPurchasedProduct"
                           name="purchasedProduct"/>
                </div>

                <div class="field-name">
                    <g:message code="testimonial.write.body"/>
                    <span class="validator" id="testimonialBodyValidator"><g:message
                            code="testimonial.body.validation.label"/></span>
                </div>

                <div class="field-value">
                    <textarea class="testimonialBody" id="testimonialBody"
                              name="body"></textarea>
                </div>


                <div class="btn-toolbar">
                    <input type="submit" class="btn btn-danger" value="${message(code: 'testimonial.write.button')}"/>
                </div>
            </div>
        </g:form>
        <script language="javascript" type="text/javascript">
            function validateTestimonial() {
                $('.validator').hide();
                if(!$('#testimonialBody').val() || !$('#testimonialBody').val().trim())
                {
                    $('#testimonialBodyValidator').show();
                    return false;
                }
                return true;
            }
        </script>
    </sec:ifLoggedIn>
</div>
</body>
</html>