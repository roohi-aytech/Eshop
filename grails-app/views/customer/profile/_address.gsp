<script language="javascript" type="text/javascript">

        function updateCityList(){
            var currentCityId = '${customerInstance?.address?.city?.id}';

            var $el = $("#city");
            $el.empty(); // remove old options
            $.ajax({
                type:"GET",
                url:"<g:createLink controller="province" action="getProvinceCities"/>",
                data:{id: $('#province').val()}
            }).done(function (response) {
                $el = $("#city");
                $el.empty(); // remove old options
                for(var i = 0; i < response.length; i++)
                    if(response[i].id.toString() == currentCityId)
                      $el.append($("<option selected></option>")
                         .attr("value", response[i].id).text(response[i].title));
                     else
                      $el.append($("<option></option>")
                         .attr("value", response[i].id).text(response[i].title));
            });
        }

        $(document).ready(function(){
           updateCityList();
        });
</script>
%{--<g:form controller="customer" action='saveAddress' method='POST' id='registerForm'--}%
%{--name='registerForm'--}%
%{--class='cssform'--}%
%{--autocomplete='off'>--}%

<div class="column1">

    <p style="display: inline-block">
        <label for='province'><g:message
                code="springSecurity.register.province.label"/>:</label> *
        <select name="province" id="province" onchange="updateCityList();" style="width:155px;">
            <g:set var="provinceList" value="${eshop.Province.findAll()}"></g:set>
            <g:each in="${provinceList}" var="province">
                <option ${customerInstance?.address?.city?.province?.id == province.id ? 'selected' : ''}
                        value="${province.id}">${province.title}</option>
            </g:each>
        </select>
    </p>

    <p style="display: inline-block">
        <label for='city'><g:message
                code="springSecurity.register.city.label"/>:</label> *
        <select name="city" id="city" style="width:155px;">
        </select>
    </p>
</div>

<p>
    <label for='addressLine1'><g:message
            code="springSecurity.register.address.label"/>:</label>
    <textarea type='text' class='text_' name='addressLine1'
              id='addressLine1'>${customerInstance?.address?.addressLine1}</textarea>
</p>

<div>
    <p>
        <label for='postalCode'><g:message
                code="springSecurity.register.postalCode.label"/>:</label>
        <input type='text' class='text_' name='postalCode' id='postalCode'
               value="${customerInstance?.address?.postalCode}"/>
    </p>

    %{--<p>--}%
    %{--<label for='telephone'><g:message--}%
    %{--code="springSecurity.register.telephone.label"/>:</label>--}%
    %{--<input type='text' class='text_' name='telephone' id='telephone' value="${customerInstance?.address?.telephone}"/>--}%
    %{--</p>--}%

</div>

%{--<p class="toolbar">--}%
%{--<input type='submit' id="submit2" onclick="return validate();" class="btn btn-primary"--}%
%{--width="80px"--}%
%{--value='${message(code: "saveSendingAddress")}'/>--}%
%{--</p>--}%
%{--</g:form>--}%