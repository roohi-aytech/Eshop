<ckeditor:resources/>
<g:javascript src="jquery.color.js"></g:javascript>
<g:javascript>
    var newReviewsCounter = 0;
    function submitReview() {

        var isValid = true;
        $('.validator').css('display', 'none');

        var reviewBody = $('#cke_reviewBody iframe').contents().find("body").text();
        if (reviewBody && reviewBody.trim() != '') {}
        else{
            $('#reviewBodyValidator').css('display', 'inline-block');
            isValid = false;
        }
        if ($('#reviewTitle').val().trim() == ''){
            $('#reviewTitleValidator').css('display', 'inline-block');
            isValid = false;
        }
        if ($('#reviewRate').val().trim() == ''){
            $('#reviewRateValidator').css('display', 'inline-block');
            isValid = false;
        }

        $('#reviewBody').text($('#cke_reviewBody iframe').contents().find("body").html());

        if(!isValid)
            return;

        var request;

            if (request) {
                request.abort();
            }
            var $form = $("#submitNewReviewForm");
            var serializedData = $form.serialize();
            var request = $.ajax({
                url: "${createLink(controller: "CustomerReview", action: "save")}",
                type: "post",
                data: serializedData
            });

            request.done(function (response, textStatus, jqXHR){
                newReviewsCounter++;
                var result = response;
                result = "<div class='newCustomerReview' id='newCustomerReview" + newReviewsCounter + "'>" + response + "</div>";
                $('#newCustomerReviews').html($('#newCustomerReviews').html() + result)

                var item = $("#newCustomerReview" + newReviewsCounter);
                $('html,body').animate({
                    scrollTop: $("#newCustomerReview" + newReviewsCounter).offset().top - 50},
                    'slow');
                item.css('background-color', '#fff2d9');
                item.animate({backgroundColor: jQuery.Color("#fff2d9").transition("transparent", 1)}, 4000);
            });

            request.fail(function (jqXHR, textStatus, errorThrown){
                console.error(
                        "The following error occured: "+
                                textStatus, errorThrown
                );
            });

            request.always(function () {
            });
    }
</g:javascript>
<h3><g:message code="product.review.add"></g:message></h3>

<div class="form-comment">
    <g:message code="review.form.description"></g:message>
</div>
<sec:ifNotLoggedIn>
    <div class="info">
        <div><g:message code="review.loginRequired"></g:message></div>
        <common:loginLink class="btn btn-success"></common:loginLink>
        <common:registerLink class="btn btn-primary"></common:registerLink>
    </div>
</sec:ifNotLoggedIn>
<sec:ifLoggedIn>
    <g:form controller="customerReview" action="save" name="submitNewReviewForm" id="submitNewReviewForm">
        <input type="hidden" name="productId" id="productId" value="${product.id}"/>

        <div>
            <div class="field-name">
                <g:message code="review.title"></g:message>
            </div>

            <div class="field-value">
                <input type="text" id="reviewTitle" name="reviewTitle"/>
                <span class="validator" id="reviewTitleValidator"><g:message
                        code="review.title.validation.label"></g:message></span>
            </div>

            <div>
                <g:message code="review.rate"></g:message>
            </div>

            <div>
                <eshop:rate identifier="reviewRate" readOnly="false"/>
                <span class="validator" id="reviewRateValidator"><g:message
                        code="review.rate.validation.label"></g:message></span>
            </div>
            <br/>

            <div>
                <g:message code="review.body"></g:message>
            </div>

            <div>
                <ckeditor:editor name="reviewBody" width="650px" height="200px">
                    <ckeditor:config var="toolbar_Full">
                        [
                            { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript' ] },
                            { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent',
                                '-','JustifyRight','JustifyCenter','JustifyLeft','JustifyBlock','-','BidiRtl','BidiLtr' ] },
                            { name: 'links', items : [ 'Link','Unlink' ] },
                            { name: 'colors', items : [ 'TextColor','BGColor' ] }
                        ]
                    </ckeditor:config>
                </ckeditor:editor>

            </div>

            <div class="btn-toolbar">
                <a class="btn btn-info" onclick="submitReview()"><g:message code="review.submit"></g:message></a>
                <span class="validator" id="reviewBodyValidator"><g:message
                        code="review.body.validation.label"></g:message></span>
            </div>
        </div>
    </g:form>
</sec:ifLoggedIn>
<hr/>