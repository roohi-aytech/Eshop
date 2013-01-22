<g:message code="please-upload-mp3-mp4-flv"/>
<div dir="ltr">
    <g:if test="${productInstance.id}">
        <bsfu:fileUpload id="media" namespace="media" sequentialUploads="true" action="uploadVideo" controller="Product"
                         params="${[id: productInstance.id]}" acceptFileTypes="/(\\.|\\/)(mp3|mp4|flv)\$/i" filesContainer="#videofiles"/>
        <div id="videofiles">

        </div>
    </g:if>
</div>