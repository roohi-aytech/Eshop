<g:javascript src="jquery.etalage.js"/>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.etalage.css')}" type="text/css">

<g:javascript>
    jQuery(document).ready(function ($) {
        $('#etalage').etalage({
            thumb_image_width: 250,
            thumb_image_height: 250,
            source_image_width: 900,
            source_image_height: 900,
            zoom_area_width: $('#product-description-area').width(),
            zoom_area_height: $('#product-description-area').height() + 80,
            zoom_area_distance: 5,
            small_thumbs: 4,
            smallthumb_inactive_opacity: 0.3,
            smallthumbs_position: 'left',
            show_icon: false,
            autoplay: true,
            keyboard: false,
            zoom_easing: true,
            show_hint: true,
            click_callback: function (image_anchor, instance_id) {
                $("#myModal .modal-body").load('${createLink(controller: 'site', action: 'productImage', params: [id: product?.id])}?img=' + image_anchor, function() {
                     $("#myModal").modal({
                        backdrop: false,
                        show: true
                        });
                });
            }
        });
    });
</g:javascript>

<ul id="etalage">
    <g:each in="${product?.images}">
        <li>
            <a href="${it.id}">
                <img class="etalage_thumb_image"
                     src="<g:createLink controller="image" params="[id: product?.id, name: it.name, wh: '300x300']"/>"/>
                <img class="etalage_source_image"
                     src="<g:createLink controller="image" params="[id: product?.id, name: it.name, wh: 'max']"/>"/>
            </a>
        </li>
    </g:each>
</ul>

<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="window" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        %{--<h3 id="myModalLabel">${product}</h3>--}%
    </div>

    <div class="modal-body">
    </div>
    %{--<div class="modal-footer">--}%
    %{--<button class="btn" data-dismiss="modal" aria-hidden="true"><g:message code="close"/> </button>--}%
    %{--</div>--}%
</div>



