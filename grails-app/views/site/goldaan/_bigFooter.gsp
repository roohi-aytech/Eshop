<div class="footer-info-container footer1">

    %{--<div>--}%
        <hr/>
        %{--<ul class="third-party">--}%
            %{--<li>--}%
                %{--<img src="${resource(dir: 'images/third-party', file: 'mahak_chareity.png')}"/>--}%
            %{--</li>--}%
            %{--<li>--}%
                %{--<img src="${resource(dir: 'images/third-party', file: 'behnam.png')}"/>--}%
            %{--</li>--}%
            %{--<li>--}%
                %{--<img src="${resource(dir: 'images/third-party', file: 'bonyad-koodak.png')}"/>--}%
            %{--</li>--}%
        %{--</ul>--}%
    %{--</div>--}%

    <div class="footer-info">

        <div>
            <ul class="column">
                <li class="bold">
                    <g:message code="rules"/>
                </li>
                <li>
                    <a href="${createLink(controller: 'site', action: 'shoppingRules')}"><g:message
                            code="rules.shoppingRules"/></a>
                </li>
                <li>
                    <a href="${createLink(controller: 'site', action: 'customerRights')}"><g:message
                            code="rules.customerRights"/></a>
                </li>

            </ul>
        </div>

        <div>
            <ul class="column">
                <li class="bold">
                    <g:message
                            code="help.all"/>
                </li>
                <li>
                    <a href="${createLink(controller: 'site', action: 'shoppingSteps')}"><g:message
                            code="buy-help-goldaan"/></a>
                </li>
                <li>
                    <a href="${createLink(controller: 'site', action: 'paymentMethods')}"><g:message
                            code="help.payment"/></a>
                </li>

                %{--<li>--}%
                    %{--<a href="${createLink(controller: 'site', action: 'paymentAndDelivery')}"><g:message--}%
                            %{--code="help.paymentAndDelivery"/></a>--}%
                %{--</li>--}%
            </ul>
        </div>

        <div>
            <ul class="column">
                <li class="bold">
                    <g:message code="footerItems.about"/>
                </li>
                <li>
                    <a href="${createLink(controller: 'site', action: 'aboutUs')}"><g:message
                            code="footerItems.tour"/></a>
                </li>
                <li>
                    <a href="${createLink(controller: 'site', action: 'suppliers')}"><g:message
                            code="help.supplier"/></a>
                </li>
                <li>
                    <a href="${createLink(controller: 'site', action: 'contactUs')}"><g:message
                            code="contact.label"/></a>
                </li>
            </ul>
        </div>
    </div>

    <div>

        <div>
            <ul class="third-party">
                <li>
                    <img src="${resource(dir: 'images/third-party', file: 'bank-mellat.png')}"/>
                </li>
                <li>
                    <img src="${resource(dir: 'images/third-party', file: 'bank-saman.png')}"/>
                </li>
            </ul>
        </div>

    </div>
</div>