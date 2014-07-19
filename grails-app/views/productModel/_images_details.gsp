
<% def imageService = grailsApplication.classLoader.loadClass('eshop.ImageService').newInstance() %>
<g:form action="setDefaultImage">
    <g:hiddenField name="id" value="${productModelInstance?.id}"/>
    <g:each in="${productModelInstance?.product?.images?.findAll{imageService.imageBelongsToModel(it, productModelInstance)}?.sort({it.name})}">
        <div class="product-image-details">
            <g:radio name="mainImage" value="${it.id}" checked="${productModelInstance?.mainImage?.id==it.id}"/>
            <span class="product-image-details-img">
                <img src="<g:createLink controller="image" action="index"
                                        params="[id: productModelInstance?.product?.id, name: it.name]"/>" alt="">
            </span>
            <span>${it.name}</span>
        </div>
    </g:each>

    <fieldset class="buttons">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.save.label', default: 'Save')}" />
    </fieldset>
</g:form>