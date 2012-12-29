<g:hiddenField name="id" value="${productTypeType?.id}"/>
<div class="fieldcontain" style="">
    <label for="title" class="valueslabel">
        <g:message code="productTypeType.title" default="Title"/>
    </label>
    %{--<g:if test="${attributeType == "Text"}">--}%
        %{--<g:textArea cols="40" rows="5" name="values" value="${value}"/>--}%
    %{--</g:if>--}%
    %{--<g:else>--}%
        <g:textField name="title" value="${productTypeType?.title}"/>
    %{--</g:else>--}%
</div>