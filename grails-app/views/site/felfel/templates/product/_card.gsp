<script language="javascript" type="text/javascript">

    var selectedAddedValues = [${selectedAddedValues.collect{it.id}.join(',')}];
    $(document).ready(function () {
        $('#selectedAddedValues').val(selectedAddedValues.toString());
    });
    function addToBasket(id, name, price) {
        var scope = angular.element(document.getElementById('main-container')).scope();
        scope.selectedAddedValues = selectedAddedValues;
        scope.addToBasket(id, name, price, selectedAddedValues);
    }

    function addOrRemoveAddedValue(item) {

        var i = selectedAddedValues.indexOf(parseInt($(item).val()));
        if (i != -1)
            selectedAddedValues.splice(i, 1);
        else
            selectedAddedValues[selectedAddedValues.length] = parseInt($(item).val());

        $('#selectedAddedValues').val(selectedAddedValues.toString());
        var $form = $("#productVariationForm");
        var serializedData = $form.serialize();
        %{--$('#product-card').html('${message(code: 'waiting')}');--}%
        angular.element(document.getElementById('main-container')).scope().reloadProductCart("${createLink(controller: "site", action: "productCard")}", serializedData, $('#product-card'));
    }
</script>

<g:if test="${productModel && productModel.status == 'exists'}">
    <div class="product_title">
        <h1 itemprop="name">
            ${productModel?.product?.productTypes?.find {
                true
            }?.name ?: ""} ${productModel?.product?.type?.title ?: ""} ${productModel?.product?.brand?.name ?: ""} <g:message code="productModel"/> ${productModel?.name ?: ""}
        </h1>
    </div>

    <div class="clearfix"></div>
    <g:render template="/site/felfel/templates/product/price"
              key="${params.id}"
              model="${[product: product, productModel: productModel]}"/>
</g:if>
<g:else>
    <div class="product_title">
        <h1 itemprop="name">${product}</h1>
    </div>
    <div class="clearfix"></div>

    <div class="price_block">
        <g:message code="product.model.notExists"/>
    </div>
</g:else>
