<div style="width: 500px">
    <g:form name="variation_images" controller="addedValue" action="addedValueImagesSave" enctype="multipart/form-data">
        <g:hiddenField name="id" value="${addedValue.id}"/>
        <table>
                <tr>
                    <td>${addedValue}</td>
                    <td><img width="100" src="<g:createLink controller="image" params="[type:'addedValue',uid:Math.random()]" id="${addedValue?.id}"/>" alt=""></td>
                    <td><input type="file" name="image_${addedValue.id}"></td>
                </tr>
        </table>
        <input type="button" value="<g:message code="save"/>" onclick="$('#variation_images').ajaxSubmit();$('#edit_photoes_addedValue').dialog('close');">
    </g:form>
</div>