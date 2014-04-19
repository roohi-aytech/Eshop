<h3 class="category_heading">
    ${itemTitle}
</h3>
<g:each in="${productTypes}" status="i" var="pt">
    <g:if test="${i % rowSize == 0}">
        <div class="row">
    </g:if>
    <g:set var="productType" value="${eshop.ProductType.get(pt)}"/>
    <g:if test="${productType}">
        <g:render template="/site/${grailsApplication.config.eShop.instance}/templates/productTypeThumbnail"
                  model="[id: productType.id, name: productType.name, description: productType.description, href:createLink(uri:'/browse/' + productType.seoFriendlyName), className: 'column' + rowSize]"/>
    </g:if>
    <g:if test="${i % rowSize == rowSize - 1 || i == productTypes.size() - 1}">
        </div>
    </g:if>
</g:each>