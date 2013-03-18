var timeout;

$(document).ready(function () {
    //$(".thumbnail").switchClass( "thumbnail", "extendedThumbnail", 1000 );
    $(".thumbnail").live({
            mouseenter: function () {
                if (timeout) window.clearTimeout(timeout);
                $(this).css('border-color', '#EEEEEE');
                $(this).addClass('selectedThumbnail');
                $(this).find(".main").first().stop().animate({
                    'margin-top': '-160px'
                }, 700);
            },
            mouseleave: function () {
                if (timeout) window.clearTimeout(timeout);
                $(this).css('border-color', '#FFFFFF');
                $(this).removeClass('selectedThumbnail');
                $(this).find(".main").first().stop().animate({
                    'margin-top': '0'
                }, 500);

            }
        }
    );
})