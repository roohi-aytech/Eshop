<g:javascript src="cloudzoom.js"/>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'cloudzoom.css')}" type="text/css">

<g:javascript>
    CloudZoom.quickStart();
</g:javascript>

<div>
    <center>
        <div class="product-image">
            <img id="zoomPane" class="cloudzoom" src="<g:createLink controller="image"
                                                                    params="[id: product?.id, wh: '300x300']"/>"
                 data-cloudzoom="zoomImage: '<g:createLink controller="image"
                                                           params="[id: product?.id, wh: 'max']"/>'"/>
        </div>
    </center>
</div>

<div><center>
    <g:each in="${product?.images}">
        <a href="#" class="cloudzoom-gallery"
           data-cloudzoom="useZoom: '#zoom1', image: '<g:createLink controller="image"
                                                                    params="[id: product?.id, name: it.name, wh: '300x300']"/>', zoomImage: '<g:createLink
                   controller="image"
                   params="[id: product?.id, name: it.name, wh: '500x500']"/>'">
            <img src="<g:createLink controller="image"
                                    params="[id: product?.id, name: it.name, wh: '50x50']"/>"/>
        </a>
    </g:each>
</center>
</div>


