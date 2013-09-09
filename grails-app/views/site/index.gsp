<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title><g:message code="site.mainPage.title"/></title>
    <!-- E7zma1ATwR6TvWerhh0l7txRVh0 -->
    <meta name="description" content="${message(code:'site.mainPage.description')}">
    <meta name="keywords" content="${message(code:'site.mainPage.keywords')}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="">


    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5" type="text/javascript"/>
    <![endif]-->

</head>

<body>
<table class="layout-container table-simulated">
    <tr class="table-row">
        <td class="span180 table-cell">
            <div class="well sidebar-nav home">
                <cache:render template="common/browsingTextualMenu"/>
            </div>
            <cache:render template="banners/rightsideBanners"/>
        </td>

        <td class="table-cell">
            <table class="table-simulated">
                <tr class="table-row">
                    <td>
                    <g:render template="common/slideshowMain"/>
                    </td>
                </tr>

                <tr class="table-row">
                    <td class="table-cell">
                        <table class="table-simulated">
                            <tr class="table-row">

                                <td class="span600 table-cell">

                                    <cache:render template="common/slideshowSpecialSales"
                                              model="[specialSaleSlides: specialSaleSlides]"/>

                                    <cache:render template="common/browsingGraphicalMenu"/>

                                    <g:render template="common/productGrid"
                                              model="${[productIds: filters.products.productIds]}"/>
                                </td>

                                <td class="span200 table-cell">
                                    <cache:render template="banners/enamad"/>
                                    <cache:render template="banners/leftsideBanners"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<script type="text/javascript">
    (function ($) {
        $('.row-fluid ul.thumbnails li.span6:nth-child(2n + 3)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span4:nth-child(3n + 4)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span3:nth-child(4n + 5)').css('margin-right', '0px');
    })(jQuery);
</script>
</body>
</html>