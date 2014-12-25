function replaceQueryString(uri, key, value) {
    var re = new RegExp("([?|&])" + key + "=.*?(&|$)", "i");
    separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
        return uri.replace(re, '$1' + key + "=" + value + '$2');
    } else {
        return uri + separator + key + "=" + value;
    }
}

function setLocation(url) {
    if (window.location.protocol == "https:") {
        url = url.replace("http://", "https://");
    } else {
        url = url;
    }
    window.location = url;
}

function lazyLoad(lazeOn) {
//    $(lazeOn).lazy({ bind:'event', visibleOnly: true,threshold:1000,enableThrottle: true,throttle: 250 });
}

function isElementInViewport(el) {
    var rect = el.getBoundingClientRect();
    return (
        rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && /*or $(window).height() */
        rect.right <= (window.innerWidth || document.documentElement.clientWidth) /*or $(window).width() */
        );
}
function RemoveParameterFromUrl(uri, key) {
    var re = new RegExp("([?|&])" + key + "=.*?(&|$)", "i");
    console.log(re);
    //alert("([?|&])" + key + "=.*?(&|$)", "i");
    separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
        return uri.replace(re, '');
    } else {
        return uri + separator + key + "=" + value;
    }
}
function equalHeight(group) {
    group.css('height', 'auto');
    tallest = 0;
    group.each(function () {
        thisHeight = $(this).outerHeight();
        if (thisHeight > tallest) {
            tallest = thisHeight;
        }
    });
    group.height(tallest);
}
function numcheck(event) {
    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
        // Allow: Ctrl+A
        (event.keyCode == 65 && event.ctrlKey === true) ||
        // Allow: home, end, left, right
        (event.keyCode >= 35 && event.keyCode <= 39)) {
        // let it happen, don't do anything
        if (event.keyCode == 13) {
            //
        }
        return;
    } else {
        // Ensure that it is a number and stop the keypress
        if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
            event.preventDefault();
            return false;
        }
    }
}
function empty(obj) {
    for (var prop in obj) {
        if (obj.hasOwnProperty(prop))
            return false;
    }

    return true;
}

function is_object(mixed_var) {
    if (Object.prototype.toString.call(mixed_var) === '[object Array]') {
        return false;
    }
    return mixed_var !== null && typeof mixed_var === 'object';
}

