<div class="reviewForm"
     id="reviewThisReviewForm_${params?.parentReviewId ?: 0}" ${params?.parentReviewId ? 'class=\"reviewThisReviewForm\"' : ''}>
    <g:if test="${params?.parentReviewId}">
        <h4><g:message code="product.review.response"></g:message></h4>
    </g:if>
    <g:else>
        <h3><g:message code="product.review.add"></g:message></h3>

        <div class="form-comment">
            <g:message code="review.form.description"></g:message>
        </div>
    </g:else>
    <sec:ifNotLoggedIn>
        <div class="info">
            <div><g:message code="review.loginRequired"></g:message></div>
            <common:loginLink class="btn btn-success"></common:loginLink>
            <common:registerLink class="btn btn-primary"></common:registerLink>
        </div>
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>
        <form id="submitNewReviewForm_${params?.parentReviewId ?: 0}" name="submitNewReviewForm" method="post"
              action="${createLink(controller: 'customerReview', action: 'save')}">
            <input type="hidden" name="productId" id="productId_${params?.parentReviewId ?: 0}"
                   value="${product?.id ?: params.productId}"/>
            <input type="hidden" name="parentReviewId" value="${params?.parentReviewId ?: 0}"/>

            <div>
                <div class="field-name">
                    <g:message code="review.title"></g:message>
                    <span class="validator" id="reviewTitleValidator_${params?.parentReviewId ?: 0}"><g:message
                            code="review.title.validation.label"></g:message></span>
                </div>

                <div class="field-value">
                    <input type="text" class="reviewTitle" id="reviewTitle_${params?.parentReviewId ?: 0}"
                           name="reviewTitle"/>
                </div>

                <g:if test="${params?.parentReviewId}"></g:if>
                <g:else>
                    <div>
                        <g:message code="review.rate"></g:message>
                    </div>

                    <div>
                        <eshop:rate name="reviewRate" identifier="reviewRate_${params?.parentReviewId ?: 0}"
                                    readOnly="false"/>
                        <span class="validator" id="reviewRateValidator_${params?.parentReviewId ?: 0}"><g:message
                                code="review.rate.validation.label"></g:message></span>
                    </div>
                    <br/>
                </g:else>

                <div>
                    <g:message code="review.body"></g:message>
                </div>

                <div>
                    <ckeditor:editor name="reviewBody_${params?.parentReviewId ?: 0}" width="440px" height="120px">
                        <ckeditor:config var="toolbar_Full">
                            [
                                { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike' ] },
                                { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent',
                                    '-','JustifyRight','JustifyCenter','JustifyLeft','JustifyBlock','-','BidiRtl','BidiLtr' ] },
                                { name: 'links', items : [ 'Link','Unlink' ] }
                            ]
                        </ckeditor:config>
                    </ckeditor:editor>

                </div>

                <div class="btn-toolbar">
                    <div id="buttons_${params?.parentReviewId ?: 0}">
                        <a class="btn btn-info" onclick="submitReview(${params?.parentReviewId?:0})"><g:message
                                code="${params?.parentReviewId ? 'review.response.submit' : 'review.submit'}"></g:message></a>
                        <g:if test="${params?.parentReviewId}">
                            &nbsp;
                            <a class="btn" onclick="cancelReview(${params?.parentReviewId?:0})"><g:message
                                    code="cancel"></g:message></a>
                        </g:if>
                    </div>

                    <div class="waiting" id="waiting_${params?.parentReviewId ?: 0}">
                        <img src="${resource(dir: 'images', file: 'loading.gif')}"/>
                        <g:message code="waiting"/>
                    </div>
                    <span class="validator" id="reviewBodyValidator_${params?.parentReviewId ?: 0}"><g:message
                            code="review.body.validation.label"></g:message></span>
                </div>
            </div>
        </form>
    </sec:ifLoggedIn>
</div>