<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 11/1/14
  Time: 10:08 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='mobile'/>
    <title><g:message code="enquiry.request"/></title>
    <script language="javascript" type="text/javascript">
        var addressRequest;
    </script>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'toggles-light.css')}"/>
    <script language="javascript" type="text/javascript" src="${resource(dir: 'js', file: 'toggles.min.js')}"></script>
</head>

<body>
<div class="clear"></div>

<g:if test="${currentStep == 1}">
    <g:render template="checkout/mobile/login"/>
</g:if>
<g:else>
    <div class="left steps">
        <ul>
            <a href="${session.maxReachedStep >= 4 ? createLink(controller: 'basket', action: 'checkout', params: [currentStep: 4]) : 'javascript:void(0)'}"><li
                    class="shipsto_step ${currentStep == 4 ? 'active' : session.maxReachedStep < 4 ? 'inactive' : ''}"></li></a>
            <a href="${session.maxReachedStep >= 3 ? createLink(controller: 'basket', action: 'checkout', params: [currentStep: 3]) : 'javascript:void(0)'}"><li
                    class="invoice_step ${currentStep == 3 ? 'active' : session.maxReachedStep < 3 ? 'inactive' : ''}"></li></a>
            <a href="${session.maxReachedStep >= 2 ? createLink(controller: 'basket', action: 'checkout', params: [currentStep: 2]) : 'javascript:void(0)'}"><li
                    class="address_step ${currentStep == 2 ? 'active' : session.maxReachedStep < 2 ? 'inactive' : ''}"></li></a>
            <a href="${session.maxReachedStep >= 1.5 ? createLink(controller: 'basket', action: 'checkout', params: [currentStep: 1.5]) : 'javascript:void(0)'}"><li
                    class="cart_step last ${currentStep == 1.5 ? 'active' : session.maxReachedStep < 1.5 ? 'inactive' : ''}"></li></a>
        </ul>
    </div>
    <div class="clear"></div>
</g:else>

<g:if test="${currentStep == 1.5}">
    <g:render template="checkout/mobile/basket_items"/>
</g:if>

<g:if test="${currentStep == 2}">
    <g:if test="${grailsApplication.config.customCheckout}">
        <g:render template="checkout/mobile/address_custom"/>
    </g:if>
    <g:else>
        <g:if test="${customer && !session.checkout_address}">

            <form id="addressSelectionForm" style="margin-bottom: 0;border-bottom:1px dashed #dddddd;padding-bottom:10px;">
                <div style="padding-bottom:10px;padding-top:10px;">
                    <label style="display: inline-block;margin-left:20px;line-height: 18px;"><g:message
                            code="enquiry.request.shopping.addressIsSameAsProfile"/></label>
                </div>


                <div class="addressFilter">
                    <div class="toggle-light"></div>
                </div>

                <div class="clear"></div>
                <script language="javascript" type="text/javascript">
                    $('.toggle-light').toggles({
                        drag: true, // allow dragging the toggle between positions
                        click: true, // allow clicking on the toggle
                        text: {
                            on: '${message(code:'true')}', // text for the ON position
                            off: '${message(code:'false')}' // and off
                        },
                        on: false, // is the toggle ON on init
                        animate: 250, // animation time
                        transition: 'swing', // animation transition,
                        checkbox: null, // the checkbox to toggle (for use in forms)
                        clicker: null, // element that can be clicked on to toggle. removes binding from the toggle itself (use nesting)
                        width: 50, // width used if not set in css
                        height: 20, // height if not set in css
                        type: 'compact' // if this is set to 'select' then the select style toggle will be used
                    }).on('toggle', function (e, active) {
                        $('#addressLoadingPane').stop().fadeOut(200, function () {
                            $('#addressLoadingBar').stop().fadeIn(200, function () {
                                if (addressRequest)
                                    addressRequest.abort();
                                addressRequest = $.ajax({
                                    url: '${createLink(action: 'checkoutAddress')}',
                                    type: 'post',
                                    data: {addressIsSameAsProfile: active}
                                }).success(function (response) {
                                    $('#addressLoadingBar').stop().fadeOut(200, function () {
                                        $('#addressLoadingPane').html(response).stop().fadeIn(500);
                                    });
                                });
                            });
                        });
                    });
                </script>

            </form>

            <div id="addressLoadingBar" style="display: none;margin:10px;">
                <g:message code="waiting"/>
            </div>

            <div id="addressLoadingPane" style="margin-top:10px;">
                <g:render template="checkout/mobile/address"/>
            </div>

        </g:if>
        <g:else>
            <g:render template="checkout/mobile/address"/>
        </g:else>
    </g:else>
</g:if>

<g:if test="${currentStep == 3}">
    <g:if test="${grailsApplication.config.customCheckout}">
        <g:render template="checkout/mobile/invoice_info_custom"/>
    </g:if>
    <g:else>
        <g:render template="checkout/mobile/invoice_info"/>
    </g:else>
</g:if>

<g:if test="${currentStep == 4}">
    <g:render template="checkout/mobile/delivery_method"/>
</g:if>

</body>
</html>