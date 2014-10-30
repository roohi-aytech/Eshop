<script type="text/javascript" src="${resource(dir: 'js/mobile', file: 'jquery.cycle.all.js')}"></script>


<div class="home_slider">

    <g:each in="${slides}" var="slide">
        <a href="${slide.url ?: '#'}">
            <img alt="${slide.name}"
                 src="${createLink(controller: "image", action: "index")}/${slide.id}?type=mainSlide"/>
        </a>
    </g:each>
</div>

<div id="slider_pager">&nbsp;</div>