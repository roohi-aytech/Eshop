<g:if test="${slides && !slides.isEmpty()}">
    <link href="${resource(dir: 'css', file: 'jquery.flexslider.css')}" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.flexslider.js')}"
            type="text/javascript"></script>

    <div class="flexslider">
        <ul class="slides">
            <g:each in="${slides}" var="slide">
                <li>
                    <g:if test="${slide.url}">
                        <a href="${slide.url}">
                    </g:if>
                    <img alt="${slide.name}"
                         src="${createLink(controller: "image", action: "index")}/${slide.id}?type=mainSlide"/>
                    <g:if test="${slide.url}">
                        </a>
                    </g:if>
                </li>
            </g:each>
        </ul>
    </div>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {

            $("#top-banners").hide();
            var $bannerImages = $('#top-banners').find('img');
            var loaded_banner_images_count = 0;

            $bannerImages.load(function () {
                loaded_banner_images_count++;

                if (loaded_banner_images_count == $bannerImages.length) {
                    $("#top-banners").show();
                    $('.flexslider')
                            .width($('#main').width() - $('.left-side-banners').width() - $('.right-side-banners').width() - ($('.right-side-banners').width() > 0 ? 15 : 0) - ($('.left-side-banners').width() > 0 ? 15 : 0))
                            .height($('#top-banners').height() - 15)
                            .flexslider({
                                animation: "slide",
                                prevText: "",
                                nextText: ""
                            });
                }
            }).each(function () {
                if (this.complete) $(this).load();
            });
            ;
        });
    </script>
</g:if>