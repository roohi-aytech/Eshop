<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}"/>
<h2><g:message code="product.attributeValues.label" default="Product Attribute Values"/> ${productInstance}</h2>

<div id="list-product" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:form method="post" action="saveAttributeValues" params="${[curtab: 1, ptid: ptid]}">
        <g:hiddenField name="id" value="${productInstance?.id}"/>
        <g:render template="product_type_type"
                  model="[productInstance: productInstance, productTypeTypes: productTypeTypes]"/>
        <eshop:renderProductAttributes product="${productInstance}"/>

        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.save.label', default: 'Save')}"/>
            <g:actionSubmit action="saveAttributeValuesAndExit" name="createAndExit" class="save"
                            value="${message(code: "default.button.save.and.exit.label", default: "Save And Exit")}"/>
            <g:actionSubmit action="saveAttributeValuesAndNew" name="createAndNew" class="save"
                            value="${message(code: "default.button.save.and.new.label", default: "Save And New")}"/>
            <g:link class="list" action="list" params="[ptid: ptid]"><g:message code="default.product.list"
                                                                                default="Product List"/></g:link>
        </fieldset>
    </g:form>
</div>
