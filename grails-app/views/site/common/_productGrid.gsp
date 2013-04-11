<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.themepunch.megafoliopro.css')}" type="text/css">
<g:javascript src="grid.js"></g:javascript>
<g:javascript src="grid.modernizr.custom.js"></g:javascript>

<div class="previewheader" style="position: relative;">

    <div class="container-fullwidth">

        <!-- The GRID System -->
        <div class="megafolio-container">

            <g:each in="${productIds}" status="i" var="productId">
                <g:set var="product" value="${eshop.Product.get(productId)}"/>
                <g:if test="${product}">
                    <div class="mega-entry" data-src="<g:createLink action="image" params="[id: product?.id, wh: '150x150']"/>">
                        %{--<div style="height: 300px;">--}%
                            %{--<g:render template="product_search" model="${[product:product]}"></g:render>--}%
                        %{--</div>--}%
                        <div>
                            <a class="fancybox" rel="group" title="Youtube Video"
                               href="<g:createLink action="image" params="[id: product?.id, wh: '150x150']"/>"><div class="mega-hoverview"></div></a>
                        </div>

                        <div class="gallerycaption-bottom">Youtube Video<div class="gallerysubline">Category Two</div>
                        </div>
                    </div>
                %{--<g:render template="product_search" model="[product: product,]"/>--}%
                </g:if>
            </g:each>

        </div>
    </div>

</div>

<script type="text/javascript">


    jQuery(document).ready(function () {

        var ie = jQuery.browser.msie && parseInt(jQuery.browser.version, 0) < 9;
        var ie9 = jQuery.browser.msie && parseInt(jQuery.browser.version, 0) == 9;
        if (ie) jQuery('body').addClass("ie8");
        if (ie9) jQuery('body').addClass("ie9");

        jQuery('.megafolio-container').megafoliopro(
                {
                    filterChangeAnimation: "rotatescale",			// fade, rotate, scale, rotatescale, pagetop, pagebottom,pagemiddle
                    filterChangeSpeed: 600,					// Speed of Transition
                    filterChangeRotate: 10,					// If you ue scalerotate or rotate you can set the rotation (99 = random !!)
                    filterChangeScale: 0.6,					// Scale Animation Endparameter
                    delay: 20,
                    defaultWidth: 980,
                    paddingHorizontal: 5,
                    paddingVertical: 5,
                    layoutarray: [11]		// Defines the Layout Types which can be used in the Gallery. 2-9 or "random". You can define more than one, like {5,2,6,4} where the first items will be orderd in layout 5, the next comming items in layout 2, the next comming items in layout 6 etc... You can use also simple {9} then all item ordered in Layout 9 type.

                });
    });

</script>


