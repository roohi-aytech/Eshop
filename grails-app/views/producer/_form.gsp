<%@ page import="eshop.Product; eshop.ProducingProduct; eshop.ProducerStaff; eshop.Producer" %>

<div class="form-fields">
    <div class="form-fields-part">

        <div class="fieldcontain ${hasErrors(bean: producerInstance, field: 'producerType', 'error')}">
            <label for="producerType">
                <g:message code="producer.producerType.label" default="ProducerType"/>
            </label>
            <rg:autocomplete domainClass="eshop.ProducerType" id="producerType" like="true" value="${producerInstance?.producerType?.id}" display="${producerInstance?.producerType}"/>

            <input type="button" value="${message(code: "add")}" onclick="addProducerType()">
        </div>

        <div class="fieldcontain ${hasErrors(bean: producerInstance, field: 'name', 'error')} ">
            <label for="name">
                <g:message code="producer.name.label" default="Name"/>

            </label>
            <g:textField  name="name" step="any" value="producerInstance?.name"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: producerInstance, field: 'address', 'error')} ">
            <label for="address">
                <g:message code="producer.address.label" default="Address"/>

            </label>
            <g:textArea name="address"  rows="5" value="${producerInstance?.address}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: producerInstance, field: 'warehouseAddress', 'error')} ">
            <label for="warehouseAddress">
                <g:message code="producer.warehouseAddress.label" default="warehouseAddress"/>

            </label>
            <g:textArea name="warehouseAddress"  rows="5" value="${producerInstance?.warehouseAddress}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: producerInstance, field: 'phone', 'error')} ">
            <label for="phone">
                <g:message code="producer.phone.label" default="Phone"/>

            </label>
            <g:textField name="phone" value="${producerInstance?.phone}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: producerInstance, field: 'fax', 'error')} ">
        <label for="fax">
            <g:message code="producer.fax.label" default="Fax"/>

        </label>
        <g:textField name="fax" value="${producerInstance?.fax}"/>
        </div>

    </div>

</div>


