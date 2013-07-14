<%@ page import="eshop.delivery.DeliverySourceStation" %>

<g:hasErrors bean="${deliverySourceStationInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${deliverySourceStationInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${deliverySourceStationInstance?.id}"/>
<g:hiddenField name="version" value="${deliverySourceStationInstance?.version}"/>
<g:hiddenField name="method.id" value="${params["method.id"]}"/>


<div class="fieldcontain ${hasErrors(bean: deliverySourceStationInstance, field: 'city', 'error')} required">
    <label for="city">
        <g:message code="deliverySourceStation.city.label" default="City"/>
        <span class="required-indicator">*</span>
    </label>
    <input id="city" name="city.id" value="${deliverySourceStationInstance?.city?.id}" class="combotree" style="width:220px"
           data-options="url:'${createLink(action: "cityTree", params: [deliverySourceStationId: deliverySourceStationInstance.id ?: 0])}'"/>
    <script language=javascript>
        $('#city').combotree({
            required: true,
            onBeforeSelect: function (node) {
                return !node.id.toString().startsWith('p');
            }
        });
    </script>
</div>

<div class="fieldcontain ${hasErrors(bean: deliverySourceStationInstance, field: 'phoneNumber', 'error')} ">
    <label for="phoneNumber">
        <g:message code="deliverySourceStation.phoneNumber.label" default="Phone Number"/>

    </label>
    <g:textField size="35" name="phoneNumber" value="${deliverySourceStationInstance?.phoneNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliverySourceStationInstance, field: 'address', 'error')} ">
    <label for="address">
        <g:message code="deliverySourceStation.address.label" default="Address"/>

    </label>
    <g:textArea name="address" cols="35" rows="5" maxlength="20000" value="${deliverySourceStationInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliverySourceStationInstance, field: 'contactPersons', 'error')} ">
    <label for="contactPersons">
        <g:message code="deliverySourceStation.contactPersons.label" default="Contact Persons"/>

    </label>
    <g:textArea name="contactPersons" cols="35" rows="5" maxlength="20000"
                value="${deliverySourceStationInstance?.contactPersons}"/>
</div>