$('#cart-div').on('click', function (e) {
    //$val=$('#show_cart').attr('accesskey');
    //alert($val);
    /*if($val == 'show')
     {
     $('#show_cart').hide();
     $('#show_cart').attr('accesskey','hide');
     e.preventDefault();
     }
     else
     { */
//    $.ajax({
//        url: contextRoot + 'basket/mobileContent',
//        type: 'POST',
//        data: null,
//        beforeSend: function () {
//            $('#cartheader').addClass('cart_loading');
//        },
//        success: function (data) {
//            $(window).scrollTop(0);
//            $('#cartheader').removeClass('cart_loading');
//            $('#order-summ').html(data);
            $("#show_cart").show();
            //$('#show_cart').attr('accesskey','show');
//            return false;
//        },
//        error: function () {
//            alert('Try later.');
//        }
//    });
    return false;
    //}
});
function IsAlphaNumeric(e) {
    var specialKeys = new Array();
    specialKeys.push(8); //Backspace
    specialKeys.push(9); //Tab
    specialKeys.push(46); //Delete
    specialKeys.push(36); //Home
    specialKeys.push(35); //End
    specialKeys.push(37); //Left
    specialKeys.push(39); //Right
    var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
    var ret = ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122) || (specialKeys.indexOf(e.keyCode) != -1 && e.charCode != e.keyCode));
    return ret;
}
function passwordlength(password) {
    return password.length;
}
function validateBulk() {

    var errors = 0;
    if ($.trim($('#name').val()) == '') {
        $('#name').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#name').css('border', '');
    }
    if ($.trim($('#companyName').val()) == '') {
        $('#companyName').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#companyName').css('border', '');
    }

    if ($.trim($('#city').val()) == '') {
        $('#city').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#city').css('border', '');
    }

    if ($.trim($('#country').val()) == '') {
        $('#country').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#country').css('border', '');
    }


    if ($.trim($('#email').val()) == '') {
        $('#email').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var emailValue = $.trim($('#email').val());
        if (filter.test(emailValue) != true) {
            $('#email').css('border-bottom', 'solid 1px red');
            errors = 1;
        } else {
            $('#email').css('border', '');
        }
    }

    if ($.trim($('#mobile').val()) == '') {
        $('#mobile').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        var numberFilter = /^[0-9]+$/;
        var mobile = $.trim($("#mobile").val());
        if (numberFilter.test(mobile)) {
            $("#mobile").css('border', '');
        } else {
            $('#mobile').css('border-bottom', 'solid 1px red');
            errors = 1;
        }

    }
    if ($.trim($('#category').val()) == '') {
        $('#category').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#category').css('border', '');
    }

    if ($.trim($('#connect').val()) == '') {
        $('#connect').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#connect').css('border', '');
    }

    /*if($.trim($('#noofemp').val())  =='') {
     $('#noofemp').css('border', 'solid 1px red');
     errors = 1;
     }else{
     $('#noofemp').css('border', '');
     }
     if($.trim($('#transaction').val())  =='') {
     $('#transaction').css('border', 'solid 1px red');
     errors = 1;
     }else{
     $('#transaction').css('border', '');
     }*/

    if ($.trim($('#reason').val()) == '') {
        $('#reason').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#reason').css('border', '');
    }
    if ($.trim($('#comment').val()) == '') {
        $('#comment').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#comment').css('border', '');
    }
    if ($.trim($('#captcha').val()) == '') {

        $('#captcha').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#captcha').css('border', '');
    }
    if (errors == 1) {
        $("#successdiv").css("display", "none");
        $("#capchaMsg").css("display", "none");
        return false;
    } else {
        bulk_submit();

    }
}
function bulk_submit() {

    var path = root_url + "/site_page/bulkOrder";
    $.ajax({ url: path,
        data: $("#bulkForm").serialize(),
        type: "POST",
        beforeSend: function () {
        },
        success: function (data) {
            if (data == "invalid_capcha") {
                $('#captcha').css('border-bottom', 'solid 1px red');
                //$("#capchaMsg").css("display","block");
                refreshCaptcha();
                $("#captcha").val("");
            } else if (data == 0) {
                alert("Something went wrong with form submission.");
            } else if (data == 1) {
                refreshCaptcha();
                $("#capchaMsg").css("display", "none");
                $('#bulkForm').trigger("reset");
                $("#successdiv").css("display", "block");
            }
        },
        error: function (x, y, z) {
            alert('An error has occurred:\n' + x + '\n' + y + '\n' + z);
        }

    });

}

function refreshCaptcha() {
    var num = Math.floor((Math.random() * 100) + 1);
    jQuery("#captchaimg").attr('src', '/site_page/captcha?q=' + num);
}

function customizeFurnitureValidation() {
    var errors = 0;
    if ($.trim($('#name').val()) == '' || $.trim($('#name').val()) == "Name") {

        $('#name').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#name').css('border', '');
    }
    if ($.trim($('#mobile').val()) == '' || $.trim($('#mobile').val()) == "Mobile Number") {

        $('#mobile').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        var numberFilter = /^[0-9]+$/;
        var mobile = $.trim($("#mobile").val());

        if (!numberFilter.test(mobile)) {

            $('#mobile').css('border-bottom', 'solid 1px red');
            errors = 1;
        } else {
            $('#mobile').css('border', '');

        }
    }
    if ($.trim($('#email').val()) == '' || $.trim($('#email').val()) == "Email ID") {

        $('#email').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        var filter = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        var emailValue = $.trim($('#email').val());
        if (filter.test(emailValue) != true) {

            $('#email').css('border-bottom', 'solid 1px red');
            errors = 1;
        } else {
            $('#email').css('border', '');

        }
    }

    if ($.trim($('#details').val()) == '' || $.trim($('#details').val()) == "Details Of Customization Required") {

        $('#details').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#details').css('border', '');
    }

    /*if($.trim($('#pref_time').val())  =='' || $.trim($('#pref_time').val()) == "Preferred Time To Call") {

     $('#pref_time').css('border', 'solid 1px red');
     errors = 1;
     }else{
     $('#pref_time').css('border', '');
     }*/

    if ($.trim($('#6_letters_code').val()) == '') {

        $('#6_letters_code').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#6_letters_code').css('border', '');
    }

    if (errors == 0) {
        submit_custFur();
    } else {
        $("#successdiv").css("display", "none");
        $("#capchaMsg").css("display", "none");
        return false;
    }

}


