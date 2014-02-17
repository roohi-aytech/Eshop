<link href="${resource(dir: 'css', file: 'jquery.themepunch.showbizpro.css')}" rel="stylesheet" type="text/css"/>
<script language="javascript" src="${resource(dir: 'js', file: 'jquery.themepunch.plugins.js')}"
        type="text/javascript"></script>
<script language="javascript" src="${resource(dir: 'js', file: 'jquery.themepunch.showbizpro.js')}"
        type="text/javascript"></script>
<g:set var="id" value="${java.util.UUID.randomUUID()}"/>

<h3 class="showbiz-header"><g:message code="productType.select"/></h3>
<table class="table-simulated productType-carousel-container">
    <tr>
        <td class="showbiz-navigation center sb-nav-dark table-cell">

            <div class="sb-navigation-right" id="showbiz_right_${id}"><i class="icon-right-open"></i></div>

        </td>

        <td id="carousel_${id}" class="showbiz-container table-cell">
            <div class="showbiz" data-left="#showbiz_left_${id}" data-right="#showbiz_right_${id}">
                <div class="overflowholder">
                    <ul class="productType-carousel">
                        <g:each in="${subProductTypeLinks}" var="productTypeLink">
                            <li class="sb-showcase-skin">
                                <g:if test="${type == 'filter'}">
                                    <a href="${createLink(controller: "site", action: "filter", params: params + [f: "${params.f},p${productTypeLink._id.id}"])}">
                                        <img src="${createLink(controller: 'image', params: [type: 'productType', id: productTypeLink._id.id, wh: '100x100'])}"
                                             alt="${productTypeLink._id.name}">

                                        <div>${productTypeLink._id.name}</div>
                                    </a>
                                </g:if>
                                <g:else>
                                    <a href="${productTypeLink.href}">
                                        <img src="${createLink(controller: 'image', params: [type: 'productType', id: productTypeLink.id, wh: '100x100'])}"
                                             alt="${productTypeLink.name}">

                                        <div>${productTypeLink.name}</div>
                                    </a>
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

        var itemsCount = ${subProductTypeLinks.count{it}};

        var width = $('#carousel_${id}').width();
        var visibleCount = Math.floor(width / 140);

        if (itemsCount > visibleCount) {
            jQuery('#carousel_${id}').showbizpro({
                elementSize: 140
            });
        }
        else {
            var carousel = $('#carousel_${id} .productType-carousel');
            carousel.parent().parent().parent().parent().replaceWith(carousel);
            carousel.removeClass('productType-carousel').addClass('static-productType-carousel');
        }
    });

</script>