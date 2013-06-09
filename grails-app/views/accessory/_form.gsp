<%@ page import="eshop.AttributeMapping; eshop.Attribute; org.grails.plugin.resource.ResourceProcessor; eshop.Accessory" %>

<g:hasErrors bean="${accessoryInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${accessoryInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${accessoryInstance?.id}"/>
<g:hiddenField name="version" value="${accessoryInstance?.version}"/>
<g:hiddenField name="baseProduct.id" value="${accessoryInstance?.baseProduct?.id}"/>

<div class="fieldcontain ${hasErrors(bean: accessoryInstance, field: 'productType', 'error')} ">
    <label for="productType">
        <g:message code="productType.label" default="Product"/>
    </label>
    <rg:autocomplete domainClass="eshop.ProductType" id="productType" like="true" value="${accessoryInstance?.productType?.id}"
                     display="${accessoryInstance?.productType}"/>

    %{--<rg:tree bean="${accessoryInstance}" field="productType" relationField="parentProduct" width="340px" cascadeCheck="true"></rg:tree>--}%

</div>


<div class="fieldcontain ${hasErrors(bean: accessoryInstance, field: 'attributeMappings', 'error')} ">
    <label for="attributeMappings">
        <g:message code="attributeMapping.label" default="MappingAttribute"/>

    </label>
    <g:select name="attributeMappings" from="${AttributeMapping.list()}" multiple="multiple"
              optionKey="id" size="5" value="" class="many-to-many"/>
</div>


