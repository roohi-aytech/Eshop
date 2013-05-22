<%@ page import="eshop.ProductTypeBrand; eshop.Guarantee" %>
<div class="form-fields">
    <div class="form-fields-part">
        <div class="fieldcontain ${hasErrors(bean: guaranteeInstance, field: 'name', 'error')} ">
            <label for="name">
                <g:message code="guarantee.name.label" default="Name"/>

            </label>
            <g:textField name="name" value="${guaranteeInstance?.name}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: guaranteeInstance, field: 'period', 'error')} ">
            <label for="period">
                <g:message code="guarantee.period.label" default="Period"/>
            </label>

            <g:textField name="period" value="${guaranteeInstance?.period}"/>

        </div>

        <div class="fieldcontain ${hasErrors(bean: guaranteeInstance, field: 'description', 'error')} ">
            <label for="description">
                <g:message code="guarantee.description.label" default="Description"/>

            </label>
            <g:textArea cols="50" rows="5" name="description" value="${guaranteeInstance?.description}" class="count-words"/>
        </div>


        <div class="fieldcontain ${hasErrors(bean: guaranteeInstance, field: 'logo', 'error')} required">
            <label for="logo">
                <g:message code="guarantee.logo.label" default="Logo"/>
            </label>
            <input type="file" id="logo" name="logo" />
            <img src="<g:createLink controller="Guarantee" action="getLogo" id="${guaranteeInstance?.id}"/>" style="max-width: 100px"/>
        </div>
        </div>
</div>



