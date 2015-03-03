<g:if test="${vertical}">
    <div class="mostSold">
        <div class="mostSoldImage">
            <a href="<g:createLink action="category" params="[id:product.id]"/>">
                <img src="<g:createLink controller="image" action="index" params="[id:product.id,wh: '200x200']"/>" />
            </a>
        </div>
        <div class="mostSoldinfo">
            <div class="mostSoldDesc">
                <a href="<g:createLink action="category" params="[id:product.id]"/>">${product}</a>
            </div>
            <div class="mostSoldPrice">
                Price$
            </div>
        </div>
    </div>
</g:if>
<g:else>
    <div class="newProduct">
        <div class="newProductImage">
            <a href="<g:createLink action="product" params="[id:product.id]"/>">
                <img src="<g:createLink controller="image" action="index" params="[id:product.id,wh: '200x200']"/>" />
            </a>
        </div>
        <div class="newProductDesc">
            <a href="<g:createLink action="product" params="[id:product.id]"/>">${product}</a>
        </div>
        <div class="newProductPrice">
            Price$
        </div>
    </div>
</g:else>