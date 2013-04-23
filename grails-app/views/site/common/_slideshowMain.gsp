<g:if test="${!slides.isEmpty()}">
    <g:javascript>
    mainSlides = ${slides as grails.converters.JSON};
    var mainSlideSize;
    var mainSlideWidth = $('.slideshowContainer').width();
    var mainSlideHeight;
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

    <div class="slideshowContainer">
        <center>
            <div id="slideshowMain">
                %{--<g:each in="${slides}" var="slide">--}%
                <a href="{{slide.url}}" target="_blank" ng-repeat="slide in mainSlides">
                    <img ng-src="<g:createLink controller="image"
                                               action="index"/>/{{slide.id}}?type=mainSlide&size={{mainSlideSize}}"
                         alt="{{slide.name}}"/>
                    %{--<span ng-hide="isEmpty(slide.description)">--}%
                        %{--{{slide.description}}--}%
                    %{--</span>--}%
                </a>
                %{--</g:each>--}%

            </div>

            <div class="baseLine">

            </div>
        </center>
    </div>
    <script>
        $(document).ready(function () {
            $('#slideshowMain').coinslider(
                    {
                        width: mainSlideWidth,
                        height: mainSlideHeight,
                        delay: 5000
                    });
        });
    </script>
</g:if>