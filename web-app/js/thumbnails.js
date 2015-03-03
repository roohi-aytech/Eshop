var timeout;

$(document).ready(function () {
    //$(".thumbnail").switchClass( "thumbnail", "extendedThumbnail", 1000 );
    $(".thumbnail").live({
            mouseenter: function () {
                if (timeout) window.clearTimeout(timeout);
                $(this).css('border-color', '#EEEEEE');
                $(this).addClass('selectedThumbnail');
                $(this).find(".main").first().stop().delay(1000).animate({
                    'margin-top': '-160px'
                }, 700);
            },
            mouseleave: function () {
                if (timeout) window.clearTimeout(timeout);
                $(this).css('border-color', 'Transparent');
                $(this).removeClass('selectedThumbnail');
                $(this).find(".main").first().stop().animate({
                    'margin-top': '0'
                }, 500);

            }
        }
    );

    $(window).resize(function(){
        resizeThumbnails();
    });
    resizeThumbnails();

})

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