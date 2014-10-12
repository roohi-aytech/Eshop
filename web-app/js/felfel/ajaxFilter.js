/**
 * Created by root on 10/9/14.
 */
$(document).ready(function () {
    setupAjaxFilter();

    window.onpopstate = function (e) {
        if (e.state) {
//            $("html").html(e.state.html);
//            document.title = e.state.pageTitle;
            ajaxFilter(e.state.url.replace('/filter?', '/ajaxFilter?').replace('/search?', '/ajaxSearch?'), true)
        }
    };
//    window.history.pushState({"html": $("html").html(), "pageTitle": document.title}, "", window.location.href);
});

function setupAjaxFilter() {
    $('#products').append("<div class='ajaxLoading'><div>در حال بارگذاری...</div></div>");
    $("a[data-ajax='true'], .breadcrumb a, .pagination a").each(function () {
        var href = $(this).attr('href');
        if (!href.contains('javascript:') && !href.contains('/browse')) {
            href = href.replace('/filter?', '/ajaxFilter?');
            href = href.replace('/search?', '/ajaxSearch?');
            $(this).attr('href', 'javascript:ajaxFilter("' + href + '");');
        }
    });
}

function ajaxFilter(url, dontModifyHistory) {
    $('#products').find('.ajaxLoading').width($('#products').width()).height($('#products').height());
    $('#filterBar *,#filterBar *,#graphicalFilter *,#breadcrumb *,#title *,#pagination *,#secondPagination *').off('mouseenter').off('mouseleave').off('mouseover').off('click').off('mouseOver').css('cursor', 'default');
    $('#filterBar, #graphicalFilter, #breadcrumb, #title ,#pagination ,#secondPagination').css('opacity', 0.3);
    $('.ajaxLoading').fadeIn();
    $.ajax({
        type: "POST",
        url: url
    }).done(function (response) {
        document.title = response.pageTitle;
        $('#products').html(response.products);
        $('#filterBar').html(response.filterBar);
        $('#graphicalFilter').html(response.graphicalFilter);
        $('#breadcrumb').html(response.breadCrumb);
        $('#title').html(response.title);
        $('#pagination').html(response.pagination);
        $('#secondPagination').html(response.pagination);
        setupAjaxFilter();
        if (typeof initializeLazyLoad == 'function')
            initializeLazyLoad();
        $('#filterBar, #graphicalFilter, #breadcrumb, #title ,#pagination ,#secondPagination').css('opacity', 1);
        if (!dontModifyHistory) {
            var realUrl = url.replace('/ajaxFilter?', '/filter?').replace('/ajaxSearch?', '/search?');
            try {
                window.history.pushState({"html": $("html").html(), "pageTitle": response.pageTitle, "url": realUrl}, "", realUrl);
            } catch (ignored) {
                window.alert(ignored);
            }
        }
    });
}