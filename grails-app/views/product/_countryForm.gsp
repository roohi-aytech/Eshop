<g:if test="${hasError}">
    <ul class="errors" role="alert">
        <li data-field-id="manufactureCountry"><g:message code="please-enter-a-country"/></li>
    </ul>
</g:if>
<div class="fieldcontain">
    <label for="manufactureCountry">
        <g:message code="product.manufactureCountry.label" default="Manufacture Country"/>

    </label>
    <g:hiddenField name="manufactureCountryOld" value="${country}"/>
    <g:textField name="manufactureCountry" value="${country}"/>
</div>