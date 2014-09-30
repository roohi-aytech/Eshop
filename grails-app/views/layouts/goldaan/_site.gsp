<%@ page import="grails.converters.JSON; eshop.ProductService" %>
<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9" ng-app='eshop' xmlns:ng="http://angularjs.org" id="ng-app"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js" ng-app='eshop'><!--<![endif]-->
<head>
    <title><g:layoutTitle/></title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <canonical:show/>
    <meta name="robots" content="index, follow"/>
    <meta name="viewport" content="width=device-width, user-scalable=yes">

    <meta name="google-site-verification" content="mH1bB8PXNP_Qn0W29M_XLwI2aFf5EuHhkPRfTJCEW8M"/>
    <link rel="shortcut icon" href="${resource(dir: 'images/goldaan', file: 'fav-icon.ico')}" type="image/x-icon">
    <!--[if lte IE 8]>
    <script async language="javascript" src="${resource(dir: 'js', file: 'ieFix.js')}" type="text/javascript"></script>
    <script async language="javascript" src="${resource(dir: 'js', file: 'json3.js')}" type="text/javascript"></script>
    <script>
        document.createElement('ng-include');
        document.createElement('ng-pluralize');
        document.createElement('ng-view');

        // Optionally these for CSS
        document.createElement('ng:include');
        document.createElement('ng:pluralize');
        document.createElement('ng:view');
      </script>
    <![endif]-->
    <g:javascript  library="jquery"/>
    %{--<link rel="stylesheet" href="${resource(dir: 'css/templates', file: 'firstPage.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'siteUI.css')}" type="text/css">--}%
    <link async rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap.min.css', plugin: 'rapid-grails')}"/>
    <link async rel="stylesheet"
          href="${resource(dir: 'bootstrap/css', file: 'bootstrap-responsive.min.css', plugin: 'rapid-grails')}"/>
    <link async rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-amazon.css')}"/>
    <link async rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-rtl.css', plugin: 'rapid-grails')}"/>
    %{--<link href="${resource(dir: 'css', file: 'siteUI.css')}" rel="stylesheet" type="text/css"/>--}%
    <link async href="${resource(dir: 'css', file: 'site.css')}" rel="stylesheet" type="text/css"/>
    <link async href="${resource(dir: 'css', file: 'jquery.rollbar.css')}" rel="stylesheet" type="text/css"/>
    <link async href="${resource(dir: 'css', file: 'jquery.msgGrowl.css')}" rel="stylesheet" type="text/css"/>
    <link async href="${resource(dir: 'css', file: 'jquery.tipsy.css')}" rel="stylesheet" type="text/css"/>
    <link async rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'jquery.qtip.css')}"/>


    <r:layoutResources/>
    <script async type="text/javascript"
            src="${resource(plugin: 'rapid-grails', dir: 'js', file: 'angular.min.js')}"></script>

    <script type="text/javascript">
        var CUSTOMIZE_TEXTFIELD = 1;

        var FancyboxI18nNext = 'Next';
        var FancyboxI18nPrev = 'Previous';
        var FancyboxboxI18nClose = 'Close';
        var added_to_wishlist = 'Added to your wishlist.';
        var ajax_allowed = true;
        var ajaxsearch = true;
//        var baseDir = 'http://transformer.sunnytoo.com/';
//        var baseUri = 'http://transformer.sunnytoo.com/';
        var blocksearch_type = 'top';
        var comparator_max_item = 3;
        var comparedProductsIds = [];
        var contentOnly = false;
        var customizationIdMessage = 'Customization #';
        var delete_txt = 'Delete';
        var freeProductTranslation = 'Free!';
        var freeShippingTranslation = 'Free shipping!';
        var generated_date = 1402896138;
        var id_lang = 1;
//        var img_dir = 'http://transformer.sunnytoo.com/themes/transformer/img/';
        var instantsearch = false;
        var isGuest = 0;
        var isLogged = 0;
        var loggin_required = 'You must be logged in to manage your wishlist.';
        var max_item = 'You cannot add more than 3 product(s) to the product comparison';
        var min_item = 'Please select at least one product';
//        var mywishlist_url = 'http://transformer.sunnytoo.com/en/module/blockwishlist/mywishlist';
        var page_name = 'index';
        var priceDisplayMethod = 1;
        var priceDisplayPrecision = 2;
        var quickView = true;
        var quickViewCaller = null;
        var removingLinkText = 'remove this product from my cart';
        var roundMode = 2;
