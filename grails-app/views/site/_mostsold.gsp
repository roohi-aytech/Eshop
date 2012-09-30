<div class="moduleHeader">پرفروش ترین ها</div>
<div class="moduleConetnt">
	<div class="mostSoldList" >
		<g:each in="${newProducts}">
			<div class="mostSold">
				<div class="mostSoldImage">
					<a href="<g:createLink action="category" params="[id:it.id]"/>">
						<img src="<g:createLink action="image" params="[id:it.id]"/>" />
					</a>
				</div>
				<div class="mostSoldinfo">
					<div class="mostSoldDesc">
						<a href="<g:createLink action="category" params="[id:it.id]"/>">${it}</a>
					</div>
					<div class="mostSoldPrice">
						Price$
					</div>
				</div>
			</div>            
		</g:each>
	</div>
</div>
