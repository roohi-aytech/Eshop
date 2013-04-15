<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.themepunch.showbizpro.css')}" type="text/css">
<g:javascript src="jquery.themepunch.plugins.js"></g:javascript>
<g:javascript src="jquery.themepunch.showbizpro.js"></g:javascript>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.fancybox.css')}" type="text/css">
<g:javascript src="jquery.fancybox.js"></g:javascript>
<h3>${title}</h3>
<g:set var="id" value="${java.util.UUID.randomUUID()}"></g:set>
<div class="table">
    <div class="showbiz-navigation center sb-nav-dark table-cell">

        <div class="sb-navigation-right" id="showbiz_right_${id}"><i class="icon-right-open"></i></div>

    </div>

    <div id="carousel_${id}" class="showbiz-container table-cell">
        <div class="showbiz" data-left="#showbiz_left_${id}" data-right="#showbiz_right_${id}">
            <div class="overflowholder">
                <ul>
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
        jQuery('#carousel_${id}').showbizpro({
            dragAndScroll: "of",
            <g:if test="${mode=='large'}">
            visibleElementsArray: [6, 5, 4, 3, 2, 1],
            </g:if>
            <g:else>
            visibleElementsArray: [5, 4, 3, 2, 1],
            </g:else>
            carousel: "on"
        });
    });

</script>



