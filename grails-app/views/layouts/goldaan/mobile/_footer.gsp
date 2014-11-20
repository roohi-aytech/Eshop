<div class="clear"></div>

<div class="back-top"><div><p><a class="back-top-btn" href="#top">
    <g:message code="backToTop"/>
</a></p></div></div>

<div class="new_footer">
    <sec:ifLoggedIn>
        <a href="${createLink(controller: 'basket', action: 'checkout')}" id="a-footer-cart">
            <div class="btn_grad center"><h3><span
                    class="black"><g:message
                        code="basket"/> ({{basketCounter}})</span></h3></div></a>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <a href="${createLink(controller: 'login', action: 'auth')}"><div class="btn_grad center"><h3><span
                class="black"><g:message code="login/register"/></span></h3></div></a>
    </sec:ifNotLoggedIn>
    <footer>
        <ul class="footer-nav">

            <li>
                <a href="${createLink(controller: 'site', action: 'shoppingSteps')}"><g:message
                        code="help.shoppingSteps"/></a>
            </li>
            <li>
                <a href="${createLink(controller: 'site', action: 'paymentMethods')}"><g:message
                        code="help.payment"/></a>
            </li>
            <li>
                <a href="${createLink(controller: 'site', action: 'shoppingRules')}"><g:message
                        code="rules.shoppingRules"/></a>
            </li>
            <li>
                <a href="${createLink(controller: 'site', action: 'aboutUs')}"><g:message
                        code="footerItems.tour"/></a>
            </li>

        </ul>
    </footer>
</div>