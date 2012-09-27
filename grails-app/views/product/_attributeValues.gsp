
    <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
    <h2><g:message code="product.attributeValues.label" default="Product Attribute Values" /> ${productInstance}</h2>

    <div id="list-product" class="content scaffold-list" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <g:form action="saveAttributeValues" params="${[curtab:0]}">
            <g:hiddenField name="id" value="${params.id}"/>
            <eshop:renderProductAttributes product="${productInstance}"/>

            <fieldset class="buttons">
                <g:submitButton name="create" class="save" value="${message(code: 'default.button.save.label', default: 'Save')}" />
                <g:link class="list" action="list"><g:message code="default.product.list" default="Product List" /></g:link>
            </fieldset>
        </g:form>
    </div>
