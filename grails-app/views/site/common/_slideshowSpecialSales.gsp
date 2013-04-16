<g:javascript>
    specialSaleSlides = ${discounts.collect{[id:it.id, code:it.code]} as grails.converters.JSON};
    var specialSaleSlideSize;
    var specialSaleSlideWidth = $('.slideshowContainer').width();
    var specialSaleSlideHeight;
    if(specialSaleSlideWidth < 1055){
        specialSaleSlideWidth = 580;
        specialSaleSlideHeight = 185;
        specialSaleSlideSize = 1024;
    }
    else if(specialSaleSlideWidth < 1215){
        specialSaleSlideWidth = 835;
        specialSaleSlideHeight = 205;
        specialSaleSlideSize = 1280;
    }
    else{
        specialSaleSlideWidth = 995;
        specialSaleSlideHeight = 260;
        specialSaleSlideSize = 1440;
    }
</g:javascript>

<div class="slideshowContainer">
    <center>
        <div id="slideshowSpecialSales">
            %{--<g:each in="${discounts}" var="discount">--}%
            <a href="#" target="_blank" ng-repeat="discount in specialSaleSlides">
                <img ng-src="<g:createLink controller="image" action="index"/>/{{discount.id}}?type=discount&size={{specialSaleSlideSize}}"
                     alt=" "/>
            </a>
            %{--</g:each>--}%
        </div>

        <div class="baseLine">

        </div>
    </center>
</div>
<g:javascript>
    $(document).ready(function () {
        $('#slideshowSpecialSales').coinslider(
                {
                    width: specialSaleSlideWidth,
                    height: specialSaleSlideHeight,
                    delay: 4000
                });
    });
</g:javascript>