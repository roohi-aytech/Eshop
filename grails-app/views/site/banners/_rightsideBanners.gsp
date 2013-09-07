<%@ page import="eshop.Banner" %>
<div class="banners">
    <g:each in="${Banner.findAllByPositionAndDeleted('right', false).sort { it.sortIndex }}">
        <g:if test="${it.url}">
            <a href="${it.url}">
        </g:if>
        <img src="${createLink(controller: 'image', params: [type: 'banner', id: it.id])}"/>
        <g:if test="${it.url}">
            </a>
        </g:if>
    </g:each>
</div>

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