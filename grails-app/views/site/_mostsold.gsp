<div class="moduleHeader">پرفروش ترین ها</div>
<div class="moduleConetnt">
	<div class="mostSoldList" >
		<g:each in="${newProducts}">
            <g:render template="product_summary" model="[product:it,vertical:true]"/>
		</g:each>
	</div>
</div>
