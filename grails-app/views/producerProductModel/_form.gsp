<%@ page import="eshop.Producer; eshop.VariationValue; eshop.ProducerProductModel" %>

<g:hasErrors bean="${producerProductModelInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${producerProductModelInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${producerProductModelInstance?.id}" />
<g:hiddenField name="version" value="${producerProductModelInstance?.version}" />
<g:hiddenField name="productModel.id" value="${producerProductModelInstance?.productModel?.id}" />

<div class="fieldcontain ${hasErrors(bean: producerProductModelInstance, field: 'producer', 'error')} ">
    <label for="producer">
        <g:message code="producer.label" default="Producer"/>
    </label>
    <g:select name="producer"
              from="${producers}"
              optionKey="id"
              value="${producerProductModelInstance?.producer}"
              onchange="producerChanged(this, ${producerProductModelInstance.id})"/>
</div>

<span class="producingProducts">
    <g:if test="${producerProductModelInstance?.producer}">
        <g:render template="producingProduct_values" model="[
                producerProductModelInstance: producerProductModelInstance,
                producer: producerProductModelInstance?.producer
        ]"/>
    </g:if>
</span>


<script type="text/javascript">
    function producerChanged(producer, ProducerProductModelId) {
        $.ajax({
            url:'<g:createLink action="producingProduct" controller="producerProductModel"/>',
            data:{
                producer:producer.id,
                ProducerProductModelId : ProducerProductModelId

            },
            type:'GET'
        }).done(function(response){
                    $(producer)
                            .parent()
                            .find(".producingProducts")
                            .html("")
                            .append(response)
                })
    }
</script>
