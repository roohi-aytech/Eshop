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
        function loadAddress(){
            $('#addressLoadingPane').stop().fadeOut(200, function(){
                $('#addressLoadingBar').stop().fadeIn(200, function(){
                    if(addressRequest)
                        addressRequest.abort();
                    addressRequest = $.ajax({
                        url:'${createLink(action: 'checkoutAddress')}',
                        type:'post',
                        data:$('#addressSelectionForm').serialize()
                    }).success(function(response){
                        $('#addressLoadingBar').stop().fadeOut(200, function(){
                            $('#addressLoadingPane').html(response);
                            $('#addressLoadingPane').stop().fadeIn(500);
                        });
                    });
                });
            });
        }

        $(function() {
            $( "#inquiry-accordion" ).accordion({
                heightStyle: "content",
                active: ${currentStep - 1}
        });
        $( ".accordion" ).on( "accordionbeforeactivate", function( event, ui ) {
            if(ui.newHeader.hasClass('disabled')){
                event.preventDefault();
                $.msgGrowl({
                    type: 'warning',
                    sticky: false,
                    title:'',
                    text: '<span style="margin-top:10px;margin-bottom:10px;display:inline-block;">${message(code: 'enquiry.request.completePreviousSteps.description')}</span>',
                    lifetime: 5000
                });
            }

        });
    });
    </script>
</head>

<body>

<div class="page-content">
    <table class="table-simulater" style="width: 100%;">
        <tr>
            <td style="width: 50%;vertical-align: top;">
                <div class="accordion" id="inquiry-accordion">
                    <h3 class=""><span
                            style="background: rgb(206,70,35);"><g:message
                                code="enquiry.request.shopping.step1"/></span><g:message
                            code="enquiry.request.login.title"/></h3>

                    <div>
                        <g:render template="checkout/login"/>
                    </div>

                    <h3 class="${currentStep < 2 ? 'disabled' : ''}"><span
                            style="background: rgb(184,6,76);"><g:message
                                code="enquiry.request.shopping.step2"/></span><g:message
                            code="enquiry.request.shippingAddress.title"/></h3>

                    <div>
                        <g:if test="${customer && !session.checkout_address}">
                            <form id="addressSelectionForm" style="margin-bottom: 0;">
                                <label style="display: inline-block;margin-left:20px;"><g:message
                                        code="enquiry.request.shopping.addressIsSameAsProfile"/></label>
                                <input type="radio" name="addressIsSameAsProfile" value="true"
                                       id="addressIsSameAsProfile" style="margin-top:0;" onchange="loadAddress();"/>
                                <label style="display: inline-block;margin-left:15px;"
                                       for="addressIsSameAsProfile"><g:message code="yes"/></label>
                                <input type="radio" name="addressIsSameAsProfile" value="false"
                                       id="addressIsNotSameAsProfile" style="margin-top:0;" onchange="loadAddress();"/>
                                <label for="addressIsNotSameAsProfile"><g:message code="no"/></label>
                            </form>

                            <div id="addressLoadingBar" style="display: none;margin:10px;">
                                <img src="${resource(dir: 'images', file: 'loading.gif')}"
                                     style="background: white;border:1px solid #eeeeee;border-radius: 4px;padding:4px;"/>
                                <g:message code="waiting"/>
                            </div>

                            <div id="addressLoadingPane" style="margin-top:10px;"></div>
                        </g:if>
                        <g:else>
                            <g:render template="checkout/address"/>
                        </g:else>
                    </div>

                    <h3 class="${currentStep < 3 ? 'disabled' : ''}"><span
                            style="background: rgb(22,114,55);"><g:message
                                code="enquiry.request.shopping.step3"/></span><g:message
                            code="enquiry.request.invoiceInfo.title"/></h3>

                    <div>
                        <g:render template="checkout/invoice_info"/>
                    </div>

                    <h3 class="${currentStep < 4 ? 'disabled' : ''}"><span
                            style="background: rgb(22,116,108);"><g:message
                                code="enquiry.request.shopping.step4"/></span><g:message
                            code="enquiry.request.shippingMethod.title"/></h3>

                    <div>
                        <g:render template="checkout/delivery_method"/>
                    </div>
                </div>
            </td>
            <td style="width: 50%;vertical-align: top;">
                <g:render template="checkout/basket_items"/>
            </td>
        </tr>
    </table>
</div>

</body>
</html>