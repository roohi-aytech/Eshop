<ckeditor:resources/>
<g:javascript src="jquery.color.js"></g:javascript>
<g:javascript>
    var newReviewsCounter = 0;
    var parentReviewId;
    function submitReview(parentReviewIdParam) {

        parentReviewId = parentReviewIdParam;

        $("#buttons_" + parentReviewId).hide();
        $("#waiting_" + parentReviewId).fadeIn();

        var isValid = true;
        $('.validator').css('display', 'none');

        var reviewBody = $('#cke_reviewBody_' + parentReviewId + ' iframe').contents().find("body").text();
        if (reviewBody && reviewBody.trim() != '') {}
        else{
            $('#reviewBodyValidator_' + parentReviewId).css('display', 'inline-block');
            isValid = false;
        }
        if ($('#reviewTitle_' + parentReviewId).val().trim() == ''){
            $('#reviewTitleValidator_' + parentReviewId).css('display', 'inline-block');
            isValid = false;
        }
        if(parentReviewId == 0)
            if ($('#reviewRate_' + parentReviewId).val().trim() == ''){
                $('#reviewRateValidator_' + parentReviewId).css('display', 'inline-block');
                isValid = false;
            }

        $('#reviewBody_' + parentReviewId).text($('#cke_reviewBody_' + parentReviewId + ' iframe').contents().find("body").html());

        if(!isValid)
            return;
        var request;

        if (request) {
            request.abort();
        }
        var $form = $("#submitNewReviewForm_" + parentReviewId);
        var serializedData = $form.serialize();
        var request = $.ajax({
            url: "${createLink(controller: "CustomerReview", action: "save")}",
            type: "post",
            data: serializedData
        });

        request.done(function (response, textStatus, jqXHR){
            newReviewsCounter++;

            $('#noCustomerReviewPlaceHolder').hide();

            var result = response;
            result = "<div class='newCustomerReview'" +
                           "id='newCustomerReview" + newReviewsCounter + "'>" + response + "</div>";
            $('#newCustomerReviews_' + parentReviewId).html($('#newCustomerReviews_' + parentReviewId).html() + result)

            if($('#reviewThisReviewButton_' + parentReviewId) && parentReviewId != 0)
            {
                $('#reviewThisReviewButton_' + parentReviewId).fadeIn();
                $('#reviewThisReviewForm_' + parentReviewId).hide();
            }

            var item = $("#newCustomerReview" + newReviewsCounter);
            $('html,body').animate({
                scrollTop: $("#newCustomerReview" + newReviewsCounter).offset().top - 50},
                'slow');
            item.css('background-color', '#fff2d9');
            item.animate({backgroundColor: jQuery.Color("#fff2d9").transition("transparent", 1)}, 4000);

            $("#waiting_" + parentReviewId).hide();
            $("#buttons_" + parentReviewId).fadeIn();
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

    function showReviewForm(parentReviewIdParam) {

        parentReviewId = parentReviewIdParam;
        if($('#reviewThisReviewForm_' + parentReviewId).length > 0){
            $('#reviewThisReviewButton_' + parentReviewId).hide();
            $('#reviewThisReviewForm_' + parentReviewId).fadeIn();
        }
        else{
            var request;

            if (request) {
                request.abort();
            }
            var request = $.ajax({
                url: "${createLink(controller: "CustomerReview", action: "create")}",
                type: "post",
                data: {parentReviewId:parentReviewId, productId: $('#productId_0').val()}
            });

            request.done(function (response, textStatus, jqXHR){
                $('.reviewThisReviewForm').parent().html('');
                $('.reviewThisReviewButton').show();
                $('#reviewThisReviewButton_' + parentReviewId).hide();
                var result = response;
                $('#reviewThisReview_' + parentReviewId).html(result)

                var item = $("#reviewThisReview_" + parentReviewId);
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
    }

    function cancelReview(parentReviewIdParam) {

        parentReviewId = parentReviewIdParam;
        $('#reviewThisReviewForm_' + parentReviewId).hide();
        $('#reviewThisReviewButton_' + parentReviewId).fadeIn();
    }

    function vote(parentReviewIdParam, voteValue){

        parentReviewId = parentReviewIdParam;
        $('#voteWaiting_' + parentReviewId).fadeIn();

        var request;

        if (request) {
            request.abort();
        }
        var request = $.ajax({
            url: "${createLink(controller: "CustomerReview", action: "vote")}",
            type: "post",
            data: {parentReviewId:parentReviewId, voteValue: voteValue}
        });

        request.done(function (response, textStatus, jqXHR){

            var result = response;
            if(isNaN(result)){
                $.msgGrowl ({
                type: 'warning'
                , 'text': result
                , lifetime: 5000
            });
            }
            else{
                var item = $("#voteValue_" + parentReviewId);
                item.html(result);
                item.css('background-color', '#fff2d9');
                item.animate({backgroundColor: jQuery.Color("#fff2d9").transition("transparent", 1)}, 4000);
            }
            $('#voteWaiting_' + parentReviewId).hide();
        });

        request.fail(function (jqXHR, textStatus, errorThrown){
            $('#voteWaiting_' + parentReviewId).hide();
        });

        request.always(function () {
        });
    }
</g:javascript>