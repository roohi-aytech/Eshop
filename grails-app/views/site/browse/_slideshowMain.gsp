<div class="slideshowContainer">
    <center>
        <div id="slideshowMain">
            <g:each in="${slides}" var="slide">
                <a href="${slide.url}" target="_blank">
                    <img src="<g:createLink controller="image" params="[id: slide?.id, type: 'slide']"/>"
                         alt="${slide.name}"/>
                    <g:if test="${slide.description}">
                    <span>
                        ${slide.description}
                    </span>
                    </g:if>
                </a>
            </g:each>

        </div>

        <div class="baseLine">

        </div>
    </center>
</div>
<script>
    $('#slideshowMain').coinslider(
            {
                width: 580,
                height: 300,
                delay: 4000
            });
</script>