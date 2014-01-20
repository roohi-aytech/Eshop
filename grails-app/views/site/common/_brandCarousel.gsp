
<link href="${resource(dir: 'css', file: 'jquery.themepunch.showbizpro.css')}" rel="stylesheet" type="text/css"/>
<script language="javascript" src="${resource(dir: 'js', file: 'jquery.themepunch.plugins.js')}" type="text/javascript"></script>
<script language="javascript" src="${resource(dir: 'js', file: 'jquery.themepunch.showbizpro.js')}" type="text/javascript"></script>

<g:set var="id" value="${java.util.UUID.randomUUID()}"></g:set>

<h3 class="showbiz-header"><g:message code="brand.select"/></h3>
<table class="table-simulated band-carousel-container">
    <tr class="table-row">
        <td class="showbiz-navigation center sb-nav-dark table-cell">

            <div class="sb-navigation-right" id="showbiz_right_${id}"><i class="icon-right-open"></i></div>

        </td>

        <td id="carousel_${id}" class="showbiz-container table-cell">
            <div class="showbiz" data-left="#showbiz_left_${id}" data-right="#showbiz_right_${id}">
                <div class="overflowholder">
                    <ul class="brand-carousel">
                        <g:each in="${brands}" var="brand">
                            <li class="sb-showcase-skin checkable ${(selectedBrands?.contains(brand._id?.id) ? 'active' : '')}">
                                <g:if test="${type == 'filter'}">
                                    <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}" f="${params.f}"
                                                          remove="${(selectedBrands?.contains(brand._id?.id)).toString()}"
                                                          type="icon"></eshop:filterAddBrand>

                                </g:if>
                                <g:else>
                                    <eshop:filterStartBrand productType="${productType}" brandId="${brand._id?.id}"
                                                            brandName="${brand._id?.name}"
                                                            type="icon"></eshop:filterStartBrand>
                                </g:else>
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

        var itemsCount = ${brands.count{it}};

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
            var carousel = $('#carousel_${id} .brand-carousel');
            carousel.parent().parent().parent().parent().replaceWith(carousel);
            carousel.removeClass('brand-carousel').addClass('static-brand-carousel');
        }
    });

</script>



