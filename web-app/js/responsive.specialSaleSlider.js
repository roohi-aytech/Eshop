$('.responsive-specialSalesSlider').each(function () {

    //build items
    var ul = $(this);
    ul.after('<div class="specialSalesSlider-container"></div>');
    var container = $('.specialSalesSlider-container').first();
    container.css('height', parseInt(ul.attr('height')) + 30);
    container.append('<table class="table-simulated" style="height:' + (parseInt(ul.attr('height')) + 20) + 'px"><tr><td class="extra3"><div></div></td><td class="extra2"><div></div></td><td class="extra1"><div></div></td><td class="main"><div></div></td></tr></table>')
    var main = container.find('.main div');
    var extra1 = container.find('.extra1 div');
    var extra2 = container.find('.extra2 div');
    var extra3 = container.find('.extra3 div');
    ul.find('li img').each(function () {
        var img = $(this);
        var enclosingStart = '';
        var enclosingEnd = '';
        if (img.parent().attr('href')) {
            enclosingStart = '<a href="' + img.parent().attr('href') + '">';
            enclosingEnd = '</a>';
        }
        var finishDate = ''
        if (img.attr('finishDate')) {
            finishDate = '<span class="specialSalesSlider-finishDate">' + img.attr('finishDate') + '</span>';
        }
        main.append(enclosingStart + '<div class="specialSalesSlider-main" style="background-image: url(' + img.attr('src') + ');height:' + ul.attr('height') + 'px;">' + finishDate + '</div>' + enclosingEnd);
        extra1.append(enclosingStart + '<div class="specialSalesSlider-extra1" style="background-image: url(' + img.attr('src-extra1') + ');height:' + ul.attr('height') + 'px;"></div>' + enclosingEnd);
        extra2.append(enclosingStart + '<div class="specialSalesSlider-extra2" style="background-image: url(' + img.attr('src-extra2') + ');height:' + ul.attr('height') + 'px;"></div>' + enclosingEnd);
        extra3.append(enclosingStart + '<div class="specialSalesSlider-extra3" style="background-image: url(' + img.attr('src-extra3') + ');height:' + ul.attr('height') + 'px;"></div>' + enclosingEnd);
    });

    //thumbnails
    main.append('<span class="specialSalesSlider-thumbnails"></span>');
    var thumbnailsContainer = container.find('.specialSalesSlider-thumbnails');
    var indexer = 0;
    ul.find('li img').each(function () {
        var img = $(this);
        thumbnailsContainer.append('<a class="specialSalesSlider-thumbnail specialSalesSlider-button" item-index="' + indexer + '">' + img.attr('alt') + '</a>');
        indexer++;
    });
    thumbnailsContainer.find('.specialSalesSlider-thumbnail').click(function () {
        showSpecialSaleSlide(container, $(this).attr('item-index'));
    });

    //run it
    $(document).ready(function () {
        $(window).resize(function () {
            setSpecialSaleSliderSize(container);
        });

        setSpecialSaleSliderSize(container);
    });
    startSpecialSaleSlider(container);
});

function setSpecialSaleSliderSize(container) {
    var width = $(window).width();
    if (width < 1260) {
        $('.extra1').css('display', 'none');
        $('.extra2').css('display', 'none');
        $('.extra3').css('display', 'none');
    }
    else if (width < 1510) {
        $('.extra1').css('display', 'table-cell');
        $('.extra2').css('display', 'none');
        $('.extra3').css('display', 'none');
    }
    else if (width < 1760) {
        $('.extra1').css('display', 'table-cell');
        $('.extra2').css('display', 'table-cell');
        $('.extra3').css('display', 'none');
    }
    else {
        $('.extra1').css('display', 'table-cell');
        $('.extra2').css('display', 'table-cell');
        $('.extra3').css('display', 'table-cell');
    }
}

function startSpecialSaleSlider(container) {
    container.attr('current-index', -1);
    nextSpecialSaleSlide(container);
    setupCountDowns();
}

function setupCountDowns(){
    $('.specialSalesSlider-finishDate').each(function(){
        $(this).jCountdown({
            timeText: $(this).text(),
            displayLabel: true,
            displayDay: true,
            width:400,
            reflection: false
        });

        $('.jCountdown .group.second .label').text('ثانیه');
        $('.jCountdown .group.minute .label').text('دقیقه');
        $('.jCountdown .group.hour .label').text('ساعت');
        $('.jCountdown .group.day .label').text('روز');
    });
}

function nextSpecialSaleSlide(container) {
    var list = container.find('.specialSalesSlider-main');
    showSpecialSaleSlide(container, (parseInt(container.attr('current-index')) + 1) % list.length);
}

function previousSpecialSaleSlide(container) {
    var list = container.find('.specialSalesSlider-main');
    showSpecialSaleSlide(container, (parseInt(container.attr('current-index')) + list.length - 1) % list.length);
}

//var specialSaleSlideTimeOutIntervalNumber = -1
function showSpecialSaleSlide(container, index) {
    var list = container.find('.specialSalesSlider-main');
    var listExtra1 = container.find('.specialSalesSlider-extra1');
    var listExtra2 = container.find('.specialSalesSlider-extra2');
    var listExtra3 = container.find('.specialSalesSlider-extra3');
    $(list[parseInt(container.attr('current-index'))]).stop().show().fadeOut(1000);
    $(listExtra1[parseInt(container.attr('current-index'))]).stop().show().fadeOut(1000);
    $(listExtra2[parseInt(container.attr('current-index'))]).stop().show().fadeOut(1000);
    $(listExtra3[parseInt(container.attr('current-index'))]).stop().show().fadeOut(1000);
    $(list[parseInt(container.attr('current-index'))]).find('.jCountdownContainer').stop().show().fadeOut(1000);
    container.attr('current-index', index);
    $(list[parseInt(container.attr('current-index'))]).stop().hide().fadeIn(1000);
    $(listExtra1[parseInt(container.attr('current-index'))]).stop().hide().fadeIn(1000);
    $(listExtra2[parseInt(container.attr('current-index'))]).stop().hide().fadeIn(1000);
    $(listExtra3[parseInt(container.attr('current-index'))]).stop().hide().fadeIn(1000);
    $(list[parseInt(container.attr('current-index'))]).find('.jCountdownContainer').stop().hide().fadeIn(1000);
    container.find('.specialSalesSlider-thumbnail').removeClass('current');
    container.find('.specialSalesSlider-thumbnail[item-index=' + index + ']').addClass('current');

    container.stop().animate({
        opacity: 1
    }, 10000, function () {
        nextSpecialSaleSlide(container);
    });
}