<%@ page import="eshop.accounting.AccountFilter" %>

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

<g:hasErrors bean="${accountFilterInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${accountFilterInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${accountFilterInstance?.id}" />
<g:hiddenField name="version" value="${accountFilterInstance?.version}" />


<div class="fieldcontain ${hasErrors(bean: accountFilterInstance, field: 'account', 'error')} required">
	<label for="account">
		<g:message code="accountFilter.account.label" default="Account" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="account" name="account.id" from="${eshop.accounting.Account.list()}" optionKey="id" required="" value="${accountFilterInstance?.account?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountFilterInstance, field: 'brands', 'error')} ">

    <g:message code="accountFilter.brands.label" default="Brands"/>
    <div class="checkBoxList">
        <g:each in="${accountFilterInstance?.brands?.sort {it.name}}" var="brand">
            <div>
                <g:checkBox name="brands" id="brand${brand.id}" value="${brand.id}" checked="${accountFilterInstance?.brands?.contains(brand)}"
                            title="${brand.name}"/>
                <label for="brand${brand.id}">
                    ${brand.name}
                </label>
            </div>
        </g:each>
        <g:each in="${brands.findAll{!accountFilterInstance?.brands?.contains(it)}.sort {it.name}}" var="brand">
            <div>
                <g:checkBox name="brands" id="brand${brand.id}" value="${brand.id}" checked="${accountFilterInstance?.brands?.contains(brand)}"
                            title="${brand.name}"/>
                <label for="brand${brand.id}">
                    ${brand.name}
                </label>
            </div>
        </g:each>
    </div>
</div>

<g:hiddenField name="productType.id" value="${accountFilterInstance?.productType?.id}"/>
