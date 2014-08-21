<%@ page import="eshop.Product" %>

<div class="thumbnail mediaholder">
    <a href="<g:createLink uri="/product/${productModel?.product?.id}?model=${productModel?.id}"/>">
        <img src="${createLink(controller: 'image', params: [id: productModel?.id, wh: '150x150', type: 'productModel'])}"/>

        <div class="title">
            <h4>${productModel?.product?.manualTitle ? productModel?.product?.pageTitle :
                "<span>${productModel?.product?.productTypes?.find {true}?.name?:""} ${productModel?.product?.type?.title?:""} ${productModel?.product?.brand?.name?:""}</span><br/> ${message(code:'productModel')} ${productModel.name?:""}"}</h4>
            %{--<h4>${productModel}</h4>--}%
            <eshop:thumbnailPrice productModelId="${productModel?.id}" flag="true"/>

            <g:if test="${modelCount > 1}">
            <span class="modelCount-flag">
                <g:message code="modelCount-flag" args="${[modelCount]}"/>
            </span>
            </g:if>
            <div class="clear-float"></div>
        </div>

        <div class="attributes scrollable"
             onmousedown="event.preventDefault ? event.preventDefault() : event.returnValue = false">
            <div class="attribute-list">
                <g:each in="${productModel?.product?.attributes?.findAll{it.attributeType.showPositions.contains('productList') && it.value && it.value.toString().compareTo("N/A") != 0}?.sort{it.attributeType.sortIndex}}">
                    %{--<g:if test="${it.attributeType.showPositions.contains('productList') && it.value.toString().compareTo("N/A") != 0}">--}%
                        <div><b>${it.attributeType}:</b> ${it.value.toString().contains('\n')? '<br/>' + it.value.toString().replace('\n', '<br/>'): it.value}</div>
                    %{--</g:if>--}%
                </g:each>
                <div><b><g:message code="guarantee"/>:</b> ${productModel?.product?.guaranteeList?.collect{it.toString()}?.join('، ')}</div>
            </div>
        </div>
    </a>
    <div class="tips-container"></div>
    <div class="buttons">
        <eshop:specifications productModelId="${productModel?.id}"/>
        <eshop:addToCompareList prodcutId="${productModel?.product?.id}"/>
        <eshop:addToBasket prodcutModelId="${productModel?.id}" buttonOnly="${true}"/>
    </div>
</div>
