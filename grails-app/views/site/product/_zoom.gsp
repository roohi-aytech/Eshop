<%@ page import="com.sun.xml.internal.messaging.saaj.util.ByteInputStream; javax.imageio.ImageIO" %>

<g:javascript src="jquery.etalage.js"/>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.etalage.css')}" type="text/css">

<g:javascript>
    jQuery(document).ready(function ($) {
        $('#etalage').etalage({
//            thumb_image_width: 250,
//            thumb_image_height: 250,
            source_image_width: 900,
            source_image_height: 900,
            zoom_area_width: $('#product-description-area').width(),
            zoom_area_height: Math.max($('#product-description-area').height(), 300),
            zoom_area_distance: 20,
            small_thumbs: 4,
            smallthumb_inactive_opacity: 0.3,
            smallthumbs_position: 'bottom',
            show_icon: false,
            autoplay: false,
            keyboard: false,
            zoom_easing: true,
            show_hint: true,
            click_callback: function (image_anchor, instance_id) {
//                if($('a[href=' + image_anchor + '] img.etalage_thumb_image').attr('zoomable') == '0')
//                    return;
                $("#myModal .modal-body").html('<img class="loading" src="${resource(dir: 'images', file: 'loading.gif')}"/>');
                $("#myModal").modal({
                        backdrop: false,
                        show: true
                        });
                $("#myModal .modal-body").load('${createLink(controller: 'site', action: 'productImage', params: [id: product?.id])}?img=' + image_anchor, function() {});
            }
        });

        $(".etalage_small_thumbs ul li img[src$='50x50']").parent().fadeIn();
    });
</g:javascript>

<ul id="etalage">

    <g:set var="mainImage" value="${product?.mainImage}"/>
    <g:if test="${mainImage}">
        <li>
            <a href='${mainImage?.id}' >
                <g:set var="image"
                       value="${ImageIO.read(new ByteInputStream(mainImage?.fileContent, mainImage?.fileContent?.length))}"/>
                <img class="etalage_thumb_image" zoomable="${mainImage?.dynamicProperties?.zoomable ? '1' : '0'}"
                     width="50" height="50" itemprop="image"
                     src="<g:createLink controller="image"
                                        params="[id: product?.id, name: mainImage?.name, wh: '300x300']"/>"/>
                <img class="etalage_source_image"
                     src="<g:createLink controller="image"
                                        params="[id: product?.id, name: mainImage?.name, wh: 'max']"/>"/>
            </a>
        </li>
    </g:if>
    <g:each in="${product?.images?.findAll { it?.name != product?.mainImage?.name }}">
        <li>
            <a href='#${mainImage?.id}' >
                <g:set var="image" value="${ImageIO.read(new ByteInputStream(it.fileContent, it.fileContent.length))}"/>
                <img class="etalage_thumb_image" zoomable="${mainImage?.dynamicProperties?.zoomable ? '1' : '0'}"
                     width="50" height="50"
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



