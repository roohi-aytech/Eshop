
<div class="btn-group pull-left topNavigationItem link-basket ng-cloak"
     id="link-basket-empty" ng-show="!basket.length">

    <span class="icon-basket icon-0x"><g:message code="basket.empty"/></span>


    <common:link class="btn-shop" controller="basket" action="checkout" https="${false}">
        <g:message code="basket.show"/>
    </common:link>
</div>

<div class="btn-group pull-left topNavigationItem link-basket full ng-cloak"
     id="link-basket" ng-show="basket.length">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#"
       original-title="${message(code: "basket")}">
        <span id="basketCounter" class="counter">{{basketCounter}} <g:message
                code="basket.product"/> {{calculateBasketTotalPrice() | number:0}} <eshop:currencyLabel/></span>
    </a>

    <div id="basketItems" class="dropdown-menu content">
        <div class="inner-content">
            <ul class="scrollable">
                <li ng-repeat="basketItem in basket">
                    <span class="basket-item-image">
                        <img src="<g:createLink controller="image"
                                                action="index"/>/{{basketItem.id}}?type=productModel&wh=50x50"/>
                    </span>
                    <span class="basket-item-count">
                        <g:message code="basket-items-count"/><br/>
                        <input type="text" value="{{basketItem.count}}"
                               onkeyup="updateBasketItemCount('{{basketItem.id}}', this.value)"/>
                    </span>
                    <span class="basket-item-title">
                        <div>{{itemFirstLine(basketItem.name)}}</div>
                        <div>{{itemSecondLine(basketItem.name)}}</div>
                        <div>{{basketItem.realPrice | number:0}} <eshop:currencyLabel/></div>
                        <div><a ng-click="removeFromBasket(basketItem.id)" class="removeBasketItem"><g:message
                                code="basket.items.delete"/></a></div>
                    </span>
                </li>
                <li ng-show="!basket.length"><g:message code="basket.empty"/></li>
            </ul>

            <div class="spacer"></div>

            <div class="total">
                <div>
                    <span>{{basketCounter}}</span>
                    <label><g:message code="basket.items.count"/></label>
                    <span>{{calculateBasketTotalPrice() | number:0}} <eshop:currencyLabel/></span>
                    <label><g:message code="basket.items.price"/></label>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).on('click', '#basketItems', function (e) {
            $(this).parent().addClass('open');
            e.stopPropagation();
            return false;
        });
    </script>

    <sec:ifLoggedIn>
        <common:link class="btn-shop" controller="basket" action="index" https="${false}">
            <g:message code="basket.show"/>
        </common:link>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <button class="btn-shop" onclick="showLoginRegisterDialog()">
            <g:message code="basket.show"/>
        </button>
    </sec:ifNotLoggedIn>
</div>
<div class="hidden" id="registerLoginDialogContent">
    <div>
        <p><g:message code="register-or-login-text"/></p>
        <div class="register-login-actions">
            <div class="reister-comments">
                <p><g:message code="reister-comments"/></p>
                <common:link class="btn btn-success" controller="customer" action="register" https="${false}">
                    <g:message code="register.link"/>
                </common:link>
            </div>
            <div class="login-comments">
                <p><g:message code="login-comments"/></p>
                <common:link class="btn btn-primary" controller="login" action="auth" https="${false}" params="[redirectURL:'/basket/index']">
                    <g:message code="login.link"/>
                </common:link>
            </div>
            <div class="noregister-checkout-comments">
                <p><g:message code="noregister-checkout-comments"/></p>
                <common:link class="btn btn-danger" controller="basket" action="index" https="${false}">
                    <g:message code="enquiry.request.shopping.noRegister"/>
                </common:link>
            </div>
        </div>
    </div>
</div>
<script language="javascript" type="text/javascript">

    $.fn.qtip.zindex = 999999999;
    function showLoginRegisterDialog(){
        $('#link-basket').qtip({
            content: {
                title: '<img src="'+contextRoot+'images/goldaan/logo.png" class="alertlogo">',
                text: $('#registerLoginDialogContent').html(),
                button: 'Close'
            },
            style: {
                classes: 'qtip-bootstrap',
                width: 800
            },
            position: {
                my: 'top left',
                at: 'bottom right'
            },
            show: {
                ready: true,
                event: 'ready',
                effect: function (offset) {
                    $(this).slideDown(100);
                }
            },
            hide: {
                event: ''
            },
            metadata: {
                type: 'html5'
            }
        });
    }
</script>
