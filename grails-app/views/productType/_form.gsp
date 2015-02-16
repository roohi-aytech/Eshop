<%@ page import="eshop.ProductType" %>



<div class="fieldcontain ${hasErrors(bean: productTypeInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="productType.name.label" default="Name" />

    </label>
    <g:textField name="name" value="${productTypeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="productType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${productTypeInstance?.description}"/>
</div>

<g:hiddenField name="parentProduct.id" value="${parentProduct?.id}" />
%{--<div class="fieldcontain ${hasErrors(bean: productTypeInstance, field: 'parentProduct', 'error')} required">--}%
	%{--<label for="parentProduct">--}%
		%{--<g:message code="productType.parentProduct.label" default="Parent Product" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:select id="parentProduct" name="parentProduct.id" from="${eshop.ProductType.list()}" optionKey="id" required="" value="${productTypeInstance?.parentProduct?.id}" class="many-to-one"/>--}%
%{--</div>--}%

