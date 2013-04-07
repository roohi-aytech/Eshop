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

        // variable to hold request
        var request;
        // bind to the submit event of our form
//        $("#submitNewReviewForm").submit(function(event){
//            // abort any pending request

            if (request) {
                request.abort();
            }
            // setup some local variables
            var $form = $("#submitNewReviewForm");
            // serialize the data in the form
            var serializedData = $form.serialize();
            // fire off the request to /form.php
            var request = $.ajax({
                url: "${createLink(controller: "CustomerReview", action: "save")}",
                type: "post",
                data: serializedData
            });

            // callback handler that will be called on success
            request.done(function (response, textStatus, jqXHR){
                // log a message to the console
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

            // callback handler that will be called on failure
            request.fail(function (jqXHR, textStatus, errorThrown){
                // log the error to the console
                console.error(
                        "The following error occured: "+
                                textStatus, errorThrown
                );
            });

            // callback handler that will be called regardless
            // if the request failed or succeeded
            request.always(function () {
            });
//        });
    }
</g:javascript>
<h3><g:message code="product.review.add"></g:message></h3>
<div class="form-comment">
    <g:message code="review.form.description"></g:message>
</div>
<sec:ifNotLoggedIn>
    <div class="info">
        <div><g:message code="review.loginRequired"></g:message></div>
        <common:loginLink class="btn btn-primary"></common:loginLink>
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
            <span class="validator" id="reviewTitleValidator"><g:message code="review.title.validation.label"></g:message></span>
        </div>

        <div>
            <g:message code="review.rate"></g:message>
        </div>

        <div>
            <eshop:rate identifier="reviewRate" readOnly="false"/>
            <span class="validator" id="reviewRateValidator"><g:message code="review.rate.validation.label"></g:message></span>
        </div>
        <br/>

        <div>
            <g:message code="review.body"></g:message>
        </div>

        <div>
            <ckeditor:editor name="reviewBody" width="650px" height="200px">
            </ckeditor:editor>
        </div>

        <div class="btn-toolbar">
            <a class="btn btn-info" onclick="submitReview()"><g:message code="review.submit"></g:message></a>
            <span class="validator" id="reviewBodyValidator"><g:message code="review.body.validation.label"></g:message></span>
        </div>
    </div>
</g:form>
</sec:ifLoggedIn>
<hr/>