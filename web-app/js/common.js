$(document).ready(function () {

    $(window).scroll(function () {
        if ($(document).scrollTop() > $('#header1').height()) {
//            $('#header1').css('display', 'none');
//            $('#logo-small').css('display', 'inline-block');
//            $('.search-box').css('margin-right', '75px');
        }
        else {
//            $('#header1').css('display', 'block');
//            $('#logo-small').css('display', 'none');
//            $('.search-box').css('margin-right', '60px');
        }
    });

    $(".product-thumbnails .thumbnail").hover(function () {
        $(this).closest("li").css("z-index", 9999999);
        $(this).stop().animate({ height: "425", width: parseInt($(this).attr('oldWidth')) + 40 , left: parseInt($(this).attr('oldLeft')) - 20, top: $(this).attr('oldTop') - 20 }, "fast");
        $(this).addClass('selectedThumbnail');

    }, function () {
        $(this).closest("li").css("z-index", 0);
        $(this).stop().animate({ height: $(this).attr('oldHeight'), width: ($(this).closest("li").width() * 9)/10, left: "5%", top: $(this).attr('oldTop') }, "fast");
        $(this).removeClass('selectedThumbnail');
    });

    $(".showbiz .thumbnail").hover(function () {
        $(this).find('.content').stop().animate({ 'margin-top': "-235"}, "fast");

    }, function () {
        $(this).find('.content').stop().animate({ 'margin-top': "0"}, "fast");
    });

    $(window).resize(function () {
        changeAddToBasketButtonLabel();
        resizeThumbnails();
    });

    changeAddToBasketButtonLabel();
    resizeThumbnails();

    $('.scrollable').rollbar({zIndex:80,wheelSpeed:10});

    $('.topNavigationItem a.dropdown-toggle').tipsy({live:true});

});

function changeAddToBasketButtonLabel() {
//    if ($('body').innerWidth() > 1000) {
//        $('.thumbnail .btn-buy span').html('افزودن به سبد');
//    }
//    else {
//        $('.thumbnail .btn-buy span').html('خرید');
//    }

//    $('.span600').width($('body').innerWidth() - 400);
//    $('.span415').width($('body').innerWidth() - 522);
//    $('.span735').width($('body').innerWidth() - 200);

}

function resizeThumbnails() {
    var currentWidth = $('.span600').first().width();
    if (currentWidth > 700) {
//        $('.span3').stop().animate({ width:'25%'}, "slow");
        $('.span3').css('width', '25%');
    }
    else {
//        $('.span3').stop().animate({ width:'33.3%'}, "slow");
        $('.span3').css('width', '33.33%');
    }

    //set thumbnails attributes
    $(".thumbnails .thumbnail").each(function(){
        $(this).attr('oldWidth', $(this).width());
        $(this).attr('oldHeight', $(this).height());
        $(this).attr('oldLeft', $(this).position().left);
        $(this).attr('oldTop', $(this).position().top);
        $(this).attr('style', '');
    })
}

