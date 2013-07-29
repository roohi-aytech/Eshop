/**
 * Created with IntelliJ IDEA.
 * User: farzin
 * Date: 7/29/13
 * Time: 7:24 PM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function () {
    $('body').append($('<div class="search-auto-complete-drop-down"><div class="search-auto-complete-drop-down-inner"></div></div>'));

    $('.search-auto-complete-drop-down').width($('#searchPhrase').width() - 10);
    $('.search-auto-complete-drop-down').css('top', $('#searchPhrase').offset().top + $('#searchPhrase').height() + 8);
    $('.search-auto-complete-drop-down').css('left', $('#searchPhrase').offset().left);

    $(window).resize(function () {
        $('.search-auto-complete-drop-down').width($('#searchPhrase').width() - 10);
        $('.search-auto-complete-drop-down').css('top', $('#searchPhrase').offset().top + $('#searchPhrase').height() + 8);
        $('.search-auto-complete-drop-down').css('left', $('#searchPhrase').offset().left);
    });

    $(document).scroll(function (e) {
        $('.search-auto-complete-drop-down').width($('#searchPhrase').width() - 10);
        $('.search-auto-complete-drop-down').css('top', $('#searchPhrase').offset().top + $('#searchPhrase').height() + 8);
        $('.search-auto-complete-drop-down').css('left', $('#searchPhrase').offset().left);
    });

    $('#main-container').click(function(){
        $('.search-auto-complete-drop-down').hide();
    });

    $('.header').click(function(){
        $('.search-auto-complete-drop-down').hide();
    });

    $('#searchPhrase').keyup(function () {
        var phrase = $('#searchPhrase').val();
        if (phrase && phrase.length > 2) {
            autoComplete(phrase);
        }
        else {
            $('.search-auto-complete-drop-down').hide();
        }
    });
});

$()

var searchAutoCompleteRequest;

function autoComplete(phrase) {

    var $form = $("#searchForm");
    var serializedData = $form.serialize();
    if (searchAutoCompleteRequest)
        searchAutoCompleteRequest.abort();
    $('.search-auto-complete-drop-down').hide();

    searchAutoCompleteRequest = $.ajax({
        url: searchAutoCompleteUrl,
        type: "get",
        data: serializedData
    });

    $('#searchPhrase').addClass('waitForAutoComplete');

    searchAutoCompleteRequest.done(function (response, textStatus, jqXHR) {

        if (response) {
            showAutoCompleteResult(response);
        }
        else {
        }

        $('#searchPhrase').removeClass('waitForAutoComplete');
    });

    searchAutoCompleteRequest.fail(function (jqXHR, textStatus, errorThrown) {
        $('#searchPhrase').removeClass('waitForAutoComplete');
        $('.search-auto-complete-drop-down').hide();
    });

    searchAutoCompleteRequest.always(function () {
    });
}

function showAutoCompleteResult(response) {
    if (response != '') {
        $('.search-auto-complete-drop-down-inner').html(response);
        $('.search-auto-complete-drop-down-inner').rollbar({zIndex: 80, wheelSpeed: 10});
        $('.search-auto-complete-drop-down').fadeIn();
    }
    else{
        $('.search-auto-complete-drop-down').hide();
    }
}