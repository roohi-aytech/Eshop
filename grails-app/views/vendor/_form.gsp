<%@ page import="eshop.Role; eshop.RoleHelper; eshop.UserRole; eshop.Vendor" %>

<style>
.checkBoxList {
    padding: 5px;
    border: 1px solid #eeeeee;
    border-radius: 5px;
    max-height: 150px;
    overflow: auto;
}

.checkBoxList label {
    width: auto;
    display: inline-block;
    font-size: 11px;
}
</style>

<g:hasErrors bean="${vendorInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${vendorInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${vendorInstance?.id}"/>
<g:hiddenField name="version" value="${vendorInstance?.version}"/>


<div class="fieldcontain ${hasErrors(bean: vendorInstance, field: 'user', 'error')} required">
    <label for="user">
        <g:message code="vendor.user.label" default="User"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id"
              from="${UserRole.findAllByRole(Role.findByAuthority(RoleHelper.ROLE_VENDOR))?.user}" optionKey="id"
              required="" value="${vendorInstance?.user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendorInstance, field: 'brands', 'error')} ">

    <g:message code="vendor.brands.label" default="Brands"/>
    <div class="checkBoxList">
    <g:each in="${vendorInstance?.brands?.sort {it.name}}" var="brand">
        <div>
            <g:checkBox name="brands" id="brand${brand.id}" value="${brand.id}" checked="${vendorInstance?.brands?.contains(brand)}"
                        title="${brand.name}"/>
            <label for="brand${brand.id}">
                ${brand.name}
            </label>
        </div>
    </g:each>
        <g:each in="${brands.findAll{!vendorInstance?.brands?.contains(it)}.sort {it.name}}" var="brand">
            <div>
                <g:checkBox name="brands" id="brand${brand.id}" value="${brand.id}" checked="${vendorInstance?.brands?.contains(brand)}"
                            title="${brand.name}"/>
                <label for="brand${brand.id}">
                    ${brand.name}
                </label>
            </div>
        </g:each>
    </div>
</div>

<g:hiddenField name="productType.id" value="${vendorInstance?.productType?.id}"/>


