<%@ page import="eshop.Banner" %>
<div style="width: 220px;"></div>
<div class="relative">
    <div class="right-side-banners">
        <g:each in="${Banner.findAllByPositionAndDeleted('right', false).sort { it.sortIndex }}">
            <g:if test="${it.url}">
                <a href="${it.url}">
            </g:if>
            <img src="${createLink(controller: 'image', params: [type: 'banner', id: it.id])}"/>
            <g:if test="${it.url}">
                </a>
            </g:if>
        </g:each>



        <g:if test="${grailsApplication.config.instance != 'Local'}">
            <div style="text-align: center;direction: ltr;overflow: hidden">
                <span class="g-plusone" style="width:100px;direction: ltr"></span>

                <script type="text/javascript">
                    window.___gcfg = {lang: 'fa'};

                    (function () {
                        var po = document.createElement('script');
                        po.type = 'text/javascript';
                        po.async = true;
                        po.src = 'https://apis.google.com/js/plusone.js';
                        var s = document.getElementsByTagName('script')[0];
                        s.parentNode.insertBefore(po, s);
                    })();
                </script>
            </div>
        </g:if>
    </div>
</div>

<script language="javascript" type="text/javascript">

    $(document).ready(function(){
        $(document).scroll(function (e) {
            setBannersPosition();
        });

        setBannersPosition();
    });

    function setBannersPosition() {
        var container = $('td.banners');
        var banners = $('div.right-side-banners');
        container.css('paddingBottom', banners.height());
        var position = $(window).scrollTop() - container.position().top - $('.quick-access').height() - $('.accordion').height() - $('.slider-container').height() + 90;
        var maxPosition = container.outerHeight() - banners.height() - $('.quick-access').height() - $('.accordion').height() - 40;
        var minPosition = 0;
        if (position > maxPosition)
            position = maxPosition;
        if (position < minPosition)
            position = minPosition;
        banners.first().stop().animate({
            'top': position + "px"
        }, 200);
    }
</script>