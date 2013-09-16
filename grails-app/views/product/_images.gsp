<div id="images-tabs">
    <ul>
        <li><a href="#upload"><g:message code="product.image.upload"/></a></li>
        <li><a href="#image-details"><g:message code="product.image.details"/></a></li>
    </ul>

    <div id="image-details">
        <g:render template="images_details"/>
    </div>
    <div dir="ltr" id="upload">
        <g:if test="${productInstance.id}">
            <bsfu:fileUpload id="image" namespace="image" sequentialUploads="true" action="uploadImage" controller="Product" params="${[id: productInstance.id]}"/>
        </g:if>
    </div>
</div>

<script language="javascript" type="text/javascript">
    $(function() {
        $( "#images-tabs" ).tabs({
            selected:${curtab2?:0}
        });
    });
</script>