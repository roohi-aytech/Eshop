<%@ page import="eshop.Producer; eshop.VariationValue; eshop.ProducerProductModel" %>

<g:hasErrors bean="${producerProductModelInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${producerProductModelInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<script type="text/javascript">
    function producerChanged(producer) {
        $.ajax({
            url:'<g:createLink action="producingProduct" controller="producerProductModel"/>',
            data:{
                producer:producer.val(),
                ProducerProductModelId : '${producerProductModelInstance?.id}'
            },
            type:'GET'
        }).done(function(response){
                    $('#producerDetailsTemplate').html(response);
                });
    }
</script>

<g:hiddenField name="id" value="${producerProductModelInstance?.id}" />
<g:hiddenField name="version" value="${producerProductModelInstance?.version}" />
<g:hiddenField name="productModel.id" value="${producerProductModelInstance?.productModel?.id}" />

<div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'producer', 'error')} ">
    <label for="producer.id">
        <g:message code="producer.label" default="Producer"/>
    </label>
    <g:select id="producerId" name="producer.id"
              from="${producers}"
              optionKey="id"
              value="${producerProductModelInstance?.producer}"
              onchange="producerChanged(\$(this))"/>
</div>

<script type="text/javascript" language="javascript">
producerChanged($('#producerId'));
</script>

<span class="producingProducts" id="producerDetailsTemplate" style="width: 600px">
    <g:if test="${producerProductModelInstance?.producer}">
        <g:render template="producingProduct_values" model="[
                producerProductModelInstance: producerProductModelInstance,
                producer: producerProductModelInstance?.producer
        ]"/>
    </g:if>
</span>
