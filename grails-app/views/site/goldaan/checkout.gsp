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
        function setDeliveryPrice(element, name, price, hidePrice) {
            if (element.checked) {
                if(hidePrice){
                    $('#price').val(price);

                    var scope = angular.element(document.getElementById('main-container')).scope();
                    scope.deliveryPrice = name;
                    scope.$apply();
                }
                else {
                    $('#price').val(price);
                    var scope = angular.element(document.getElementById('main-container')).scope();
                    scope.deliveryPrice = price;
                    scope.$apply();
                    $('.deliveryMethodList b').removeClass('selected');
//                    $(element).parent().next('td').next('td').find('b').addClass('selected');
                }
            }
        }
        function nextstep(){

        }
        function showAddedValueDialog(obj,addedValueTypeId,productId){
            $.ajax({ url: '<g:createLink action="addedValueSelect" controller="site" />',data:{addedValueTypeId:addedValueTypeId,productId:productId}})
            .done(function (html) {
                $('#'+obj.id).qtip({
                    content: {
                        title: '<g:img dir="/images/goldaan" file="logo.png" class="alertlogo" />',
                        text: html,
                        button: 'Close'
                    },
                    style: {
                        classes: 'qtip-bootstrap',
                        width: 400
                    },
                    position: {
                        my: 'top center',
                        at: 'bottom center'
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
        });
    </script>
</head>

<body>

<div class="page-content" style="margin-top: 20px;">
    <g:if test="${session.getAttribute("basket")?.size() > 0}">
        <div class="row">
            <div class="span10">
                <div class="steps">
                    <hr/>
                    <div class="step step1 ${currentStep==1?'selected':''}">1. <g:message code="basket.content"/></div>
                    <div class="step step2 ${currentStep==2?'selected':''}">2. <g:message code="basket.receipt"/></div>
                    <div class="step step3 ${currentStep==3?'selected':''}">3. <g:message code="basket.delivery"/></div>
                    <div class="step step4 ${currentStep==4?'selected':''}">4. <g:message code="basket.buyerinfo"/></div>
                </div>
                <div class="step-content ${currentStep==1?'selected':''}">
                    <div class="step-title">
                        <span><g:message code="basket.content"/></span>
                    </div>
                    <g:render template="/site/goldaan/templates/basket_items"/>
                </div>
                <div class="step-content ${currentStep==2?'selected':''}">
                    <div class="step-title">
                        <span><g:message code="basket.receipt"/></span>
                    </div>
                    ad
                </div>
                <div class="step-content ${currentStep==3?'selected':''}">
                    <div class="step-title">
                        <span><g:message code="basket.delivery"/></span>
                    </div>
                    adoi
                </div>
                <div class="step-content ${currentStep==4?'selected':''}">
                    <div class="step-title">
                        <span><g:message code="basket.buyerinfo"/></span>
                    </div>
                    adioi
                </div>
            </div>
            <div class="span4 vertical-align-top">
                <div class="factor">
                    <div class="factor-title"><g:message code="factor-title" /></div>
                    <g:render template="/site/goldaan/templates/checkout_price"/>
                </div>
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