
<rg:checkBoxList name="addedValueTypes" from="${eshop.AddedValueType.list().collect{[id:it.id,label:it.title]}}"  value="${productTypeInstance?.addedValueTypes?.collect{it.id}}" optionKey="id" />

<button class="btn btn-success" onclick="submitAddedValueTypes()"><g:message code="save" /></button>

<script type="application/javascript">
    function submitAddedValueTypes(){
        $.ajax({
            url:'<g:createLink action="assign" controller="addedValueType" />',
            data:{
                ptId:${productTypeInstance?.id},
                addedValueTypes:$('[name=addedValueTypes]:checked').map(function(){
                    return this.value
                }).get().join()
            }
        }).success(function(){
            alert('success');
        })
    }
</script>