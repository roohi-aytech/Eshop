<g:hiddenField name="id" value="${productTypeType?.id}"/>
<div class="fieldcontain" style="">
    <label for="title" class="valueslabel">
        <g:message code="productTypeType.title" default="Title"/>
    </label>
    <g:textField name="title" value="${productTypeType?.title}"/>
</div>
<div class="fieldcontain" style="">
    <label for="image" class="valueslabel">
        <g:message code="productTypeType.image" default="Image"/>
    </label>
    <input type="file" name="image" id="image">
    <input type="hidden" name="imageDeleted">
    <img id="img${productTypeType?.id}" src="<g:createLink controller="product" action="getTypeImage" id="${productTypeType?.id}" params="[timestamp:System.currentTimeMillis()]"/>" style="max-width: 100px"/>
    <input type="button" onclick="$('[name=imageDeleted]').val('true');$('#img${productTypeType?.id}').remove()" value="<g:message code="delete" />">
</div>