$('.responsive-slider').each(function () {

    //build items
    var ul = $(this);
    $('body').prepend('<div class="slider-container"></div>');
    var container = $('body .slider-container').first();
    $('#body-container').css('padding-top', '5px');
    container.css('height', ul.attr('height'));
    ul.find('li img').each(function () {
        var img = $(this);
        var content = '<div class="slider-item" style="background-image: url(' + img.attr('src') + ');height:' + ul.attr('height') + 'px;"></div>';
        if(img.parent().attr('href'))
            content = '<a href="' + img.parent().attr('href') + '">' + content + '</a>';
        container.append(content);
    });

    //progressbar
    container.append('<span class="slider-progress" style="top:' + (parseInt(ul.attr('height')) - 5) + 'px"></span>');

    //move buttons
    container.append('<span class="slider-next slider-button"></span>');
    container.append('<span class="slider-previous slider-button"></span>');
    container.find('.slider-next').click(function () {
        nextSlide(container)
    });
    container.find('.slider-previous').click(function () {
        previousSlide(container)
    });

    //thumbnails
    container.append('<span class="slider-thumbnails"></span>');
    var thumbnailsContainer = container.find('.slider-thumbnails');
    var indexer = 0;
    ul.find('li img').each(function () {
        var img = $(this);
        thumbnailsContainer.append('<span class="slider-thumbnail slider-button" item-index="' + indexer + '"></span>');
        container.append('<img id="slider-thumbnail-' + indexer + '" src="' + img.attr('src') + '"/>');
        indexer++;
    });
    thumbnailsContainer.find('.slider-thumbnail').click(function () {
        showSlide(container, $(this).attr('item-index'));
    }).hoverIntent(function () {
            $('#slider-thumbnail-' + $(this).attr('item-index')).stop().hide().fadeIn();
        }, function () {
            $('#slider-thumbnail-' + $(this).attr('item-index')).stop().show().fadeOut();
        });

    //run it
    startSlider(container);
});

function startSlider(container) {
    container.attr('current-index', -1);
    nextSlide(container);
}

function nextSlide(container) {
    var list = container.find('div');
    showSlide(container, (parseInt(container.attr('current-index')) + 1) % list.length);
}

function previousSlide(container) {
    var list = container.find('div');
    showSlide(container, (parseInt(container.attr('current-index')) + list.length - 1) % list.length);
}

function showSlide(container, index) {
    var list = container.find('div');
    $(list[parseInt(container.attr('current-index'))]).stop().show().fadeOut(1000);
    container.attr('current-index', index);
    $(list[parseInt(container.attr('current-index'))]).stop().hide().fadeIn(1000);
    container.find('.slider-thumbnail').css('background-color', '#ffffff');
    container.find('.slider-thumbnail[item-index=' + index +']').css('background-color', '#FFC30E');
    container.find('.slider-progress').css('width', '0%').stop().animate({
        width: '100%'
    }, 10000, function () {
        nextSlide(container);
    });
}