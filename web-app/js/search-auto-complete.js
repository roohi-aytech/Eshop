/**
 * Created with IntelliJ IDEA.
 * User: farzin
 * Date: 7/29/13
 * Time: 7:24 PM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function () {
    $("#searchForm").attr('searchAutoCompleteUrl', searchAutoCompleteUrl);
    if($("#searchForm").length)
        setupSearchAutoComplete($("#searchForm"));
});

function setupSearchAutoComplete(form){
    var formId = form.attr('id');
    var searchInput = $('#' + formId + ' input[type="text"]');
    var dropDownId = 'search-auto-complete-drop-down-' + formId;
    $('body').append($('<div id="' + dropDownId + '" class="search-auto-complete-drop-down"><div class="search-auto-complete-drop-down-inner"></div></div>'));
    var dropDown = $('#' + dropDownId);

    dropDown.width(searchInput.width() - 10);
    dropDown.css('top', searchInput.offset().top + searchInput.height() + 8);
    dropDown.css('left', searchInput.offset().left);

    $(window).resize(function () {
        dropDown.width(searchInput.width() - 10);
        dropDown.css('top', searchInput.offset().top + searchInput.height() + 8);
        dropDown.css('left', $('#searchPhrase').offset().left);
    });

    $(document).scroll(function (e) {
        dropDown.width(searchInput.width() - 10);
        dropDown.css('top', searchInput.offset().top + searchInput.height() + 8);
        dropDown.css('left', searchInput.offset().left);
    });

    $('#main-container').click(function(){
        dropDown.hide();
    });

    $('.header').click(function(){
        dropDown.hide();
    });

    searchInput.keyup(function () {
        var phrase = $(this).val();
        if (phrase && phrase.length > 0) {

            dropDown.width(searchInput.width() - 10);
            dropDown.css('top', searchInput.offset().top + searchInput.height() + 8);
            dropDown.css('left', searchInput.offset().left);

            autoComplete(form);
        }
        else {
            dropDown.hide();
        }
    });
}

var searchAutoCompleteRequests = new Object();
var lastAutoCompleteDropDown;

function autoComplete(form) {

    var formId = form.attr('id');
    var searchInput = $('#' + formId + ' input[type="text"]');
    var dropDownId = 'search-auto-complete-drop-down-' + formId;
    var dropDown = $('#' + dropDownId);

    var serializedData = form.serialize();
    if (searchAutoCompleteRequests[formId])
        searchAutoCompleteRequests[formId].abort();
    dropDown.hide();

    lastAutoCompleteDropDown = dropDown
    searchAutoCompleteRequests[formId] = $.ajax({
        url: form.attr('searchAutoCompleteUrl'),
        type: "get",
        data: serializedData
    });

    searchInput.addClass('waitForAutoComplete');

    searchAutoCompleteRequests[formId].done(function (response, textStatus, jqXHR) {

        if (response) {
            showAutoCompleteResult(response);
        }
        else {
        }

        searchInput.removeClass('waitForAutoComplete');
    });

    searchAutoCompleteRequests[formId].fail(function (jqXHR, textStatus, errorThrown) {
        searchInput.removeClass('waitForAutoComplete');
        dropDown.hide();
    });

    searchAutoCompleteRequests[formId].always(function () {
    });
}

function showAutoCompleteResult(response, parameters) {
    if (response != '') {
        lastAutoCompleteDropDown.find('.search-auto-complete-drop-down-inner').html(response);
        lastAutoCompleteDropDown.find('.search-auto-complete-drop-down-inner').rollbar({zIndex: 80, wheelSpeed: 10});
        lastAutoCompleteDropDown.fadeIn();
    }
    else{
        lastAutoCompleteDropDown.hide();
    }
}