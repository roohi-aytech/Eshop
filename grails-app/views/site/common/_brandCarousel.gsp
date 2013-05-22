<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.themepunch.showbizpro.css')}" type="text/css">
<g:javascript src="jquery.themepunch.plugins.js"></g:javascript>
<g:javascript src="jquery.themepunch.showbizpro.js"></g:javascript>
%{--<h3 class="band-carousel-container-title">${title}</h3>--}%
<g:set var="id" value="${java.util.UUID.randomUUID()}"></g:set>
<div class="table band-carousel-container">
    <div class="showbiz-navigation center sb-nav-dark table-cell">

        <div class="sb-navigation-right" id="showbiz_right_${id}"><i class="icon-right-open"></i></div>

    </div>

    <div id="carousel_${id}" class="showbiz-container table-cell">
        <div class="showbiz" data-left="#showbiz_left_${id}" data-right="#showbiz_right_${id}">
            <div class="overflowholder">
                <ul class="brand-carousel">
                    <g:each in="${brands}" var="brand">
                        <li class="sb-showcase-skin checkable ${(selectedBrands?.contains(brand._id?.id) ? 'active' : '')}">
                            <g:if test="${type == 'filter'}">
                                <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}" f="${params.f}"
                                                      remove="${(selectedBrands?.contains(brand._id?.id)).toString()}" type="icon" ></eshop:filterAddBrand>

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
    </div>

    <div class="showbiz-navigation center sb-nav-dark table-cell">
        <div class="sb-navigation-left" id="showbiz_left_${id}"><i class="icon-left-open"></i></div>

    </div>
</div>

<div class="sb-clear"></div>

<script type="text/javascript">

    jQuery(document).ready(function () {
        jQuery('#carousel_${id}').showbizpro({
            dragAndScroll: "of",
            <g:if test="${mode=='large'}">
            visibleElementsArray: [6, 5, 4, 3, 2, 1],
            </g:if>
            <g:else>
            visibleElementsArray: [8, 7, 6, 5, 4, 3, 2, 1],
            </g:else>
            carousel: "on"
        });
    });

</script>



