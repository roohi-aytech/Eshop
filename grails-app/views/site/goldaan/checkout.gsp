<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title><g:message code="enquiry.request"/></title>
    <meta name="layout" content="site">
    <link href="${resource(dir: 'css', file: 'jquery.ui.accordion.css')}" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.ui.accordion.js')}"></script>
    <script language="javascript" type="text/javascript">
        var addressRequest;
        function loadAddress() {
            $('#addressLoadingPane').stop().fadeOut(200, function () {
                $('#addressLoadingBar').stop().fadeIn(200, function () {
                    if (addressRequest)
                        addressRequest.abort();
                    addressRequest = $.ajax({
                        url: '${createLink(action: 'checkoutAddress')}',
                        type: 'post',
                        data: $('#addressSelectionForm').serialize()
                    }).success(function (response) {
                                $('#addressLoadingBar').stop().fadeOut(200, function () {
                                    $('#addressLoadingPane').html(response);
                                    $('#addressLoadingPane').stop().fadeIn(500);
                                });
                            });
                });
            });
        }
        function setDeliveryPrice(element, name, price, hidePrice,title) {
            if (element.checked) {
                if(hidePrice){
                    $('#price').val(price);

                    var scope = angular.element(document.getElementById('main-container')).scope();
                    scope.deliveryPrice = name;
                    scope.deliveryTitle = title;

                    scope.$apply();
                }
                else {
                    $('#price').val(price);
                    var scope = angular.element(document.getElementById('main-container')).scope();
                    scope.deliveryPrice = price;
                    scope.deliveryTitle = title;
                    scope.$apply();
                    $('.deliveryMethodList b').removeClass('selected');
//                    $(element).parent().next('td').next('td').find('b').addClass('selected');
                }
            }
        }
        function selectAddedValueInstance(){
            $('#addedValueSelect').ajaxSubmit({
                success:function(res){
                    basket=res;
                    $('.qtip-added-value').qtip('destroy');
                    var scope = angular.element(document.getElementById('main-container')).scope();
                    scope.basket = basket;
                    scope.$apply();
                    $('.added-value-instance').qtip('destroy');
                    $('.added-value-instance').each(function() {
                        $(this).qtip({
                            content: $(this).find('.added-value-qtip').html(),
                            position: {
                                my: 'top right',
                                at: 'bottom center'
                            }
                        });
                    });
                }
            })
        }
        function nextstep(){

        }

        function showAddedValueDialog(obj,addedValueTypeId,productId,basketItemId){
            $('.qtip-added-value').qtip('destroy');
            $.ajax({ url: '<g:createLink action="addedValueSelect" controller="basket" />',data:{addedValueTypeId:addedValueTypeId,productId:productId,basketItemId:basketItemId}})
            .done(function (html) {
                $('#'+obj.id).qtip({
                    content: {
                        title: '<g:img dir="/images/goldaan" file="logo.png" class="alertlogo" />',
                        text: html,
                        button: 'Close'
                    },
                    style: {
                        classes: 'qtip-bootstrap qtip-added-value',
                        width: 700
                    },
                    position: {
                        my: 'top right',
                        at: 'bottom left'
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
            });

        }
        function selectAddedValue(addedValueId){
            $('#addedValueId').val(addedValueId);
            $('.added-value-content').removeClass('selected');
            $('#addedValue'+addedValueId).addClass('selected');
        }
        $(function () {

            $("#inquiry-accordion").on("accordionbeforeactivate", function (event, ui) {
                if (ui.newHeader.hasClass('disabled')) {
                    event.preventDefault();
                    $.msgGrowl({
                        type: 'warning',
                        sticky: false,
                        title: '',
                        text: '<span style="margin-top:10px;margin-bottom:10px;display:inline-block;">${message(code: 'enquiry.request.completePreviousSteps.description')}</span>',
                        lifetime: 5000
                    });
                }

            });
            $('.added-value-instance').each(function() {
                $(this).qtip({
                    content: $(this).find('.added-value-qtip').html(),
                    position: {
                        my: 'top right',
                        at: 'bottom center'
                    }
                });
            });
        });
    </script>
</head>

<body>

<div class="page-content" style="margin-top: 20px;">
    <g:if test="${session.getAttribute("basket")?.size() > 0}">
        <div class="row">
            <div class="span10">
                <div class="steps">
        <sec:ifLoggedIn>
            <g:set var="trclass" value="stp3"/>
        </sec:ifLoggedIn>
                    <hr/>
                    <div onclick="changeStep(1)" class="step step1 ${trclass} ${currentStep==1?'selected':''}">1. <g:message code="basket.content"/></div>
                    <div onclick="changeStep(2)" class="step step2 ${trclass} ${currentStep==2?'selected':''}">2. <g:message code="basket.receipt"/></div>
                    <div onclick="changeStep(3)" class="step step3 ${trclass} ${currentStep==3?'selected':''}">3. <g:message code="basket.delivery"/></div>
                    <sec:ifNotLoggedIn>
                        <div onclick="changeStep(4)" class="step step4 ${trclass} ${currentStep==4?'selected':''}">4. <g:message code="basket.buyerinfo"/></div>
                    </sec:ifNotLoggedIn>
                </div>
                <div class="step-content step1 ${currentStep==1?'selected':''}">
                    <div class="step-title">
                        <span><g:message code="basket.content"/></span>
                    </div>
                    <g:render template="/site/goldaan/templates/basket_items"/>
                </div>
                <div class="step-content step2 ${currentStep==2?'selected':''}">
                    <div class="step-title">
                        <span><g:message code="basket.receipt"/></span>
                    </div>
                    <g:render template="/site/goldaan/templates/reciept"/>
                </div>
                <div class="step-content step3 ${currentStep==3?'selected':''}">
                    <div class="step-title">
                        <span><g:message code="basket.delivery"/></span>
                    </div>
                    <g:render template="/site/goldaan/templates/deliveryAddress"/>
                </div>
                <sec:ifNotLoggedIn>
                <div class="step-content step4 ${currentStep==4?'selected':''}">
                    <div class="step-title">
                        <span><g:message code="basket.buyerinfo"/></span>
                    </div>
                    <g:render template="/site/goldaan/templates/buyerInfo"/>
                </div>
                </sec:ifNotLoggedIn>
            </div>
            <div class="span4 vertical-align-top">
                <div class="factor">
                    <div class="factor-title"><g:message code="factor-title" /></div>
                    <g:render template="/site/goldaan/templates/checkout_price"/>
                </div>

                <div ng-show="golbonDiscount>0" class="discount-golbon">
                    <div class="discount-title"><g:message code="discount-title" /></div>
                    <br/>
                    <g:message code="with-this-buy-get-golbon" args="${["{{golbonDiscount}} ${eshop.currencyLabel()}"]}"/>
            </div>
            </div>
        </div>
        <div id="confirm-dialog" class="hidden">
            <div class="confirm-dialog">
                <table class="table table-striped table-bordered">
                    <tr>
                        <td>
                            <g:message code="buyer-name"/>
                        </td>
                        <td>
                            <g:message code="buyer-phone" />
                        </td>
                        <td>
                            <g:message code="buyer-email" />
                        </td>
                        <td>
                            <g:message code="payment.type" />
                        </td>
                        <td>
                            <g:message code="deliveryMethod" />
                        </td>
                    </tr>
                    <tr>
                        <td>{{buyerName}}</td>
                        <td>{{buyerPhone}}</td>
                        <td>{{buyerEmail}}</td>
                        <td><span ng-show="paymentType=='online'"><g:message code="payment.types.online" /></span><span ng-show="paymentType=='payInPlace'"><g:message code="payment.types.payInPlace" /></span></td>
                        <td>{{deliveryTitle}}</td>
                    </tr>
                    <tr>
                        <td>
                            <g:message code="delivery-person" />
                        </td>
                        <td>
                            <g:message code="delivery-phone" />
                        </td>
                        <td colspan="3">
                            <g:message code="delivery-address" />
                        </td>
                    </tr>
                    <tr>
                        <td>{{deliveryName}}</td>
                        <td>{{deliveryPhone}}</td>
                        <td colspan="3">{{deliveryAddressLine}}</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span ng-show="callBeforeSend"><g:message code="call-before-send"/></span>
                            <span ng-hide="callBeforeSend"><g:message code="send-surprise"/></span>
                        </td>
                        <td colspan="3">
                            <div ng-show="sendFactor">
                                <g:message code="sendFactorWith" />
                            </div>
                        </td>
                    </tr>
                </table>
                <div>
                    <table class="table table-striped table-bordered">
                        <tr>
                            <th class="small"><g:message code="index" /></th>
                            <th class=""><g:message code="product.title" /></th>
                            <th class="small"><g:message code="seller-goldaan"/></th>
                            <th class="small"><g:message code="orderItem.unitPrice"/> (<eshop:currencyLabel/>)</th>
                            <th class="small"><g:message code="count"/></th>
                            <th class="small"><g:message code="basket.totalPrice"/> (<eshop:currencyLabel/>)</th>
                        </tr>
                        <tr ng-repeat="basketItem in basket" class="basketItemReceipt">
                            <td class="small">{{$index+1}}</td>
                            <td>
                                <span class="name">
                                    {{itemFirstLine(basketItem.name)}}/<span class="smaller">{{itemSecondLine(basketItem.name)}}</span>
                                    <span ng-repeat="addedValueInstance in basketItem.selectedAddedValueInstances" class="addedValue">
                                        <span class="plus"> +</span>{{addedValueInstance.title}}
                                    </span>
                                </span>
                            </td>
                            <td class="small"><span class="smaller">{{itemThirdLine(basketItem.name)}}</span></td>
                            <td class="small"><span class="price"><b>{{basketItem.realPrice | number:0}}</b> </span></td>
                            <td class="small"><span class="count">{{basketItem.count}}</span></td>
                            <td class="small"><span class="price"><b>{{basketItem.realPrice * basketItem.count | number:0}}</b></span></td>

                        </tr>
                        <tr>
                            <td colspan="3">

                            </td>
                            <td colspan="3" >
                                <div>
                                    <span class="reciept-price-label" ><g:message code="basket.totalPrice"/>:</span>
                                    <span class="totalPrice-reciept">{{calculateBasketTotalPrice() | number:0}}</span> <eshop:currencyLabel/>
                                </div>
                                <div ng-show="deliveryPrice > 0">
                                    <span class="reciept-price-label" ><g:message code="deliveryPrice"/>:</span>
                                    <span>
                                        <b><span class="totalPrice-reciept">{{deliveryPrice | number:0}}</span></b> <eshop:currencyLabel/>
                                    </span>
                                </div>
                                <div ng-show="customerAccountValue > 0 && useGolBon">
                                    <span class="reciept-price-label" ><g:message code="basket.paycurgolbol"/>:</span>
                                    <span>
                                        <b><span class="totalPrice-reciept">{{customerAccountValue | number:0}}-</span></b> <eshop:currencyLabel/>
                                    </span>
                                </div>
                                <div>
                                    <span class="reciept-price-label" ><g:message code="basket.totalPayablePrice"/>:</span>
                                    <span class="totalPrice-reciept">{{calculateBasketPayablePrice() | number:0}}</span> <eshop:currencyLabel/>
                                </div>
                        </tr>
                    </table>

                </div>
                <g:form name="finalizebasket" controller="order" action="finalizeOrder" method="post">
                    <g:submitButton name="submit" class="btn btn-success" value="${message(code:"submit")}"/>
                    <div class="btn btn-danger" onclick="$('.factor').qtip('destroy')"><g:message code="cancel"/> </div>
                </g:form>
            </div>
        </div>

        %{--<table class="table-simulater" style="width: 100%;">--}%
            %{--<tr>--}%
                %{--<td style="width: 50%;vertical-align: top;">--}%
                    %{--<div class="accordion" id="inquiry-accordion">--}%
                        %{--<h3 class=""><span--}%
                                %{--style="background: rgb(206,70,35);"><g:message--}%
                                    %{--code="enquiry.request.shopping.step1"/></span><g:message--}%
                                %{--code="enquiry.request.login.title"/></h3>--}%

                        %{--<div>--}%
                            %{--<g:render template="/basket/checkout/login"/>--}%
                        %{--</div>--}%

                        %{--<h3 class="${currentStep < 2 ? 'disabled' : ''}"><span--}%
                                %{--style="background: rgb(184,6,76);"><g:message--}%
                                    %{--code="enquiry.request.shopping.step2"/></span><g:message--}%
                                %{--code="enquiry.request.shippingAddress.title"/></h3>--}%

                        %{--<div>--}%
                            %{--<g:if test="${customer && !session.checkout_address}">--}%
                                %{--<form id="addressSelectionForm" style="margin-bottom: 0;">--}%
                                    %{--<label style="display: inline-block;margin-left:20px;"><g:message--}%
                                            %{--code="enquiry.request.shopping.addressIsSameAsProfile"/></label>--}%
                                    %{--<input type="radio" name="addressIsSameAsProfile" value="true"--}%
                                           %{--id="addressIsSameAsProfile" style="margin-top:0;" onchange="loadAddress();"/>--}%
                                    %{--<label style="display: inline-block;margin-left:15px;"--}%
                                           %{--for="addressIsSameAsProfile"><g:message code="yes"/></label>--}%
                                    %{--<input type="radio" name="addressIsSameAsProfile" value="false"--}%
                                           %{--id="addressIsNotSameAsProfile" style="margin-top:0;"--}%
                                           %{--onchange="loadAddress();"/>--}%
                                    %{--<label for="addressIsNotSameAsProfile" style="display: inline-block;"><g:message code="no"/></label>--}%
                                %{--</form>--}%

                                %{--<div id="addressLoadingBar" style="display: none;margin:10px;">--}%
                                    %{--<img src="${resource(dir: 'images', file: 'loading.gif')}"--}%
                                         %{--style="background: white;border:1px solid #eeeeee;border-radius: 4px;padding:4px;"/>--}%
                                    %{--<g:message code="waiting"/>--}%
                                %{--</div>--}%

                                %{--<div id="addressLoadingPane" style="margin-top:10px;"></div>--}%
                            %{--</g:if>--}%
                            %{--<g:else>--}%
                                %{--<g:render template="/basket/checkout/address"/>--}%
                            %{--</g:else>--}%
                        %{--</div>--}%

                        %{--<h3 class="${currentStep < 3 ? 'disabled' : ''}"><span--}%
                                %{--style="background: rgb(22,114,55);"><g:message--}%
                                    %{--code="enquiry.request.shopping.step3"/></span><g:message--}%
                                %{--code="enquiry.request.invoiceInfo.title"/></h3>--}%

                        %{--<div>--}%
                            %{--<g:render template="/basket/checkout/invoice_info"/>--}%
                        %{--</div>--}%

                        %{--<h3 class="${currentStep < 4 ? 'disabled' : ''}"><span--}%
                                %{--style="background: rgb(22,116,108);"><g:message--}%
                                    %{--code="enquiry.request.shopping.step4"/></span><g:message--}%
                                %{--code="enquiry.request.shippingMethod.title"/></h3>--}%

                        %{--<div id="delivery-methods-container">--}%
                            %{--<g:render template="/basket/checkout/delivery_method"/>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</td>--}%
                %{--<td style="width: 50%;vertical-align: top;">--}%

                %{--</td>--}%
            %{--</tr>--}%
        %{--</table>--}%
    </g:if>
    <g:else>
        <div class="info">
            <div>
                <g:message code="basket.empty"/>
            </div>
        </div>
    </g:else>
</div>

</body>
</html>