<%@ page import="grails.converters.JSON; eshop.City" %>
<script language="javascript" type="text/javascript">

    function validatePerson1() {
        $('#person1ValidationMessage').html('');

        var person = $('#person1').val();
        if (!person || person == '') {
            $('#person1ValidationMessage').html('${message(code: 'shippingAddress.person.notEmpty')}');
            return false;
        }
        return true;
    }
    function validateTelephone1() {
        $('#telephone1ValidationMessage').html('');

        var telephone = $('#telephone1').val();
        if (!telephone || telephone == '') {
            $('#telephone1ValidationMessage').html('${message(code: 'shippingAddress.telephone.notEmpty')}');
            return false;
        }
        return true;
    }

    function validateAddressLine1() {
        $('#addressLine1ValidationMessage').html('');

        var addressLine = $('#addressLine1').val();
        if (!addressLine || addressLine == '') {
            $('#addressLine1ValidationMessage').html('${message(code: 'shippingAddress.addressLine.notEmpty')}');
            return false;
        }
        return true;
    }
    function validateName1() {
        $('#person1ValidationMessage').html('');

        var value = $('#person1').val();
        if (!value || value == '') {
            $('#person1ValidationMessage').html('${message(code: 'shippingAddress.telephone.notEmpty')}');
            return false;
        }
        return true;
    }
    function validateDate1() {
        $('#deliveryTime1ValidationMessage').html('');

        var value = $('#deliveryDate').val();
        if (!value || value == '') {
            $('#deliveryTime1ValidationMessage').html('${message(code: 'shippingAddress.telephone.notEmpty')}');
            return false;
        }
        var value = $('#deliveryMonth').val();
        if (!value || value == '') {
            $('#deliveryTime1ValidationMessage').html('${message(code: 'shippingAddress.telephone.notEmpty')}');
            return false;
        }
        var value = $('#deliveryHour').val();
        if (!value || value == '') {
            $('#deliveryTime1ValidationMessage').html('${message(code: 'shippingAddress.telephone.notEmpty')}');
            return false;
        }
        var value = $('#deliveryMinute').val();
        if (!value || value == '') {
            $('#deliveryTime1ValidationMessage').html('${message(code: 'shippingAddress.telephone.notEmpty')}');
            return false;
        }
        return true;
    }

    function validateShippingAddress() {
        var telephone = validateTelephone1();
        var addressLine = validateAddressLine1();
        var name = validateName1();
        var date = validateDate1();
        return telephone && addressLine && name && date;
    }
    var deliveryAddresses=${(prevAddresses?:[]) as grails.converters.JSON};
    function updateDeliveryAddressesJs(id){
        var addressLine=$('[name=addressLine]')
        var telephone=$('[name=telephone]')
        var title=$('[name=title]')
        if(!id){
            addressLine .val( '');
            title .val( '');
            telephone.val( '');
        }
        else {
            for (var i in deliveryAddresses) {
                if (deliveryAddresses[i].title == id) {
                    addressLine .val(deliveryAddresses[i].addressLine1);
                    title .val(deliveryAddresses[i].title);
                    telephone.val(deliveryAddresses[i].telephone);
//                scope.deliveryCity = deliveryAddresses[i].city.id;
                }
            }
        }
    }
    function setCallBeforeSend(element, value) {
        if (element.checked) {
            $('.deliveryMethodList li').removeClass('selected');
            $(element).parent().addClass('selected');
        }
    }
    function setDay(){
        var month=parseInt($('#deliveryMonth').val());
        if(month>6) {
            $('#deliveryDate option:last').hide()
            if($('#deliveryDate').val()=='31')
                $('#deliveryDate').val('')
        }
        else
            $('#deliveryDate option:last').show()
        if(month==12) {
            $('#deliveryDate option').eq(-2).hide()
            if($('#deliveryDate').val()=='30')
                $('#deliveryDate').val('')
        }
        else
            $('#deliveryDate option').eq(-2).show()
    }


</script>
<div id="no-sign-in">
    <g:form action="storeShippingAddress" onsubmit="return validateShippingAddress()">

        <ul class="deliveryMethodList">

            <li class="selected">
                <input type="radio" id="callBeforeSend"
                           name="callBeforeSend" checked value="true"
                           onchange="setCallBeforeSend(this,true);"/>
                <label for="callBeforeSend" style="color:black;">
                    <b class="selected"><g:message code="call-before-send"/></b>
                </label>

            </li>
            <li>
                <input type="radio" id="sendAsSurprise"
                       name="callBeforeSend" value="false"
                       onchange="setCallBeforeSend(this,false);"/>
                <label for="sendAsSurprise" style="color:black;">
                    <b><g:message code="send-surprise"/></b>
                </label>

            </li>
        </ul>
        <br/>
            %{--<label for='prevAddress'><g:message--}%
                %{--code="springSecurity.register.province.label"/></label>--}%
        <g:select name="prevAddress" from="${prevAddresses.collect{it.title}}"
                  noSelection="['':message(code:'newAddress')]" value="${address?.title}"/>
        <script type="application/javascript">
            $('#prevAddress').change(function(){
                updateDeliveryAddressesJs(this.value)
            })
        </script>

        <label for='person1'><g:message
                code="delivery-person"/>:</label>
        <span id="person1ValidationMessage"></span>
        <input type='text' name='title' id='person1'
               value="${address?.title}" onblur="validatePerson1();"
               class="block half"/>

        <label for='telephone1'><g:message
                code="delivery-phone"/>:</label>
        <span id="telephone1ValidationMessage"></span>
        <input type='text' name='telephone' id='telephone1'
               value="${address?.telephone}" onblur="validateTelephone1();"
               class="block half"/>
        <label for='addressLine1'><g:message
                code="springSecurity.register.address.label"/>:</label>
        <span id="addressLine1ValidationMessage"></span>
        <textarea type='text' name='addressLine' onblur="validateAddressLine1();"
                  id='addressLine1' style="height:100px;">${address?.addressLine1}</textarea>

        <label for='deliveryTime'><g:message
                code="delivery-time"/>:</label>
        <span id="deliveryTime1ValidationMessage"></span>
        <div id="deliveryTime">
            <g:select name="deliveryMinute" from="${['00','15','30','45']}" noSelection="['':message(code:'minute')]" value="${session['deliveryDate_minute']}"/>
            <g:select name="deliveryHour" from="${(8..22)}" noSelection="['':message(code:'hour')]" value="${ session['deliveryDate_hour']}"/>
            <g:select name="deliveryDate" from="${(1..31)}" noSelection="['':message(code:'day')]" value="${ session['deliveryDate_day']}"/>
            <g:select name="deliveryMonth" from="${(1..12).collect {[id:it,value:message(code:'month.'+it)]}}" optionKey="id" optionValue="value" noSelection="['':message(code:'month')]" onchange="setDay()" value="${ session['deliveryDate_month']}"/>

        </div>


        <div>
            <input type='submit' id="submit" class="grn-btn"
                   value='${message(code: "enquiry.request.shopping.saveAddress")}'/>
        </div>
    </g:form>
</div>