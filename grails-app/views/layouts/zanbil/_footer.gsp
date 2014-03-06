<div class="footer1">

</div>

<div class="footer2">
    %{--<a href="${createLink(uri: '/')}"><g:message code="home.label"/></a> |--}%
    %{--<a href="#"><g:message code="help.label"/></a> |--}%
    %{--<a href="${createLink(uri: '/termsAndConditions')}"><g:message code="rules.label"/></a> |--}%
    %{--<a href="${createLink(uri: '/contactUs')}"><g:message code="contact.label"/></a>--}%
</div>

<div class="footer3">
    <table>
        <tr>
            <td colspan="4">
                <ul class="third-party">
                    <li>
                        <img src="${resource(dir: 'images/third-party', file: 'bonyad-koodak.png')}"/>
                    </li>
                    <li>
                        <img src="${resource(dir: 'images/third-party', file: 'bimeh-asia.png')}"/>
                    </li>
                    <li>
                        <img src="${resource(dir: 'images/third-party', file: 'bank-mellat.png')}"/>
                    </li>
                    <li>
                        <img src="${resource(dir: 'images/third-party', file: 'bank-saman.png')}"/>
                    </li>
                    <li>
                        <img src="${resource(dir: 'images/third-party', file: 'post-iran.png')}"/>
                    </li>
                    <li>
                        <img src="${resource(dir: 'images/third-party', file: 'post-aramex.png')}"/>
                    </li>
                    <li>
                        <img src="${resource(dir: 'images/third-party', file: 'post-tipax.png')}"/>
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <ul class="third-party">
                    <li>
                        <img src="${resource(dir: 'images/third-party', file: 'best-brands.png')}"/>
                    </li>
                    <li>
                        <img src="${resource(dir: 'images/third-party', file: 'rights-all.png')}"/>
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <hr/>
            </td>
        </tr>
        <tr>
            <td>
                <ul class="column">
                    <li class="bold">
                        <g:message code="rules"/>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'shoppingRules')}"><g:message code="rules.shoppingRules"/></a>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'customerRights')}"><g:message code="rules.customerRights"/></a>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'moneyBackConditions')}"><g:message
                                code="footerItems.guarantee"/></a>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'guarantee')}"><g:message
                                code="footerItems.returnRules"/></a>
                    </li>
                </ul>
            </td>
            <td>
                <ul class="column">
                    <li class="bold">
                        <g:message code="help.label"/>
                    </li>
                    <li>
                        <a href="#"><g:message
                                code="help.shopping"/></a>
                    </li>
                    <li>
                        <a href="#"><g:message
                                code="help.register"/></a>
                    </li>
                    <li>
                        <a href="#"><g:message
                                code="help.search"/></a>
                    </li>
                    <li>
                        <a href="#"><g:message
                                code="help.compare"/></a>
                    </li>
                </ul>
            </td>
            <td>
                <ul class="column">
                    <li class="bold">
                        <g:message
                                code="help.all"/>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'shoppingSteps')}"><g:message
                                code="help.shoppingSteps"/></a>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'paymentMethods')}"><g:message
                                code="help.payment"/></a>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'paymentAndDelivery')}"><g:message
                                code="help.paymentAndDelivery"/></a>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'deliveryTips')}"><g:message
                                code="help.deliveryTips"/></a>
                    </li>
                </ul>
            </td>
            <td>
                <ul class="column">
                    <li class="bold">
                        <g:message code="footerItems.about"/>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'aboutUs')}"><g:message
                                code="footerItems.tour"/></a>
                    </li>
                    <li>
                        <a href="http://www.cv.zanbil.ir/"><g:message
                                code="help.employment"/></a>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'site', action: 'suppliers')}"><g:message
                                code="help.supplier"/></a>
                    </li>
                </ul>
            </td>
        </tr>
    </table>
</div>

<div class="footer4">
    <g:message code="copyright"/>
</div>

<g:if test="${grailsApplication.config.instance != 'Local'}">
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
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-33318835-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();

    </script>
</g:if>