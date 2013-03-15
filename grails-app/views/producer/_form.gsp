<%@ page import="eshop.Producer" %>


<g:hiddenField name="id" value="${producerInstance?.id}"/>
<g:hiddenField name="version" value="${producerInstance?.version}" />
<div class="fieldcontain ${hasErrors(bean: producerInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="producer.name.label" default="Name" />
    </label>

    <g:textField name="name" value="${producerInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: producerInstance, field: 'address', 'error')} ">
    <label for="address">
        <g:message code="producer.address.label" default="Address" />
    </label>

    <g:textArea name="address"  value="${producerInstance?.address}" />
</div>

<rg:compositeForm bean="${producerInstance}" property="producerStaffs"/>