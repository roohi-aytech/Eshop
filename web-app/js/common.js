function Stack() {
    this.stac = new Array();
    this.pop = function () {
        return this.stac.pop();
    }
    this.push = function (item) {
        this.stac.push(item);
    }
}

function setupTumbnails(){

    $(".thumbnailGrid .thumbnail").hoverIntent(function () {

        $(this).find('img').first().css('position', 'absolute');

        var titleHeight = $(this).find('.title').first().height();
        if(titleHeight < 50)
            titleHeight = 50;

        $(this).find('.attributes').first().css('position', 'absolute').css('width', $(this).width()).css('height', $(this).height() - titleHeight - 50);

        $(this).find('img').first().stop().animate({
            'right': '0',
            'margin-right': '0',
            'margin-left': '0',
            'border-radius': '2px',
            'padding': '2px',
            'width': '50px',
            'height': '50px'
        });

        $(this).find('.title').first().stop().animate({
            'margin-right': '60px',
            'margin-left': '0',
            'margin-top': '0'
        });

        $(this).find('.attributes').first().stop().animate({
            'top': titleHeight + 50,
            'opacity': '1'
        });

        $(this).find('.buttons').first().stop().animate({
            'top': titleHeight + 5,
            'opacity': '1'
        });

    }, function () {

        $('.manual-tip').css('opacity', 0)

        $(this).find('img').first().stop().animate({
//            'right': 'auto',
            'margin-right': $(this).width() / 2 - 80,
            'margin-left': $(this).width() / 2 - 80,
            'border-radius': '4px',
            'padding': '4px',
            'width': '150px',
            'height': '150px'
        });

        $(this).find('.title').first().stop().animate({
            'top': '168px',
            'margin-right': '10px',
            'margin-left': '10px',
            'margin-top': '168px'
        });

        $(this).find('.attributes').first().stop().animate({
            'top': '300px',
            'opacity': '0'
        });

        $(this).find('.buttons').first().stop().animate({
            'top': '255px',
            'opacity': '0'
        });
    });
}

$(document).ready(function () {

    setupTumbnails();

    $(window).resize(function () {

//        window.alert($(document.body).width());

        setupMenu();
//
//        $(document.body)
//            .removeClass('res-1024')
//            .removeClass('res-1280')
//            .removeClass('res-1440')
//            .removeClass('res-1920');

        changeAddToBasketButtonLabel();
        resizeThumbnails();
        setupFooter();
    });

    changeAddToBasketButtonLabel();
    resizeThumbnails();

    $('.scrollable').css('overflow', 'auto');//.rollbar({zIndex: 80, wheelSpeed: 10});

    $('.price-last-update').tipsy({live: true});
    $('.addedValues .item').tipsy({live: true, gravity: 'e'});

//    $('.has-tipsy').each(function () {
//        var tipContainer = $(this).parent().parent().find('.tips-container');
//        tipContainer.append('<span class="manual-tip ' + $(this).attr('type') + '"><span>' + $(this).attr('original-title') + '</span></span>');
//
//        $(this).hoverIntent(function () {
//            $('.manual-tip').css('opacity', 0)
//            $('.manual-tip').attr('opened', '0')
//            var tip = $(this).parent().parent().find('.tips-container .manual-tip.' + $(this).attr('type'));
//            tip.css('top', $(this).parent().parent().find('.title').first().height() + 30);
//            tip.css('left', $(this).position().left + 15);
//            tip.animate({
//                'opacity': 0.9
//            });
//        }, function () {
//            var tip = $(this).parent().parent().find('.tips-container .manual-tip.' + $(this).attr('type'));
//            tip.css('opacity', 0)
//        });
//
//
//    });

    $(document).scroll(function (e) {
        setProductCartPosition();
        setProductMenuPosition();
    });

    setupMenu();
    setExternalLinksTarget();
    setupFooter();

    $('.product-specification').click(function () {
        $('.product-proOpinions-panel').hide();
        $('.product-reviewList-panel').hide();
        $('.product-specification-panel').fadeIn();
    });

    $('.product-proOpinions').click(function () {
        $('.product-specification-panel').hide();
        $('.product-reviewList-panel').hide();
        $('.product-proOpinions-panel').fadeIn();
    });

    $('.product-reviewList').click(function () {
        $('.product-specification-panel').hide();
        $('.product-proOpinions-panel').hide();
        $('.product-reviewList-panel').fadeIn();
    });

});

function setProductCartPosition() {
    var position = $(window).scrollTop();
    var maxPosition = $('.totalFooter').position().top - $('.product-card').height() - 115;
    if (position > maxPosition)
        position = maxPosition;
    $('.product-card').first().stop().animate({
        'top': position + "px"
    }, 200);
}

$(document).ready(function(){
    $('li.product-upLink').click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
        return false;
    });
});

function setProductMenuPosition() {
    if($(window).scrollTop() > 100){
        $('li.product-upLink').stop().animate({
            opacity:1
        });
    }
    else{
        $('li.product-upLink').stop().animate({
            opacity:0
        });
    }
    var position = $(window).scrollTop() + 120;
    var maxPosition = $('.totalFooter').position().top - $('.product-details .tabs.rotate').height() - 95;
    if (position > maxPosition)
        position = maxPosition;
    $('.product-details .tabs.rotate').first().stop().animate({
        'top': position + "px"
    }, 200);
}


function changeAddToBasketButtonLabel() {
//    $('#basketCounter').fadeIn();
//    $('#link-compareList .counter').fadeIn();
//    $('#link-wishList .counter').fadeIn();
}

function resizeThumbnails() {
    var currentWidth = $('.thumbnailGrid').first().width();
    if (currentWidth > 1900) {
        $('.thumbnailGrid .span3').css('width', (currentWidth - 90) / 12);
//        $('.thumbnailGrid .span3').css('width', (currentWidth - 55) / 8);
//    } else if (currentWidth > 1400) {
//        $('.thumbnailGrid .span3').css('width', (currentWidth - 50) / 7);
    } else if (currentWidth > 1300) {
        $('.thumbnailGrid .span3').css('width', (currentWidth - 45) / 6);
//    } else if (currentWidth > 1000) {
//        $('.thumbnailGrid .span3').css('width', (currentWidth - 40) / 5);
    } else if (currentWidth > 800) {
        $('.thumbnailGrid .span3').css('width', (currentWidth - 35) / 4);
    }
    else {
        $('.thumbnailGrid .span3').css('width', (currentWidth - 30) / 3);
    }

    $('.sb-navigation-right').hoverIntent(function () {
        lastHoveredCarouselButton = $(this);
        hoverCarouselButton();
    }, function () {
        lastHoveredCarouselButton = null;
    });

    $('.sb-navigation-left').hoverIntent(function () {
        lastHoveredCarouselButton = $(this);
        hoverCarouselButton();
    }, function () {
        lastHoveredCarouselButton = null;
    });

}

var lastHoveredCarouselButton;
function hoverCarouselButton() {
    if (lastHoveredCarouselButton) {
        lastHoveredCarouselButton.click();
        setTimeout(hoverCarouselButton, 1000);
    }
}

function setupFooter() {
    $('.totalFooter').height($('.footer1').height() + $('.footer2').height() + $('.footer3').height())
}

function setExternalLinksTarget() {
    jQuery(function ($) {
        $('a[href^="http://"]')
            .not('[href*="richardneililagan.com"]')
            .each(function () {
                if (!$(this).attr('target'))
                    $(this).attr('target', '_blank');
            });
    });
}

function setupMenu() {
    if($('#header').length) {
        $('.top-menu').width($('#header').width()).css('left', $('#header').position().left);
    }
}

