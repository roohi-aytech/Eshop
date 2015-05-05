
<g:if test="${grailsApplication.config.instance != 'Local'}">
    <!-- LiveZilla Tracking Code (ALWAYS PLACE IN BODY ELEMENT) -->
    <div id="livezilla_tracking" style="display:none"></div>
    <script type="text/javascript">
        /* <![CDATA[ */
        var script = document.createElement("script");
        script.async = true;
        script.type = "text/javascript";
        var src = "http://support.zanbil.ir/server.php?acid=4292d&request=track&output=jcrpt&nse=" + Math.random();
        setTimeout("script.src=src;document.getElementById('livezilla_tracking').appendChild(script)", 1);
        /* ]]> */
    </script>
    <noscript>
        <img src="http://support.zanbil.ir/server.php?acid=4292d&amp;request=track&amp;output=nojcrpt"
             width="0" height="0" style="visibility:hidden;" alt=""/>
    </noscript>
    <g:render template="/layouts/${grailsApplication.config.eShop.instance}/alexa"/>
    <!-- http://www.LiveZilla.net Tracking Code -->
    <g:render template="/layouts/zanbil/google_analytics"/>
</g:if>