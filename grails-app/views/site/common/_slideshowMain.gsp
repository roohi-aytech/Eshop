<g:if test="${slides && !slides.isEmpty()}">
    <g:javascript>
    mainSlides = ${slides.collect { [id: it.id, url: it.url] } as grails.converters.JSON};
    mainSlideSize;
    mainSlideWidth = $('.slideshowContainer').width();
    mainSlideHeight;
    if(mainSlideWidth < 1055){
        mainSlideWidth = 785;
        mainSlideHeight = 300;
        mainSlideSize = 1024;
    }
    else if(mainSlideWidth < 1215){
        mainSlideWidth = 1040;
        mainSlideHeight = 280;
        mainSlideSize = 1280;
    }
    else{
        mainSlideWidth = 1200;
        mainSlideHeight = 350;
        mainSlideSize = 1440;
    }
    </g:javascript>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.banner-rotator.css')}"/>
    <g:javascript src="jquery.easing.1.3.js"></g:javascript>
    <g:javascript src="jquery.banner-rotator.js"></g:javascript>

    <div class="slideshowContainer">
        <center>
            <div id="slideshowBorder">
                <div class="container">
                    <div id="preview1" class="banner-rotator">
                        <ul>
                            <li ng-repeat="slide in mainSlides" onclick="{{slide.url}}">
                                <a href="<g:createLink controller="image" action="index"/>/{{slide.id}}?type=mainSlide&size={{mainSlideSize}}" title="{{slide.name}}">
                                    <img alt="{{slide.name}}" ng-src="<g:createLink controller="image" action="index"/>/{{slide.id}}?type=mainSlide&size={{mainSlideSize}}"/>
                                </a>
                                <img
                                        alt="{{slide.url}}"
                                        width="200px"
                                        ng-src="<g:createLink controller="image" action="index"/>/{{slide.id}}?type=mainSlide&size={{mainSlideSize}}" class="tt-img"/>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </center>
    </div>

    <script>
        $(document).ready(function () {
//            $('#slideshowMain').coinslider(
//                    {
//                        width: mainSlideWidth,
//                        height: mainSlideHeight,
//                        delay: 5000
//                    });

            var $container = $(".container");

            $container.bannerRotator({
                width: mainSlideWidth,
                height: mainSlideHeight,
                thumb_width: 16,
                thumb_height: 16,
                button_width: 24,
                button_height: 24,
                margin: 5,
                tooltip_width: 'auto',
                tooltip_height: 'auto',
                auto_start: true,
                delay: 6000,
                play_once: false,
                pause_onmouseover: false,
                effect: 'random',
                duration: 800,
                easing: 'swing',
                cpanel_align: 'BC',
                outside_cpanel: false,
                cpanel_onmouseover: false,
                thumb_type: 'empty',
                select_onmouseover: false,
                tooltip_type: 'image',
                tooltip_delay: 0,
                dbuttons_type: 'large',
                dbuttons_onmouseover: false,
                display_playbutton: false,
                display_timer: true,
                timer_align: 'top',
                text_effect: 'fade',
                text_duration: 500,
                text_easing: 'swing',
                text_delay: 0,
                text_onmouseover: false,
                text_sync: true,
                center_image: true,
                shuffle: true,
                mousewheel: true,
                swipe: true,
                block_size: 75,
                vslice_size: 55,
                hslice_size: 50,
                block_delay: 25,
                vslice_delay: 73,
                hslice_delay: 183
            });
        });
    </script>
</g:if>