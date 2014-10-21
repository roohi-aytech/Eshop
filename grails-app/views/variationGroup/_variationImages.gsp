<div style="width: 500px">
    <g:form name="variation_images" controller="variationGroup" action="variationImagesSave" enctype="multipart/form-data">
        <g:hiddenField name="id" value="${variationGroup.id}"/>
        <table>
        <g:each in="${variationGroup.variationValues}" var="variationValue">
            <tr>
                <td>${variationValue}</td>
                <td><img width="100" src="<g:createLink controller="image" params="[type:'variationValue',uid:Math.random()]" id="${variationValue?.id}"/>" alt=""></td>
                <td><input type="file" name="image_${variationValue.id}"></td>
            </tr>
        </g:each>
        </table>
        <input type="button" value="<g:message code="save"/>" onclick="$('#variation_images').ajaxSubmit();$('#edit_photoes').dialog('close');">
    </g:form>
</div>