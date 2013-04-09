$(document).ready(function () {

    $(window).scroll(function () {
        if($(document).scrollTop() > $('#header1').height())   {
            $('#header1').css('display', 'none');
            $('#logo-small').css('display', 'inline-block');
            $('.search-box').css('margin-right', '75px');
        }
        else{
            $('#header1').css('display', 'block');
            $('#logo-small').css('display', 'none');
            $('.search-box').css('margin-right', '60px');
        }
    });

    $(".thumbnail").live({
            mouseenter: function () {
//                if (timeout) window.clearTimeout(timeout);
//                $(this).css('border-color', '#EEEEEE');
//                $(this).addClass('selectedThumbnail');
//                $(this).find(".main").first().stop().delay(1000).animate({
//                    'margin-top': '-160px'
//                }, 700);
            },
            mouseleave: function () {
//                if (timeout) window.clearTimeout(timeout);
//                $(this).css('border-color', 'Transparent');
//                $(this).removeClass('selectedThumbnail');
//                $(this).find(".main").first().stop().animate({
//                    'margin-top': '0'
//                }, 500);

            }
        }
    );

    $(window).resize(function(){
        changeAddToBasketButtonLabel();
        //resizeThumbnails();
        //resetCarousel();
    });

    changeAddToBasketButtonLabel();
    resizeThumbnails();
    resetCarousel();

});

function changeAddToBasketButtonLabel(){
    if($('body').innerWidth() > 1000){
        $('.thumbnail .btn-buy span').html('افزودن به سبد');
    }
    else{
        $('.thumbnail .btn-buy span').html('خرید');
    }

    $('.span600').width($('body').innerWidth() - 400);
    $('.span415').width($('body').innerWidth() - 522);
    $('.span735').width($('body').innerWidth() - 200);

    //carousel
    $('.carouselItem').width(($('#jCarouselLite').width() / 5) + "px");
    $("#jCarouselLite").jCarouselLite({
        btnNext: "#next",
        btnPrev: "#prev"
    })
}

function resizeThumbnails(){
    var currentWidth = $('.span600').first().width();
    if(currentWidth > 700)
    {
        $('.span3').css('width', '25%');
    }
    else{
        $('.span3').css('width', '33.33%');
    }
}

function resetCarousel(){
//    $('.carouselItem').width(($('#jCarouselLite').width() / 5) + "px");
    $("#jCarouselLite").jCarouselLite({
        btnNext: "#next",
        btnPrev: "#prev",
//        easing: "bounceout",
//        speed: 1000,
        mouseWheel: true
    })
}