
<link href="${resource(dir: 'css', file: 'jquery.themepunch.showbizpro.css')}" rel="stylesheet" type="text/css"/>
<link href="${resource(dir: 'css', file: 'gray.min.css')}" rel="stylesheet" type="text/css"/>
<script language="javascript" src="${resource(dir: 'js', file: 'jquery.themepunch.plugins.js')}" type="text/javascript"></script>
<script language="javascript" src="${resource(dir: 'js', file: 'jquery.themepunch.showbizpro.js')}" type="text/javascript"></script>
<script language="javascript" src="${resource(dir: 'js', file: 'jquery.gray.min.js')}" type="text/javascript"></script>

<g:set var="id" value="${java.util.UUID.randomUUID()}"/>

<div class="producttype-carosel-header">
    <h3 class="showbiz-header"><g:message code="brand.select"/></h3>
</div>
<table class="table-simulated band-carousel-container">
    <tr class="table-row">
        <td class="showbiz-navigation center sb-nav-dark table-cell">

            <div class="sb-navigation-right" id="showbiz_right_${id}"><i class="icon-right-open"></i></div>

        </td>

        <td id="carousel_${id}" class="showbiz-container table-cell fullwidth">
            <div class="showbiz" data-left="#showbiz_left_${id}" data-right="#showbiz_right_${id}">
                <div class="overflowholder">
                    <ul class="brand-carousel">
                        <g:each in="${brands}" var="brand">
                            <li class="sb-showcase-skin checkable ${(selectedBrands?.contains(brand._id?.id) ? 'active' : '')}">
                                <g:if test="${type == 'filter'}">
                                    <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}" f="${params.f}"
                                                          remove="${(selectedBrands?.contains(brand._id?.id)).toString()}"
                                                          type="icon" class="grayscale grayscale-fade"/>

                                </g:if>
                                <g:else>
                                    <eshop:filterStartBrand productType="${productType}" brandId="${brand._id?.id}"
                                                            brandName="${brand._id?.name}"
                                                            type="icon"  class="grayscale grayscale-fade"/>
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
        var width = $('#carousel_${id}').width();
        var visibleCount = Math.floor(width / 100);

        if (itemsCount > visibleCount) {
            jQuery('#carousel_${id}').showbizpro({
                elementSize:130
            });
        }
        else {
            var carousel = $('#carousel_${id}').find('.brand-carousel');
            carousel.parent().parent().parent().parent().replaceWith(carousel);
            carousel.removeClass('brand-carousel').addClass('static-brand-carousel');
        }

        //show top 8 brand images
        var brandItems = $('.brand-carousel li a img, .static-brand-carousel li a img');
        if (brandItems.length > visibleCount)
            brandItems = brandItems.slice(0, visibleCount);
        brandItems.each(function () {
            if ($(this).attr('src') != $(this).attr('data-src'))
                $(this).attr('src', $(this).attr('data-src'));
        });
    });

</script>



