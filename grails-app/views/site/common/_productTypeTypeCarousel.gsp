<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.themepunch.showbizpro.css')}" type="text/css">
<g:javascript src="jquery.themepunch.plugins.js"></g:javascript>
<g:javascript src="jquery.themepunch.showbizpro.js"></g:javascript>
<g:set var="id" value="${java.util.UUID.randomUUID()}"></g:set>
<table class="table-simulated productTypeType-carousel-container">
    <tr>
        <td class="showbiz-navigation center sb-nav-dark table-cell">

            <div class="sb-navigation-right" id="showbiz_right_${id}"><i class="icon-right-open"></i></div>

        </td>

        <td id="carousel_${id}" class="showbiz-container table-cell">
            <div class="showbiz" data-left="#showbiz_left_${id}" data-right="#showbiz_right_${id}">
                <div class="overflowholder">
                    <ul class="productTypeType-carousel">
                        <g:each in="${productTypeTypeLinks}" var="productTypeTypeLink">
                            <li class="sb-showcase-skin">
                                <a href="${productTypeTypeLink.href}">
                                    <img src="${createLink(controller: 'image', params: [type: 'productTypeType', id: productTypeTypeLink.id, wh: '100x100'])}"
                                         alt="${productTypeTypeLink.name}">

                                    <div>${productTypeTypeLink.name}</div>
                                </a>
                            </li>
                        </g:each>
                    </ul>

                    <div class="sbclear"></div>
                </div>

                <div class="sbclear"></div>
            </div>
        </td>

        <td class="showbiz-navigation center sb-nav-dark table-cell">
            <div class="sb-navigation-left" id="showbiz_left_${id}"><i class="icon-left-open"></i></div>

        </td>
    </tr>
</table>

<div class="sb-clear"></div>

<script type="text/javascript">

    jQuery(document).ready(function () {

        var itemsCount = ${productTypeTypeLinks.count{it}};

        var visibleElementsArray;
        <g:if test="${mode=='large'}">
        visibleElementsArray = [6, 5, 4, 3];
        </g:if>
        <g:else>
        visibleElementsArray = [8, 7, 6, 5];
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
        else {
            var carousel = $('#carousel_${id} .productTypeType-carousel');
            carousel.parent().parent().parent().parent().replaceWith(carousel);
            carousel.removeClass('productTypeType-carousel').addClass('static-productTypeType-carousel');
        }
    });

</script>