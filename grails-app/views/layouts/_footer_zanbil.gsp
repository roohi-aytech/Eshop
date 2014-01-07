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
    <a href="${createLink(uri: '/termsAndConditions')}"><g:message code="rules.label"></g:message></a> |
    <a href="${createLink(uri: '/contactUs')}"><g:message code="contact.label"></g:message></a>
</div>

<div class="footer3">
    <table>
        <tr>
            <td>
                <ul class="column">
                    <li>
                        <a href="${createLink(controller: 'site', action: 'aboutUs')}"><g:message
                                code="footerItems.about"/></a>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'moneyBackConditions')}"><g:message
                                code="footerItems.returnRules"/></a>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'guarantee')}"><g:message
                                code="footerItems.guarantee"/></a>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'addedValue')}"><g:message
                                code="footerItems.addedValue"/></a>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'deliveryPrice')}"><g:message
                                code="footerItems.deliveryPrice"/></a>
                    </li>
                </ul>
            </td>
            <td>
                <div class="orderTracking">
                    <h3><g:message code="order.tracking"/></h3>
                    <g:form method="post" controller="order" action="track">
                        <g:textField name="trackingCode" id="trackingCode" place-holder="test"/>
                        <g:submitButton name="submit" class="btn" value="${message( code:'order.tracking.button')}"/>
                    </g:form>
                    <script type="text/javascript" language="javascript">
                        $('#trackingCode').maskInput('9999999999');
                    </script>
                </div>
            </td>
            <td>

            </td>
            <td>

            </td>
        </tr>
    </table>
</div>


<!-- LiveZilla Tracking Code (ALWAYS PLACE IN BODY ELEMENT) -->
<div id="livezilla_tracking" style="display:none"></div>
<script type="text/javascript">
    /* <![CDATA[ */
    var script = document.createElement("script");
    script.async = true;
    script.type = "text/javascript";
    var src = "http://support.zanbil.ir:81/server.php?acid=4292d&request=track&output=jcrpt&nse=" + Math.random();
    setTimeout("script.src=src;document.getElementById('livezilla_tracking').appendChild(script)", 1);
    /* ]]> */
</script>
<noscript>
    <img src="http://support.zanbil.ir:81/server.php?acid=4292d&amp;request=track&amp;output=nojcrpt"
         width="0" height="0" style="visibility:hidden;" alt=""/>
</noscript>
<!-- http://www.LiveZilla.net Tracking Code -->
<!-- google analytics-->
<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-33318835-1']);
    _gaq.push(['_setDomainName', 'zanbil.ir']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

</script>

<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-33318835-1', 'zanbil.ir');
    ga('send', 'pageview');

</script>
<!-- google analitics-->


<!-- Iran Web Festival -->
<script>var _mxvtmw_position = 'left', _mxvtmw_domain = 'zanbil.ir'</script>
<script src="http://iwfcdn.iranwebfestival.com/js/mx.vtmw.min.js?59691" async="async"></script>
<!-- Iran Web Festival -->
