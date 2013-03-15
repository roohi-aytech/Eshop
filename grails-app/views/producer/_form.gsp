<%@ page import="eshop.ProducerStaff; eshop.Producer" %>

<div class="form-fields">
    <div class="form-fields-part">

        <div class="fieldcontain ${hasErrors(bean: producerInstance, field: 'name', 'error')} ">
            <label for="name">
                <g:message code="producer.name.label" default="Name"/>

            </label>
            <g:textField  name="name" step="any" value=""/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: producerInstance, field: 'address', 'error')} ">
            <label for="address">
                <g:message code="producer.address.label" default="Address"/>

            </label>
            <g:textField name="address" value=""/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: producerInstance, field: 'producerStaffs', 'error')} ">
            <label for="producerStaffs">
                <g:message code="producer.producerStaffs.label" default="Staffs"/>

            </label>
            <g:select name="producerStaffs" from="${ProducerStaff.list()}" multiple="multiple"
                      optionKey="id" size="5" value="" class="many-to-many"/>
        </div>

    </div>
</div>