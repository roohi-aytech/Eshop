<div class="moduleHeader">تخفیف های جاری</div>
<div class="moduleConetnt">
	<div class="offListList" >
		<g:each in="${newProducts}">
			<div class="offList">
				<div class="offListImage">
					<a href="<g:createLink action="category" params="[id:it.id]"/>">
						<img src="<g:createLink action="image" params="[id:it.id]"/>" />
					</a>
				</div>
				<div class="offListDesc">
					<a href="<g:createLink action="category" params="[id:it.id]"/>">${it}</a>
				</div>
				<div class="offListPrice">
					Price$
				</div>
			</div>            
		</g:each>
	</div>
</div>