//        var search_url = 'http://transformer.sunnytoo.com/en/search';
        var static_token = '5f2d2499e3a3ae4c0e39accff9ed1f04';
        var token = 'fc8b2e444c99c8d5fe27b8e61e03e9b2';
        var usingSecureMode = false;
        var wishlistProductsIds = false;
        var wrongemailaddress_blocknewsletter = 'Invalid email address.';
        var st_sticky_menu = 1;
    </script>
    <script type="text/javascript">
        var cities=[];
        var curDate=${new Date().getTime()}
        var basketCounter = ${session.getAttribute("basketCounter") ?: 0};
        var basket = ${(session.getAttribute("basket")?: []) as grails.converters.JSON};
        var compareListCounter = ${session.getAttribute("compareListCounter") ?: 0};
        var compareList = ${(session.getAttribute("compareList")?: []) as grails.converters.JSON};
        var golbonDiscount=${session.getAttribute("bonDiscount")?:0}
        var deliveryMethod='${session.getAttribute("deliveryMethod")?:''}'
        var deliveryMethodInfo=${(eshop.delivery.DeliveryMethod.get(session.getAttribute("deliveryMethod")?:'0') as grails.converters.JSON)?:'{}'};

        var deliveryPrice=${session.getAttribute("deliveryPrice")?:'-1'}
        var sendFactor=${session.getAttribute("sendFactor")?:false}

        var paymentType='${session.getAttribute("paymentType")?:'online'}'
        var deliveryAddress='${session.getAttribute("deliveryAddress")?:''}'
        var deliveryAddressLine='${session.getAttribute("deliveryAddressLine")?:''}'
        var deliveryCity='${session.getAttribute("deliveryCity")?:''}'
        var deliveryName='${session.getAttribute("deliveryName")?:''}'
        var deliveryPhone='${session.getAttribute("deliveryPhone")?:''}'
        var deliveryDate='${session.getAttribute("deliveryDate")?:''}'
        var deliveryDate_hour='${session.getAttribute("deliveryDate_hour")?:''}'
        var deliveryDate_minute='${session.getAttribute("deliveryDate_minute")?:''}'
        var callBeforeSend='${session.getAttribute("callBeforeSend")?:'true'}'
        var buyerPhone='${session.getAttribute("buyerPhone")?:''}'
        var buyerEmail='${session.getAttribute("buyerEmail")?:''}'

        <sec:ifLoggedIn>
        <% def priceService = grailsApplication.classLoader.loadClass('eshop.PriceService').newInstance() %>
        <% def accountingService = grailsApplication.classLoader.loadClass('eshop.AccountingService').newInstance() %>
        <g:set var="wishList" value="${eshop.Customer.findByUsername(sec.username())?.wishList?.collect{[id:it.id, title: it.toString(), price: priceService.calcProductPrice(it.id).showVal]}?:[]}"/>
        var buyerName='${session.getAttribute("buyerName")?:"${eshop.Customer.findByUsername(sec.username())?.toString()}"}'
        var customerAccountValue=${accountingService.calculateCustomerAccountValue(eshop.Customer.findByUsername(sec.username()))};
        var wishListCounter = ${wishList? wishList.count {it}: 0};
        var wishList = ${(wishList?: []) as grails.converters.JSON};
        var wishListEnabled = true;
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
        var buyerName='${session.getAttribute("buyerName")?:""}'
        var customerAccountValue=-1;
        var wishListCounter = 0;
        var wishList = ${[] as grails.converters.JSON};
        var wishListEnabled = false;
        var wishListNotEnabledMessage = '${message(code:'wishList.notEnabled.message')}';
        </sec:ifNotLoggedIn>
        var contextRoot = "${createLink(uri: '/')}";
        var mainSlides = [];
        var mainSlideSize = 0;
        var specialSaleSlides = [];
        var specialSaleSlideSize = 0;
        var mainSlideSize = 0;
        var mainSlideWidth = 0;
        var mainSlideHeight = 0;
        var specialSaleSlideWidth = 0;
        var specialSaleSlideHeight = 0;
        var specialSaleSlideSize = 0;

        var searchAutoCompleteUrl = '${createLink(controller: 'site', action: 'searchAutoComplete')}';
        $(document).ready(function(){
            $('.basket-cell').show();
        });

        var selectedAddedValues = [${selectedAddedValues.collect{it.id}.join(',')}];
        $(document).ready(function () {
            $('#selectedAddedValues').val(selectedAddedValues.toString());
        });
        function addToBasket(id, name, price) {
            var scope = angular.element(document.getElementById('main-container')).scope();
            scope.selectedAddedValues = selectedAddedValues;
            scope.addToBasket(id, name, price, selectedAddedValues);
        }

        function addOrRemoveAddedValue(item) {

            var i = selectedAddedValues.indexOf(parseInt($(item).val()));
            if (i != -1)
                selectedAddedValues.splice(i, 1);
            else
                selectedAddedValues[selectedAddedValues.length] = parseInt($(item).val());

            $('#selectedAddedValues').val(selectedAddedValues.toString());
            var $form = $("#productVariationForm");
            var serializedData = $form.serialize();
            $('#product-card').html('${message(code: 'waiting')}');
            angular.element(document.getElementById('main-container')).scope().reloadProductCart("${createLink(controller: "site", action: "productCard")}", serializedData, $('#product-card'));
        }
        function suggestFriend(id){
            $('#suggest-container #productId').val(id);
            $('#suggest-container #yourName').val('');
            $('#suggest-container #friendsEmail').val('');
            $('#productThumbnail_'+id).qtip({
                content:$('#suggest-container').html(),
                position: {
                    my: 'top middle',
                    at: 'bottom middle'
                },
                style: {
                    classes: 'qtip-bootstrap qtip-suggestion'
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
        function sendSuggestion(){
            $.ajax({
                url:'<g:createLink controller="site" action="suggestFriend" />',
                data:{
                    id:$('.qtip-suggestion #productId').val(),
                    name:$('.qtip-suggestion #yourName').val(),
                    email:$('.qtip-suggestion #friendsEmail').val()
                },
                type:'post'
            }).success(function(){
                $('#productThumbnail_'+$('#productId').val()).qtip('destroy');
            })
        }
    </script>

    %{--<script language="javascript" src="${resource(dir: 'js', file: 'jquery.mousewheel.js')}"--}%
            %{--type="text/javascript"></script>--}%
    %{--<script language="javascript" src="${resource(dir: 'js', file: 'jquery.msgGrowl.js')}"--}%
            %{--type="text/javascript"></script>--}%

    <script async language="javascript" src="${resource(dir: "js/${grailsApplication.config.eShop.instance}", file: 'eshopCtrl.js')}" type="text/javascript"></script>
    %{--<script language="javascript" src="${resource(dir: 'js', file: 'jquery.tpl_layout1.1.6.min.js')}"--}%
            %{--type="text/javascript"></script>--}%
    <g:layoutHead/>
    <link async href="${resource(dir: 'css', file: 'goldaan.css')}" rel="stylesheet" type="text/css"/>
    %{--<script language="javascript" src="${resource(dir: 'js', file: 'jquery.watch.js')}" type="text/javascript"></script>--}%
    %{--<script language="javascript" src="${resource(dir: 'js', file: 'jquery.hoverIntent.js')}"--}%
            %{--type="text/javascript"></script>--}%

    <script async language="javascript" src="${resource(dir: 'js', file: 'search-auto-complete.js')}"
            type="text/javascript"></script>
    <g:javascript src="goldaan/goldaan.js"/>
    %{--<script language="javascript" src="${resource(dir: 'js', file: 'jquery.maskinput.js')}"--}%
    <script async language="JavaScript" type="text/javascript"
            src="${resource(dir: 'js', file: 'jquery.sticky-kit.js')}"></script>
    <script async language="javascript" src="${resource(dir: 'js', file: 'jquery.raty.js')}" type="text/javascript"></script>
    <script async src="${resource(dir: 'js', file: 'jquery.form.js', plugin: 'rapid-grails')}" language="javascript"
            type="text/javascript"></script>
    <script async language="javascript" src="${resource(dir: 'js', file: 'jquery.rollbar.js')}"
            type="text/javascript"></script>
    <script async language="javascript" src="${resource(dir: 'js', file: 'common.js')}" type="text/javascript"></script>
    <script async language="javascript" src="${resource(dir: 'js', file: 'jquery.tipsy.js')}" type="text/javascript"></script>
    <script async type="text/javascript" language="javascript" src="${resource(dir: 'js', file: 'jquery.qtip.js')}"></script>
    <script async type="text/javascript" language="javascript" src="${resource(dir: 'js', file: 'imagesloaded.js')}"></script>

    <link async href="${resource(dir: 'js/bootstrapcss', file: 'bootstrap-datepicker.min.css')}" rel="stylesheet" type="text/css"/>
    <script async type="text/javascript" language="javascript" src="${resource(dir: 'js/bootstrapcss', file: 'bootstrap-datepicker.min.js')}"></script>
    <script async type="text/javascript" language="javascript" src="${resource(dir: 'js/bootstrapcss', file: 'bootstrap-datepicker.fa.min.js')}"></script>

</head>

<body id="index" class="index hide-left-column hide-right-column lang_en " ng-controller="eshopCtrl">
<div id="suggest-container" class="hide">
    <div>
        <g:message code="please.enter.your.name"/>
    </div>
    <input type="hidden" id="productId"/>
    <div>
        <input type="text" placeholder="<g:message code="your.name" />" id="yourName">
    </div>
    <div>
        <input type="text" placeholder="<g:message code="friends.email" />" id="friendsEmail">
    </div>
    <div>
        <input type="button" class="btn btn-success" onclick="sendSuggestion()" value="<g:message code="submit.suggestion" />"/>
    </div>
</div>
<g:render template="/layouts/${grailsApplication.config.eShop.instance}/alexa"/>


<table id="main-container" class="table-simulated">
    <tr>
        <td id="body-container">
            <g:render template="/layouts/${grailsApplication.config.eShop.instance}/header" key="${sec.username()}"/>
            <div id="body-container-slider">
            </div>
            <div id="body-container-inner">
                <div id="body-size-watch">
                    <g:layoutBody/>
                </div>
            </div>

            %{--<g:render template="/inquired_payments"/>--}%
            <r:layoutResources/>
            <script async language="javascript" src="${resource(dir: 'js', file: 'jquery.lazyLoad.js')}" type="text/javascript"></script>
        </td>
    </tr>
    <tr>
        <td class="totalFooter">
            <g:render template="/layouts/${grailsApplication.config.eShop.instance}/footer"/>
        </td>
    </tr>
</table>
%{--<script src="${resource(dir: 'bootstrap/js', file: 'bootstrap.min.js', plugin: 'rapid-grails')}"></script>--}%

</body>
</html>
