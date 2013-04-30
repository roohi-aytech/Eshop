<g:if test="${!specialSaleSlides?.isEmpty()}">
    <g:javascript>
    specialSaleSlides = ${specialSaleSlides.collect { [id: it.id, productId: it.product.id, title: it.product.toString(), finishDate: it.finishDate] } as grails.converters.JSON};
    specialSaleSlideSize;
    specialSaleSlideWidth = $('.slideshowContainer').width();
    specialSaleSlideHeight;
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
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.fusion.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.jcountdown.css')}"/>
    <g:javascript src="jquery.fusion.js"></g:javascript>
    <g:javascript src="jquery.jcountdown.js"></g:javascript>

    <div id="fusion1" class="fusion" style="height: {{specialSaleSlideHeight}}px !important;"><!-- light -->

        <ul>
            <li ng-repeat="specialSale in specialSaleSlides"><a href="#">{{specialSale.title}}</a></li>
        </ul>

        <div class="slideshowContainer">
        <center>
            <section>

                <div class="content" ng-repeat="specialSale in specialSaleSlides">
                    <a ng-href="<g:createLink controller="site"
                                              action="product"/>/{{specialSale.productId}}">
                        <img style="width:{{specialSaleSlideWidth}}px;height:{{specialSaleSlideHeight}}px;"
                             ng-src="<g:createLink controller="image"
                                                  action="index"/>/{{specialSale.id}}?type=specialSale&size={{specialSaleSlideSize}}"
                            ng-alt="{{specialSale.title}}"/>
                    </a>

                    <div id="countdown{{specialSale.id}}" class="countdown" data-date="2013/12/01 12:15:16"></div>
                </div>

            </section>
            </center>
        </div>

    </div>
    <g:javascript>
        $(document).ready(function () {
            $('#slideshowSpecialSales').coinslider(
                    {
                        width: specialSaleSlideWidth,
                        height: specialSaleSlideHeight,
                        delay: 4000
                    });


            jQuery('#fusion1').fusion({
                effect: 'mixed',
                animSpeed: 700,
                eventTrigger: 'click',//click, hover, etc.
                autoHeight: true,
                bar: 'top', //aside, top
                showControls: false,
                showPlay: false,
                playInterval: 5000,
                autoPlay: ${specialSaleSlides.count { it } > 1},
                keyboardNav: true
            });

        <g:each in="${specialSaleSlides}" var="specialSaleSlide">
            $('#countdown${specialSaleSlide.id}').jCountdown({
                    timeText: '2013/12/01 12:15:16',
                    displayLabel: false,
                    displayDay: false,
                    width:200,
                    reflection: false
                });
        </g:each>
        });
    </g:javascript>
</g:if>