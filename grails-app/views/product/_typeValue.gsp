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
    <img src="<g:createLink controller="product" action="getTypeImage" id="${productTypeType?.id}"/>" style="max-width: 100px"/>
</div>