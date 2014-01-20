(function ($) {

    var allPanels = $('.accordion > dd').hide();

    $('.accordion > dt > a').click(function () {
        if ($(this).parent().hasClass('open')){
            $('.accordion .open').removeClass('open');
            allPanels.slideUp();
        }
        else{
            $('.accordion .open').removeClass('open');
            allPanels.slideUp();
            $(this).parent().addClass('open').next().slideDown();
        }
        return false;
    });

})(jQuery);