function submit_custFur() {

    var path = "/site_page/submit_customise_furniture";

    $.ajax({ url: path,
        data: $("#cust_fur").serialize(),
        type: "POST",
        beforeSend: function () {
        },
        success: function (data) {
            if (data == "invalid_capcha") {
                $('#6_letters_code').css('border-bottom', 'solid 1px red');
                //$("#capchaMsg").css("display","block");
                refreshCaptcha();
                $("#captcha").val("");
            } else if (data == 0) {

                alert("Something went wrong with form submission.");
            } else if (data == 1) {
                refreshCaptcha();
                $('#cust_fur').trigger("reset");
                $("#successdiv").css("display", "block");
                $("#capchaMsg").css("display", "none");
            }
        },
        error: function (x, y, z) {
            alert('An error has occurred:\n' + x + '\n' + y + '\n' + z);
        }

    });

}

function sellWithValidation() {
    var errors = 0;
    if ($.trim($('#company').val()) == '') {
        $('#company').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#company').css('border', '');
    }

    if ($.trim($('#contactPerson').val()) == '') {
        $('#contactPerson').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#contactPerson').css('border', '');
    }
    if ($.trim($('#email').val()) == '') {
        $('#email').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        var filter = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        var emailValue = $.trim($('#email').val());
        if (filter.test(emailValue) != true) {
            $('#email').css('border-bottom', 'solid 1px red');
            errors = 1;
        } else {
            $('#email').css('border', '');
        }
    }
    if ($.trim($('#mobile').val()) == '') {
        $('#mobile').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        var numberFilter = /^[0-9]+$/;
        var mobile = $.trim($("#mobile").val());
        if (numberFilter.test(mobile)) {
            $("#mobile").css('border', '');
        } else {
            $('#mobile').css('border-bottom', 'solid 1px red');
            errors = 1;
        }

    }
    if ($.trim($('#productSell').val()) == '') {
        $('#productSell').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#productSell').css('border', '');
    }
    if ($.trim($('#city').val()) == '') {
        $('#city').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#city').css('border', '');
    }
    if ($.trim($('#businessNeture').val()) == '') {
        $('#businessNeture').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#businessNeture').css('border', '');
    }
    if ($.trim($('#comment').val()) == '') {
        $('#comment').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#comment').css('border', '');
    }
    if ($.trim($('#6_letters_code').val()) == '') {
        $('#6_letters_code').css('border-bottom', 'solid 1px red');
        errors = 1;
    } else {
        $('#6_letters_code').css('border', '');
    }

    if (errors == 0) {
        sellWith_submit();
    } else {
        $("#successdiv").css("display", "none");
        $("#capchaMsg").css("display", "none");
        return false;
    }
}

function sellWith_submit() {


    var path = "/site_page/sellWithUs";
    $.ajax({ url: path,
        data: $("#sell_with").serialize(),
        type: "POST",
        beforeSend: function () {
        },
        success: function (data) {
            if (data == "invalid_capcha") {
                $('#6_letters_code').css('border-bottom', 'solid 1px red');
                //$("#capchaMsg").css("display","block");
                refreshCaptcha();
                $("#6_letters_code").val("");
            } else if (data == 1) {
                refreshCaptcha();
                $('#sell_with').trigger("reset");
                $("#capchaMsg").css("display", "none");
                $("#successdiv").css("display", "block");
            } else if (data == 0) {
                alert("Some thing went wrong with form submission.");
            }
        },
        error: function (x, y, z) {
            alert('An error has occurred:\n' + x + '\n' + y + '\n' + z);
        }

    });

}

function submitTrackOrder() {
    var error = 0;
    if ($("#orderid").val() == "") {
        //$("#orderErr").css('display', 'block');
        $('#orderid').css('border-bottom', 'solid 1px red');
        error = 1;
    } else {
        $('#orderid').css('border', '');
        $("#orderErr").css('display', 'none');
    }

    if ($("#trackMobile").val() == "") {
        //$("#mobileErr").css('display', 'block');
        $('#trackMobile').css('border-bottom', 'solid 1px red');
        error = 1;
    } else {
        $('#trackMobile').css('border', '');
        $("#mobileErr").css('display', 'none');
    }

    if ($("#6_letters_code").val() == "") {
        $("#capchaMsg").css('display', 'none');
        $('#6_letters_code').css('border-bottom', 'solid 1px red');
        //$("#capchaErr").css('display', 'block');
        error = 1;
    } else {
        $('#6_letters_code').css('border', '');
        $("#capchaErr").css('display', 'none');
    }


    if (error == 1) {
        return false;
    } else {
        checkOrderDetails();
        return false;
    }

}

