<g:javascript src="cloud-zoom.js"/>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'cloud-zoom.css')}" type="text/css">
<div>
<div class="image-zoomable">
    <a href="<g:createLink controller="image"
                           params="[id: product?.id, name: product?.images?.find()?.name, wh: true]"/>"
       class="cloud-zoom" id='zoom1'
       rel="adjustX: -10, adjustY:-4, zoomWidth:500, zoomHeight:400">

        <img src="<g:createLink controller="image"
                                params="[id: product?.id, wh: '400x400']"/>"/>
    </a>
</div>
</div>
<div class="image-additional">
    <g:each in="${product?.images}">
        <a href="<g:createLink controller="image"
                               params="[id: product?.id, name: it.name, wh: true]"/>"
           class="cloud-zoom-gallery"
           rel="useZoom: 'zoom1', smallImage: '<g:createLink controller="image"
                                                             params="[id: product?.id, name: it.name, wh: '400x400']"/>' ">
            <img src="<g:createLink controller="image"
                                    params="[id: product?.id, name:it.name, wh: '50x50']"/>"
                 id="img${it.id}"/>
        </a>
    </g:each>
</div>


