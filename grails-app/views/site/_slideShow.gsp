
<script type="text/javascript">
	  $(document).ready(function(){
		$('#slider1').bxSlider();
	  });
</script>
<div class="moduleHeader"></div>
<div class="slideModuleConetnt">	
	<div class="slideShowDiv" id="slider1" >
		<g:each in="${newProducts}">
			<div class="slideShowItem">
				<div class="slideShowImage">
					<a href="<g:createLink action="category" params="[id:it.id]"/>">
						<img src="<g:createLink action="image" params="[id:it.id,wh:'300x300']"/>" />
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
