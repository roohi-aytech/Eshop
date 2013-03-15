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
});