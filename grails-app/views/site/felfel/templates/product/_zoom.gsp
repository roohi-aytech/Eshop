<%@ page import="com.sun.xml.internal.messaging.saaj.util.ByteInputStream; javax.imageio.ImageIO" %>

<script language="javascript" src="${resource(dir: 'js', file: 'jquery.etalage.js')}" type="text/javascript"></script>
<link href="${resource(dir: 'css', file: 'jquery.etalage.css')}" rel="stylesheet" type="text/css"/>

<script language="javascript" type="text/javascript">
    jQuery(document).ready(function ($) {
        $('#etalage').etalage({
            source_image_width: 900,
            source_image_height: 900,
            thumb_image_width: 382,
            zoom_area_width: $('.product_detail_right_block').width(),
            zoom_area_height: Math.max($('#etalage').height() + 2, 450),
            zoom_area_distance: 20,
            small_thumbs: 4,
            smallthumb_inactive_opacity: 0.3,
            smallthumbs_position: 'right',
            show_icon: false,
            autoplay: false,
            keyboard: false,
            zoom_easing: true,
            smallthumb_hide_single: false,
            show_hint: true,
            <g:if test="${!quickView}">
            click_callback: function (image_anchor, instance_id) {

                $("#myModal .modal-body").html('<img class="loading" src="${resource(dir: 'images', file: 'loading.gif')}"/>');
                $("#myModal").modal({
                    backdrop: false,
                    show: true
                });
                $("#myModal .modal-body").load('${createLink(controller: 'site', action: 'productImage', params: [id: product?.id])}?img=' + image_anchor.replace('#', ''), function () {
                });
            }
            </g:if>
        });

        $(".etalage_small_thumbs ul li img[src$='50x50']").parent().fadeIn();
    });
</script>

<ul id="etalage">

    <g:set var="mainImage" value="${product?.mainImage}"/>
    <g:if test="${mainImage}">
        <li>
            <g:if test="${!quickView}">
                <a href='${mainImage?.id}' >
            </g:if>
            <g:set var="image"
            value="${ImageIO.read(new ByteInputStream(mainImage?.fileContent, mainImage?.fileContent?.length))}"/>
            <img class="etalage_thumb_image" zoomable="${mainImage?.dynamicProperties?.zoomable ? '1' : '0'}"
                 width="50" height="50" itemprop="image"
                 src="<g:createLink controller="image"
                                    params="[id: product?.id, name: mainImage?.name, wh: '400x400']"/>"/>
            <img class="etalage_source_image"
                 src="<g:createLink controller="image"
                                    params="[id: product?.id, name: mainImage?.name, wh: 'max']"/>"/>

            <g:if test="${!quickView}">
                </a>
            </g:if>
        </li>
    </g:if>
    <g:each in="${product?.images?.findAll { it?.name != product?.mainImage?.name }}">
        <li>
            <g:if test="${!quickView}">
                <a href='#${it?.id}'>
            </g:if>
            <g:set var="image" value="${ImageIO.read(new ByteInputStream(it.fileContent, it.fileContent.length))}"/>
            <img class="etalage_thumb_image" zoomable="${mainImage?.dynamicProperties?.zoomable ? '1' : '0'}"
                 width="50" height="50"
                 src="<g:createLink controller="image" params="[id: product?.id, name: it.name, wh: '400x400']"/>"/>
            <img class="etalage_source_image"
                 src="<g:createLink controller="image" params="[id: product?.id, name: it.name, wh: 'max']"/>"/>
            <g:if test="${!quickView}">
                </a>
            </g:if>
        </li>
    </g:each>
</ul>

<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="window" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    </div>

    <div class="modal-body">
    </div>
</div>



