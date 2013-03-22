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

        $('.navbar-fixed-top').css('top', $(document).scrollTop());
    });
    changeAddToBasketButtonLabel();
    $(window).resize(function(){changeAddToBasketButtonLabel()});
});

function changeAddToBasketButtonLabel(){
    if($('body').innerWidth() > 1000){
        $('.thumbnail .btn-buy span').html('افزودن به سبد');
    }
    else{
        $('.thumbnail .btn-buy span').html('خرید');
    }

    var innerWidth = $('body').innerWidth();
    if(innerWidth < 993)
        innerWidth = 993;
    $('.span600').width(innerWidth - 400);
    $('.span415').width(innerWidth - 522);
    $('.span735').width(innerWidth - 200);
}