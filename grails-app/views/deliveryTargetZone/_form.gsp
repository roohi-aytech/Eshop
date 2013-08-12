<%@ page import="eshop.delivery.DeliveryTargetZone" %>

<g:hasErrors bean="${deliveryTargetZoneInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${deliveryTargetZoneInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${deliveryTargetZoneInstance?.id}" />
<g:hiddenField name="version" value="${deliveryTargetZoneInstance?.version}" />
<g:hiddenField name="sourceStation.id" value="${params["deliverySourceStation.id"]}" />


<div class="fieldcontain ${hasErrors(bean: deliveryTargetZoneInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="deliveryTargetZone.name.label" default="Name" />
		
	</label>
	<g:textField size="35" name="name" value="${deliveryTargetZoneInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryTargetZoneInstance, field: 'cities', 'error')} ">
	<label for="cities">
		<g:message code="deliveryTargetZone.cities.label" default="Cities" />
		
	</label>
    <input id="cities" name="cities" multiple class="combotree" style="width:220px"
           data-options="url:'${createLink(action: "cityTree", params: [deliveryTargetZoneId: deliveryTargetZoneInstance.id ?: 0])}'"/>
    <script language=javascript>
        $('#cities').combotree({
//            onlyLeafCheck: true
        });
    </script>
</div>


