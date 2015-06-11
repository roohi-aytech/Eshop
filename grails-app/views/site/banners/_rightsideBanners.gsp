<%@ page import="eshop.Banner" %>
<div style="width: 220px;"></div>

<div class="relative">
    <div class="right-side-banners banners">

        <g:if test="${grailsApplication.config.eShop.instance == 'zanbil'}">
            <g:render template="/site/common/statusFilter"/>
            <div class="orderTracking">
                <h4><g:message code="order.tracking"/></h4>
                <g:form method="post" controller="order" action="track">
                    <g:submitButton name="submit"
                                    value="${message(code: 'order.tracking.button')}"/><g:textField name="trackingCode"
                                                                                                    id="trackingCodePanel"
                                                                                                    place-holder="test"/>
                </g:form>
            </div>
            <script type="text/javascript" language="javascript">
                $('#trackingCodePanel').maskInput('9999999999');
            </script>
        </g:if>

        <g:each in="${Banner.findAllByPositionAndDeleted('right', false).sort { it.sortIndex }}">
            <g:if test="${it.url}">
                <a href="${it.url}">
            </g:if>
            <img src="${createLink(controller: 'image', params: [type: 'banner', id: it.id])}"/>
            <g:if test="${it.url}">
                </a>
            </g:if>
        </g:each>


        <g:if test="${grailsApplication.config.instance == 'Zanbil'}">
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

<g:if test="${grailsApplication.config.eShop.instance == 'zanbil'}">
    <script language="javascript" type="text/javascript">

        $(document).ready(function () {
            $(document).scroll(function (e) {
                setBannersPosition();
            });

            setBannersPosition();
        });

        function setBannersPosition() {
            var container = $('td.banners');
            var banners = $('div.right-side-banners');
            var bth=$('#filterBar').height();
//            container.css('paddingBottom', banners.height());
//            var position = $(window).scrollTop() - container.position().top - $('.quick-access').height()- $('#filterBar').height() - $('.accordion').height() - $('.slider-container').height()- $('.specialSales-cell').height()- $('#header').height() + 220;
//            var maxPosition = container.outerHeight() - banners.height() - $('.quick-access').height()- $('.accordion').height()  - 40;
//            var minPosition = 0;
//            if (position > maxPosition)
//                position = maxPosition;
//            if (position < minPosition)
//                position = minPosition;
            var position=Math.max(container.offset().top+bth, $(window).scrollTop())-(container.offset().top+bth);
            if(container.height() < position+banners.height()+bth)
                position=container.height()-banners.height();
            banners.first().stop().animate({
                'top': position + "px"
            }, 200);
        }
    </script>
</g:if>