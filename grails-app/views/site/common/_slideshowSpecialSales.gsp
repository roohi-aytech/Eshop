<g:if test="${specialSaleSlides && !specialSaleSlides.isEmpty()}">
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
    <link href="${resource(dir: 'css', file: 'jquery.fusion.css')}" rel="stylesheet" type="text/css"/>
    <link href="${resource(dir: 'css', file: 'jquery.jcountdown.css')}" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.fusion.js')}" type="text/javascript"></script>
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.jcountdown.js')}" type="text/javascript"></script>

    <div id="fusion1" class="fusion"><!-- light -->

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
            jQuery('#fusion1').css('width', specialSaleSlideWidth + 22);
            jQuery('#fusion1').css('height', specialSaleSlideHeight + 22);
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
        });
    </g:javascript>
</g:if>