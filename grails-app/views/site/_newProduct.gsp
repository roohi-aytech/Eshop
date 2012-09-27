
<div class="newProductList" >
            <g:each in="${newProducts}">
                
				<div class="newProduct">
					<div class="newProductImage">
						<a href="<g:createLink action="category" params="[id:it.id]"/>">
							<img src="<g:createLink action="image" params="[id:it.id]"/>" />
						</a>
					</div>
					<div class="newProductDesc">
						<a href="<g:createLink action="category" params="[id:it.id]"/>">${it}</a>
					</div>
					<div class="newProductPrice">
						Price$
					</div>
				</div>
                
            </g:each>
</div>
