<%@ page import="eshop.ProductType" %>



<div class="fieldcontain ${hasErrors(bean: productTypeInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="productType.name.label" default="Name" />

    </label>
    <g:textField name="name" value="${productTypeInstance?.name}" class="count-words" size="52"/>
</div>
<div class="fieldcontain ${hasErrors(bean: productTypeInstance, field: 'seoFriendlyName', 'error')} ">
    <label for="pageTitle">
        <g:message code="product.seoFriendlyName.label" default="seoFriendlyName" />

    </label>
    <g:textField name="seoFriendlyName" value="${productTypeInstance?.seoFriendlyName}" class="count-words" size="52"/>
</div>
<div class="fieldcontain ${hasErrors(bean: productTypeInstance, field: 'seoFriendlyAlternativeName', 'error')} ">
    <label for="pageTitle">
        <g:message code="product.seoFriendlyAlternativeName.label" default="seoFriendlyAlternativeName" />

    </label>
    <g:textField name="seoFriendlyAlternativeName" value="${productTypeInstance?.seoFriendlyAlternativeName}" class="count-words" size="52"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productTypeInstance, field: 'pageTitle', 'error')} ">
    <label for="pageTitle">
        <g:message code="product.pageTitle.label" default="Page Title" />

    </label>
    <g:textField name="pageTitle" value="${productTypeInstance?.pageTitle}" class="count-words" size="52"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="productType.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" value="${productTypeInstance?.description}" cols="50" rows="5" class="count-words"/>
</div>
<div class="fieldcontain ${hasErrors(bean: productTypeInstance, field: 'keywords', 'error')} ">
    <label for="keywords">
        <g:message code="product.keywords.label" default="Keywords" />

    </label>
    <g:textArea name="keywords" value="${productTypeInstance?.keywords}" cols="50" rows="5" class="count-words"/>
</div>
<div class="fieldcontain ${hasErrors(bean: productTypeInstance, field: 'image', 'error')} ">
    <label for="image">
        <g:message code="productType.image.label" default="image" />

    </label>
    <input type="file" id="image" name="image" />
    <img src="<g:createLink controller="productType" action="getImage" id="${productTypeInstance?.id}"/>" style="max-width: 100px"/>

</div>

%{--<g:hiddenField name="parentProduct.id" value="${parentProduct?.id}" />--}%


%{--<div class="fieldcontain ${hasErrors(bean: productTypeInstance, field: 'parentProduct', 'error')} required">--}%
	%{--<label for="parentProduct">--}%
		%{--<g:message code="productType.parentProduct.label" default="Parent Product" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:select id="parentProduct" name="parentProduct.id" from="${eshop.ProductType.list()}" optionKey="id" required="" value="${productTypeInstance?.parentProduct?.id}" class="many-to-one"/>--}%
%{--</div>--}%

