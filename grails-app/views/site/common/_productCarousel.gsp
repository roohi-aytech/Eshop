<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.themepunch.showbizpro.css')}" type="text/css">
<g:javascript src="jquery.themepunch.plugins.js"></g:javascript>
<g:javascript src="jquery.themepunch.showbizpro.js"></g:javascript>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.fancybox.css')}" type="text/css">
<g:javascript src="jquery.fancybox.js"></g:javascript>
<h3>${title}</h3>
<div class="table">
    <div class="showbiz-navigation center sb-nav-dark table-cell">

        <div class="sb-navigation-right" id="showbiz_right_4"><i class="icon-right-open"></i></div>

    </div>

    <div id="example4" class="showbiz-container table-cell">
        <div class="showbiz" data-left="#showbiz_left_4" data-right="#showbiz_right_4">
            <div class="overflowholder">
                <ul>
                    <g:each in="${productList}" var="product">
                        <li class="sb-showcase-skin">
                            <g:render template="product_search" model="${[product: product]}"></g:render>
                        </li>
                    </g:each>
                </ul>

                <div class="sbclear"></div>
            </div>

            <div class="sbclear"></div>
        </div>
    </div>

    <div class="showbiz-navigation center sb-nav-dark table-cell">
        <div class="sb-navigation-left" id="showbiz_left_4"><i class="icon-left-open"></i></div>

    </div>
</div>

<div class="sb-clear"></div>

<script type="text/javascript">

    jQuery(document).ready(function () {
        jQuery('#example4').showbizpro({
            dragAndScroll: "of",
            visibleElementsArray: [6, 5, 4, 3, 2, 1],
            carousel: "on"
        });
    });

</script>



