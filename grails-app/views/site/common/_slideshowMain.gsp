<g:if test="${slides && !slides.isEmpty()}">
    <link href="${resource(dir: 'css', file: 'responsive.slider.css')}" rel="stylesheet" type="text/css"/>

    <ul class="responsive-slider" height="420">
        <g:each in="${slides}" var="slide">
            <li>
                <g:if test="${slide.url}">
                    <a href="${slide.url}">
                </g:if>
                <img alt="${slide.name}"
                     src="${createLink(controller: "image", action: "index")}/${slide.id}?type=mainSlide"/>
                <g:if test="${slide.url}">
                    </a>
                </g:if>
            </li>
        </g:each>
    </ul>

    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.easing.1.3.js')}" type="text/javascript"></script>
    <script language="javascript" src="${resource(dir: 'js', file: 'responsive.slider.js')}" type="text/javascript"></script>


</g:if>