<g:form method="post" action="saveProductDetails" params="${[curtab:6]}">
    <g:hiddenField name="id" value="${productInstance.id}"/>

        <ckeditor:editor name="detail_details" width="100%" height="200px">
            ${productInstance.details}
        </ckeditor:editor>

    <fieldset class="buttons">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.save.label', default: 'Save')}" />
        <g:link class="list" action="list"  params="[ptid:ptid]"><g:message code="default.product.list" default="Product List" /></g:link>
    </fieldset>
</g:form>