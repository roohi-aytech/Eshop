<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.themepunch.showbizpro.css')}" type="text/css">
<g:javascript src="jquery.themepunch.plugins.js"></g:javascript>
<g:javascript src="jquery.themepunch.showbizpro.js"></g:javascript>
<h3>${title}</h3>
<g:set var="id" value="${java.util.UUID.randomUUID()}"></g:set>
<div class="table">
    <div class="showbiz-navigation center sb-nav-dark table-cell">

        <div class="sb-navigation-right" id="showbiz_right_${id}"><i class="icon-right-open"></i></div>

    </div>

    <div id="carousel_${id}" class="showbiz-container table-cell">
        <div class="showbiz" data-left="#showbiz_left_${id}" data-right="#showbiz_right_${id}">
            <div class="overflowholder">
                <ul class="product-carousel">
                    <g:each in="${productList}" var="product">
                        <li class="sb-showcase-skin">
                            <g:render template="/site/common/productThumbnail" model="${[product: product]}"></g:render>
                        </li>
                    </g:each>
                </ul>

                <div class="sbclear"></div>
            </div>

            <div class="sbclear"></div>
        </div>
    </div>

    <div class="showbiz-navigation center sb-nav-dark table-cell">
        <div class="sb-navigation-left" id="showbiz_left_${id}"><i class="icon-left-open"></i></div>

    </div>
</div>

<div class="sb-clear"></div>

<script type="text/javascript">

    jQuery(document).ready(function () {

        var itemsCount = ${productList.count{it}};

        var visibleElementsArray;
        <g:if test="${mode=='large'}">
        visibleElementsArray = [6, 5, 4, 3];
        </g:if>
        <g:else>
        visibleElementsArray = [5, 4, 3, 2];
        </g:else>
        var width = $('#carousel_${id}').width();
        var visibleCount;
        if (width > 980) {
            visibleCount = visibleElementsArray[0]
        }
        if (width < 981 && width > 768) {
            visibleCount = visibleElementsArray[1]
        }
        if (width < 769 && width > 420) {
            visibleCount = visibleElementsArray[2]
        }
        if (width < 421) {
            visibleCount = visibleElementsArray[3]
        }

        if (itemsCount > visibleCount) {
            jQuery('#carousel_${id}').showbizpro({
                dragAndScroll: "of",
                visibleElementsArray: visibleElementsArray,
                carousel: "on"
            });
        }
        else{
            var carousel = $('#carousel_${id} .product-carousel');
            carousel.parent().parent().parent().parent().replaceWith(carousel);
            carousel.removeClass('product-carousel').addClass('static-product-carousel').addClass('showbiz');
        }
    });

</script>



