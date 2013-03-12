var timeout;

$(document).ready(function () {
    //$(".thumbnail").switchClass( "thumbnail", "extendedThumbnail", 1000 );
    $(".thumbnail").live({
            mouseenter: function () {
                if (timeout) window.clearTimeout(timeout);
                $(this).css('overflow', 'visible');
                $(this).css('z-index', 1000);
                $(this).css('border-color', '#EEEEEE');
                $(this).wrap('<div class="selectedThumbnail"></div>');
                $(this).find(".extended").first().stop().animate({
                    'max-height': '1000px'
                }, 2000);
                $(this).find(".extended div").first().stop().animate({
                    opacity: 1
                }, 1000);
            },
            mouseleave: function () {
                if (timeout) window.clearTimeout(timeout);
                $(this).css('overflow', 'hidden');
                $(this).css('z-index', 0);
                $(this).css('border-color', '#FFFFFF');
                $(this).unwrap();
                $(this).find(".extended").first().stop().animate({
                    'max-height': 0
                }, 10);
                $(this).find(".extended div").first().stop().animate({
                    opacity: 0
                }, 10);
            }
        }
    );
})