function checkOrderDetails() {

    var path = root_url + "/site_page/trackOrder";
    var orderId = jQuery('#orderid').val();
    var mobile = jQuery('#trackMobile').val();
    var capcha = jQuery('#6_letters_code').val();
    jQuery.ajax({ url: path,
        data: { id: orderId, mobile: mobile, capcha: capcha},
        type: "POST",
        beforeSend: function () {
        },
        success: function (data) {

            if (data == "invalid_capcha") {
                jQuery("#capchaMsg").css("display", "block");
                refreshCaptcha();
                $("#6_letters_code").val("");
            } else if (data == "invalid_id") {
                refreshCaptcha();
                $("#6_letters_code").val("");
                //jQuery('#errorMsg').show();
                //jQuery('#mobileError').hide();
                $('#orderid').css('border-bottom', 'solid 1px red');
            } else if (data == "invalid_mobile") {
                refreshCaptcha();
                $("#6_letters_code").val("");
                //jQuery('#errorMsg').hide();
                //jQuery('#mobileError').show();
                $('#trackMobile').css('border-bottom', 'solid 1px red');

            } else if (data == 1) {
                refreshCaptcha();
                $("#6_letters_code").val("");
                jQuery("#capchaMsg").css("display", "none");
                //jQuery("#errorMsg").css("display","none");
                //jQuery('#mobileError').hide();
                $('#6_letters_code').css('border-bottom', 'solid 1px red');
                orderDetails();
            }

        },
        error: function (x, y, z) {
            alert('An error has occurred:\n' + x + '\n' + y + '\n' + z);
        }

    });
    return false;
}
function orderDetails() {
    var path = root_url + "/site_page/getDetails";
    var orderId = jQuery('#orderid').val();
    jQuery.ajax({ url: path,
        data: "id=" + orderId,
        type: "POST",
        beforeSend: function () {
        },
        success: function (data) {
            if (data) {
                jQuery("#details").html(data);
                $("#orderDetails").fadeIn(50);
            }
        },
        error: function (x, y, z) {
            alert('An error has occurred:\n' + x + '\n' + y + '\n' + z);
        }

    });


}


function checkCaptcha() {

    var capcha = jQuery('#6_letters_code').val();

    if (capcha != "") {
        jQuery.post("/site_page/checkCapcha", { capcha: capcha},
            function (data) {
                if (data == 0) {
                    $('#capt').val(0);
                    refreshCaptcha();
                    $("#6_letters_code").val("");
                    $('#6_letters_code').css('border-bottom', 'solid 1px red');
                    //$("#capchaErr").css('display', 'none');
                    jQuery("#capchaMsg").css("display", "block");
                    //jQuery("#tracksubmit").attr("disabled","disabled");
                } else {
                    $('#capt').val(1);
                    captcha_valid = true;
                    //jQuery("#tracksubmit").removeAttr("disabled");
                    jQuery("#capchaMsg").css("display", "none");
                }
            });
    } else {
        jQuery("#tracksubmit").attr("disabled", "disabled");
    }
}


function createCookie(name, value, days) {
    var expires = "";
    if (days == '-1') {
        expires = 0;
    }
    else if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    }

    document.cookie = name + "=" + value + expires + "; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1, c.length);
        }

        if (c.indexOf(nameEQ) == 0)
            return c.substring(nameEQ.length, c.length);
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name, "", -1);
}

function addSeparatorsNF(nStr, inD, outD, sep) {
    nStr += '';
    var dpos = nStr.indexOf(inD);
    var nStrEnd = '';
    if (dpos != -1) {
        nStrEnd = outD + nStr.substring(dpos + 1, nStr.length);
        nStr = nStr.substring(0, dpos);
    }
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(nStr)) {
        nStr = nStr.replace(rgx, '$1' + sep + '$2');
    }
    return nStr + nStrEnd;
}
