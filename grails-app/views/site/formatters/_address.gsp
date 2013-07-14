<%@ page import="eshop.City" %>
<g:set var="city" value="${City.get(address.cityId)}"/>
<g:message code="province"/> ${city.province.title} -
<g:message code="city"/> ${city.title} -
${address.addressLine1} ${address.addressLine2?address.addressLine2:""} -
<g:message code="springSecurity.register.postalCode.label"/> ${address.postalCode} -
<g:message code="springSecurity.register.telephone.label"/>: ${address.telephone}
