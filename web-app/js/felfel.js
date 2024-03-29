Number.prototype.formatMoney = function formatMoney(c, d, t) {
    var n = this,
        c = isNaN(c = Math.abs(c)) ? 0 : c,
        d = d == undefined ? "." : d,
        t = t == undefined ? "," : t,
        s = n < 0 ? "-" : "",
        i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;
    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};

$(document).ready(function () {

    //dotdotdot
    $('.product_block .subtitle p').dotdotdot({
        ellipsis: '... ',
        wrap: 'word',
        fallbackToLetter: true,
        after: null,
        watch: false,
        height: 35,
        tolerance: 0,
        callback: function (isTruncated, orgContent) {
        },
        lastCharacter: {
            remove: [ ' ', ',', ';', '.', '!', '?' ],
            noEllipsis: []
        }
    });

    //fix navigation
    $(document).scroll(function () {
        resetHeaderPosition();
    });
    resetHeaderPosition();

    $('#back-top').find('a').click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 400);
        return false;
    });

;
    $('.product_block .price_info .cta_block .btn-buy').attr('original-title', 'افزودن به سبد خرید').tipsy({live: true, gravity: 'sw'});
    $('.product_block .price_info .cta_block .btn-compare').attr('original-title', 'افزودن به سبد مقایسه').tipsy({live: true, gravity: 'nw'});
    $('.product_block .price_info .cta_block .btn-wish').attr('original-title', 'افزودن به سبد آرزو').tipsy({live: true, gravity: 'nw'});
    $('.product_block .price_info .cta_block .quick_view').attr('original-title', 'نمایش اطلاعات اولیه').tipsy({live: true, gravity: 'nw'});


    $('.btn-primary').addClass('btn-danger').removeClass('btn-primary');
    $('.btn-success').addClass('btn-danger').removeClass('btn-success');

    $('.scrollable').rollbar({zIndex: 80, wheelSpeed: 10});
});

function resetHeaderPosition(){
    var position = $(window).scrollTop();
    if (position > 76) {
        $('.header .navigation').addClass('sticky_nav');
    }
    else {
        $('.header .navigation').removeClass('sticky_nav');
    }
    if (position > 100) {
        $('#back-top').fadeIn();
    }
    else {
        $('#back-top').fadeOut();
    }
}
