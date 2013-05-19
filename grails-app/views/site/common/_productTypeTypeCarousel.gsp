<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.themepunch.showbizpro.css')}" type="text/css">
<g:javascript src="jquery.themepunch.plugins.js"></g:javascript>
<g:javascript src="jquery.themepunch.showbizpro.js"></g:javascript>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.fancybox.css')}" type="text/css">
<g:javascript src="jquery.fancybox.js"></g:javascript>
<g:set var="id" value="${java.util.UUID.randomUUID()}"></g:set>
<div class="table productTypeType-carousel-container">
    <div class="showbiz-navigation center sb-nav-dark table-cell">

        <div class="sb-navigation-right" id="showbiz_right_${id}"><i class="icon-right-open"></i></div>

    </div>

    <div id="carousel_${id}" class="showbiz-container table-cell">
        <div class="showbiz" data-left="#showbiz_left_${id}" data-right="#showbiz_right_${id}">
            <div class="overflowholder">
                <ul class="brand-carousel">
                    <g:each in="${productTypeTypeLinks}" var="productTypeTypeLink">
                        <li class="sb-showcase-skin">
                            <a href="${productTypeTypeLink.href}">
                                <img src="${createLink(controller: 'image', params: [type:'productTypeType', id:productTypeTypeLink.id, wh:'100x100'])}" alt="${productTypeTypeLink.name}">
                            </a>
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