<g:form action="editImageDetails">
    <g:hiddenField name="product.id" value="${productInstance?.id}"/>
    <g:hiddenField name="curtab" value="6"/>
    <g:hiddenField name="curtab2" value="1"/>
    <g:message code="main-image"/>
    <g:each in="${productInstance?.images?.sort({it.name})}">
        <div class="product-image-details">
            <g:radio name="mainImage" value="${it.id}" checked="${productInstance.mainImage?.id==it.id}"/>
            <span class="product-image-details-img">
                <img src="<g:createLink controller="image" action="index"
                                    params="[id: productInstance.id, name: it.name]"/>" alt="">
            </span>
            <span id="image-variations-${it.id}" class="product-image-details-variations">
                <g:each in="${it?.variationValues}" var="variationValue">
                    <span>${variationValue}</span>
                </g:each>
            </span>
            <input type="button" value="${message(code: "edit-variations")}" onclick="editVariations(${it.id})"/>
        </div>
    </g:each>

    <fieldset class="buttons">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.save.label', default: 'Save')}" />
        <g:actionSubmit name="saveAndExit" action="editImageDetailsAndExit" class="save" value="${message(code: 'default.button.save.and.exit.label', default: 'Save')}" />
        <g:link class="list" action="list"><g:message code="default.product.list" default="Product List" /></g:link>
    </fieldset>
</g:form>
<script type="text/javascript">
    function editVariations(id){
        loadOverlay('<g:createLink action="imageVariations" params="[productId:productInstance?.id]"/>&id='+id,
                '<g:createLink action="saveImageVariations" />',function(obj){
                    var imgdiv=$("#image-variations-"+id)
                    imgdiv.html("")
                    $(obj).each(function(){
                        imgdiv.append("<span>"+this.value+"</span>")
                    })
                })
    }
</script>