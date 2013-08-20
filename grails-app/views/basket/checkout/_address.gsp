<%@ page import="eshop.City" %>
<script language="javascript" type="text/javascript">
    function updateCityList(provinceCombo, cityCombo) {
        var currentCityId = '${address?.city?.id}';

        var $el = $("#" + cityCombo);
        $el.empty(); // remove old options
        $.ajax({
            type: "GET",
            url: "<g:createLink controller="province" action="getProvinceCities"/>",
            data: {id: $('#' + provinceCombo).val()}
        }).done(function (response) {
                    $el = $("#" + cityCombo);
                    $el.empty(); // remove old options
                    for (var i = 0; i < response.length; i++)
                        if (response[i].id.toString() == currentCityId)
                            $el.append($("<option selected></option>")
                                    .attr("value", response[i].id).text(response[i].title));
                        else
                            $el.append($("<option></option>")
                                    .attr("value", response[i].id).text(response[i].title));
                });
    }

    $(document).ready(function () {
        updateCityList('province1', 'city1');
    });

    function validatePostalCode1() {
        $('#postalCode1ValidationMessage').html('');

        var postalCode = $('#postalCode1').val();
        if (!postalCode || postalCode == '') {
            $('#postalCode1ValidationMessage').html('${message(code: 'shippingAddress.postalCode.notEmpty')}');
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

    function validateShippingAddress(){
        var postalCode = validatePostalCode1();
        var telephone = validateTelephone1();
        var addressLine = validateAddressLine1();
        return postalCode && telephone && addressLine;
    }
</script>
<g:set var="city" value="${City.get(address?.city?.id)}"/>
<g:form action="storeShippingAddress" onsubmit="return validateShippingAddress()">
    <table>
        <tr class="table-row">
            <td class="table-cell">
                <table>
                    <tr class="table-row">
                        <td class="table-cell">
                            <div>
                                <label for='province1'><g:message
                                        code="springSecurity.register.province.label"/>:</label>
                                <select name="province" id="province1"
                                        onchange="updateCityList('province1', 'city1');"
                                        class="block half" style="width: 150px;">
                                    <g:set var="provinceList"
                                           value="${eshop.Province.findAll()}"></g:set>
                                    <g:each in="${provinceList}" var="province">
                                        <option ${city?.province?.id == province.id ? 'selected' : ''}
                                                value="${province.id}">${province.title}</option>
                                    </g:each>
                                </select>
                            </div>

                            <div>
                                <label for='postalCode1'><g:message
                                        code="springSecurity.register.postalCode.label"/>:</label>
                                <span id="postalCode1ValidationMessage"></span>
                                <input type='text' name='postalCode' id='postalCode1'
                                       value="${address?.postalCode}" onblur="validatePostalCode1();"
                                       class="block half" style="width: 136px;"/>
                            </div>
                        </td>

                        <td class="table-cell">

                            <div>
                                <label for='city1'><g:message
                                        code="springSecurity.register.city.label"/>:</label>
                                <select name="city" id="city1" class="block half" style="width: 150px;">
                                </select>
                            </div>

                            <div>
                                <label for='telephone1'><g:message
                                        code="springSecurity.register.telephone.label"/>:</label>
                                <span id="telephone1ValidationMessage"></span>
                                <input type='text' name='telephone' id='telephone1'
                                       value="${address?.telephone}" onblur="validateTelephone1();"
                                       class="block half" style="width: 136px;"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr class="table-row">
            <td class="table-cell">
                <label for='addressLine1'><g:message
                        code="springSecurity.register.address.label"/>:</label>
                <span id="addressLine1ValidationMessage"></span>
                <textarea type='text' name='addressLine' onblur="validateAddressLine1();"
                          id='addressLine1' style="height: 80px;width: 289px;"
                          class="block full">${address?.addressLine1}</textarea>
            </td>
        </tr>
    </table>


    <div style="float: right;">
        <input type='submit' id="submit" class="btn btn-primary" width="80px"
               value='${message(code: "enquiry.request.shopping.saveAddress")}' style="height:30px;"/>
    </div>
</g:form>