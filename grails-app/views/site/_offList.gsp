<div class="moduleHeader">تخفیف های جاری</div>
<div class="moduleConetnt">
	<div class="offListList" >
		<g:each in="${newProducts}">
            <g:render template="product_summary" model="[product:it]"/>
		</g:each>
	</div>
</div>
