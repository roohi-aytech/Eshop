<div class="footer1">
    <% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
    <g:set var="lastVisitedProducts"
           value="${productService.findLastVisitedProducts(cookie(name: 'lastVisitedProducts'))}"></g:set>
    <g:if test="${lastVisitedProducts && !lastVisitedProducts.isEmpty()}">
        <g:render template="/site/common/productCarousel"
                  model="${[title: message(code: 'product.lastVisited.list'), productList: lastVisitedProducts, mode: 'large']}"></g:render>
    </g:if>
</div>

<div class="footer2">
    <a href="${createLink(uri: '/')}"><g:message code="home.label"></g:message></a> |
    <a href="#"><g:message code="help.label"></g:message></a> |
    <a href="${createLink(uri: '/contactUs')}"><g:message code="contact.label"></g:message></a>
</div>

<div class="footer3">
    <g:message code="rulesFullFillment"/>
</div>


<!-- LiveZilla Tracking Code (ALWAYS PLACE IN BODY ELEMENT) -->
<div id="livezilla_tracking" style="display:none"></div>
<script type="text/javascript">
    /* <![CDATA[ */
    var script = document.createElement("script");
    script.async = true;
    script.type = "text/javascript";
    var src = "http://91.99.98.70:81/server.php?acid=4292d&request=track&output=jcrpt&nse=" + Math.random();
    setTimeout("script.src=src;document.getElementById('livezilla_tracking').appendChild(script)", 1);
    /* ]]> */
</script>
<noscript>
    <img src="http://91.99.98.70:81/server.php?acid=4292d&amp;request=track&amp;output=nojcrpt"
         width="0" height="0" style="visibility:hidden;" alt=""/>
</noscript>
<!-- http://www.LiveZilla.net Tracking Code -->
<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-33318835-1']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

</script>