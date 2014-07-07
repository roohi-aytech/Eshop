<div class="footer">

    <div class="footer-container">
        <div class="footer-inner">
            <div class="footer-left">
                <div class="popular-cat">
                    <span class="heading">
                        <g:message code="mostVisiteds.title"/>
                    </span>
                    <eshop:mostVisitedProductTypeList columns="3" rows="14"/>
                </div>

                <div class="popular-links"><span class="heading">
                    <g:message code="topBrands.title"/>
                </span>
                    <eshop:topBrandsList columns="2" rows="14"/>
                </div>
            </div>

            <div class="footer-right">
                <span class="heading">
                    <g:message code="payWithConfidence"/>
                </span>

                <div class="trust_logos ">
                    <div class="payment_options">
                        <img src="${resource(dir: '/images/felfel', file: 'shetab.png')}">
                    </div>

                    <div class="trust_icon">
                        <img src="${resource(dir: '/images/felfel', file: 'enamad.png')}">
                    </div>

                    <div class="clearfix"></div>
                </div>

                <div class="engage">
                    <div class="engage_links">
                        <a class="bon_homie" href="#">
                            <img width="74" height="30"
                                 src="${resource(dir: 'images/felfel', file: 'bon_homie_footer.jpg')}">
                        </a>
                        <a class="write_testi" id="footer_testimonial" href="${createLink(controller: 'testimonial', action: 'write')}"><g:message code="testimonial.write"/></a>
                        <a class="bulk_order" href="#"><g:message code="bulkOrder.link"/></a>
                    </div>

                    <div class="clear_all"></div>
                </div>
            </div>

            <div class="footer-bottom">
                <ul class="footer-links">
                    <a href="${createLink(controller: 'site', action: 'shoppingSteps')}"><g:message
                            code="help.shoppingSteps"/></a> |
                    <a href="${createLink(controller: 'site', action: 'paymentMethods')}"><g:message
                            code="help.payment"/></a> |
                    <a href="${createLink(controller: 'site', action: 'paymentAndDelivery')}"><g:message
                            code="help.paymentAndDelivery"/></a> |
                    <a href="${createLink(controller: 'site', action: 'deliveryTips')}"><g:message
                            code="help.deliveryTips"/></a> |
                    <a href="${createLink(controller: 'site', action: 'shoppingRules')}"><g:message code="rules.shoppingRules"/></a> |
                    <a href="${createLink(controller: 'site', action: 'aboutUs')}"><g:message
                            code="footerItems.tour"/></a>
                </ul>
                <ul class="footer_social">
                    <li class="f_icon"><a target="_blank" href="http://twitter.com/felfel">twitter</a></li>
                    <li class="t_icon"><a target="_blank" href="http://www.facebook.com/felfel">Facebook</a></li>
                    <li class="p_icon"><a target="_blank" href="http://pinterest.com/felfel/">Pinterest</a></li>
                    <li class="y_icon"><a target="_blank" href="http://www.youtube.com/user/felfel"></a></li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

</div>