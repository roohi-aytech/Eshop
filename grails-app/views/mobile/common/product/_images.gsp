<%@ page import="com.sun.xml.internal.messaging.saaj.util.ByteInputStream; javax.imageio.ImageIO" %>
<% def imageService = grailsApplication.classLoader.loadClass('eshop.ImageService').newInstance() %>
<g:set var="mainImage" value="${productModel?.mainImage ?: product?.mainImage}"/>
<g:set var="imageIndex" value="${0}"/>
<div class="product_images swatchwhite">
<div id="product_slider">

    <g:if test="${mainImage && imageService.imageBelongsToModel(mainImage, productModel)}">
        <div class="product_slides" id="product_slide1">
            <a href="<g:createLink controller="image"
                                   params="[id: product?.id, name: mainImage?.name, wh: 'max']"/>" class="item bbq"
               data-q="filters" rel="popup" data-relid="${imageIndex}">
                <span>
                    <img class="lazy" src="${resource(dir: 'images/mobile', file: 'grey.gif')}"
                         data-src="<g:createLink controller="image"
                                                 params="[id: product?.id, name: mainImage?.name, wh: '400x400']"/>"/>
                </span>
            </a>
        </div>
    </g:if>

    <g:set var="slideIsClosed" value="${true}"/>
    <g:each in="${product?.images?.findAll {
        it?.name != mainImage?.name && imageService.imageBelongsToModel(it, productModel)
    }?.sort { it.id }}" var="image" status="index">

        <g:set var="imageIndex" value="${imageIndex + 1}"/>
        <g:if test="${index % 2 == 0}">

            <div class="product_slides">
            <g:set var="slideIsClosed" value="${false}"/>
        </g:if>
        <a href="<g:createLink controller="image" params="[id: product?.id, name: image.name, wh: 'max']"/>"
           class="item bbq" data-q="filters" rel="popup" data-relid="${imageIndex}">
            <span>
                <img class="lazy" src="${resource(dir: 'images/mobile', file: 'grey.gif')}"
                     data-src="<g:createLink controller="image"
                                             params="[id: product?.id, name: image.name, wh: '200x200']"/>"/>
            </span></a>
        <g:if test="${index % 2 != 0}">
            </div>
            <g:set var="slideIsClosed" value="${true}"/>
        </g:if>
    </g:each>
    <g:if test="${!slideIsClosed}">
        </div>
    </g:if>
</div>
</div>

<div id="overlay">
</div>

<div id="image_popup">
    <span class="img_tap_msg"><g:message code="tapToZoom"/></span>
    <img src="http://i1.pepperfry.com/img/m/spacer.gif" class="max_img" alt=""/>

    <div class="close_overlay" data-ctype="popup" data-q="filters-back"></div>
    <a href="#" id="prev_prod" title="Prev">&nbsp;</a>
    <a href="#" id="next_prod" title="Next">&nbsp;</a>

    <div class="loading" id="loadimage" style="display:none;"><g:message code="waiting"/></div>
</div>



<script type="text/javascript" src="${resource(dir: 'js/mobile', file: 'vip.js')}"></script>
<g:if test="${lazyLoad}">
    <script language="javascript" type="text/javascript">
        $('img.lazy').each(function(){
            $(this).attr('src', $(this).attr('data-src'));
        });
    </script>
</g:if>