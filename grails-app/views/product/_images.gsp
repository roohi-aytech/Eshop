<div dir="ltr">
    <g:if test="${productInstance.id}">
        <bsfu:fileUpload action="uploadImage" controller="Product" params="${[id:productInstance.id]}"/>
    </g:if>
</div>
