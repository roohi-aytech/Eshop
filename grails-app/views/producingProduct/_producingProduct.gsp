<%@ page import="eshop.ProducingProduct" %>


<div>
    <div>
        <label >
            <g:message code="producingProduct.repetitive.label" default="Repeat"/>
            <g:checkBox name="repetitive" onselect="loadLastData()" />
        </label>
    </div>




</div>




<script type="text/javascript">
    function loadLastData() {
        $.ajax({
            url:'<g:createLink action="producingProduct" controller="producerProductModel"/>',
            data:{
                producer:producer.val(),
                ProducerProductModelId : '${producerProductModelInstance?.id}',
                productModelId: '${productModel?.id}'
            },
            type:'GET'
        }).done(function(response){
                    $('#producerDetailsTemplate').html(response);
                });
    }


</script>

