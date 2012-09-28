<div class="moduleHeader"></div>
<div class="moduleConetnt">	
	<div class="slideShowDiv" >
		<g:each in="${newProducts}">
			<div class="slideShowItem">
				<div class="slideShowImage">
					<a href="<g:createLink action="category" params="[id:it.id]"/>">
						<img src="<g:createLink action="image" params="[id:it.id]"/>" />
					</a>
				</div>
				<div class="slideShowDesc">
					<a href="<g:createLink action="category" params="[id:it.id]"/>">${it}</a>
				</div>
				<div class="slideShowPrice">
					Price$
				</div>
			</div>            
		</g:each>
	</div>
</div>
