<select name="product" class="imageCombo" id="productCombo${productTypeId}">
    <g:each in="${products}" var="product">
        <option value="${product.id}"
                data-image="${createLink(controller: 'image', params: [type: 'product', id: product.id], wh: '50x50')}">${product.name}</option>
    </g:each>
</select>

<a class="btn btn-primary" style="height: 23px;margin-top:-1px;" onclick="addProductToCompareListAndShow(${productTypeId});"><g:message
        code="add-to-compareList"/></a>

<script language="javascript" type="text/javascript">
    try {
        $(".imageCombo").msDropDown();
    } catch (e) {
    }
</script>