<div class="moduleHeader">جدیدترین محصولات</div>
<div class="moduleConetnt">
	<div class="newProductList" >
		<g:each in="${newProducts}">
            <g:render template="product_summary" model="[product:it]"/>
		</g:each>
	</div>
</div>
