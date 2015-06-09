<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title><g:message code="site.mainPage.title"/></title>
    <!-- E7zma1ATwR6TvWerhh0l7txRVh0 -->
    <meta name="description" content="${message(code: 'site.mainPage.description')}">
    <meta name="keywords" content="${message(code: 'site.mainPage.keywords')}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="">


    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    %{--<!--[if lt IE 9]>--}%
    <!--<script src="http://html5shim.googlecode.com/svn/trunk/html5" type="text/javascript"/>-->
    %{--<![endif]-->--}%



</head>

<body>
%{--<cache:block>--}%
<table class="layout-container table-simulated">
    <tr class="table-row">
        <td colspan="2">
            <ehcache:render template="common/slideshowMain"/>
        </td>
    </tr>
    <g:if test="${specialSaleSlides && !specialSaleSlides?.isEmpty()}">
        <tr class="table-row">
            <td colspan="2">
                <table class="table-simulated">
                    <tr>
                        <td class="specialSales-cell">
                            <ehcache:render template="common/slideshowSpecialSales"
                                      model="[specialSaleSlides: specialSaleSlides]"/>
                        </td>
                        <td class="namad-cell" id="enamad-cell">
                            %{--<ehcache:render template="banners/enamad"/>--}%
                        </td>
                        <script>
                            $(function(){
                                setTimeout(function() {
                                    $('#enamad-cell').load('<g:createLink controller="site" action="enamad" />')
                                },1000);
                            })
                        </script>
                    </tr>
                </table>
            </td>
        </tr>
    </g:if>
    <tr class="table-row">
        <td class="table-cell banners">
            <ehcache:render template="banners/rightsideBanners"/>
        </td>

        <td class="table-cell">

            <ehcache:render template="common/browsingGraphicalMenuNew"/>

            <ehcache:render template="common/productGrid"
                      model="${[productIds: filters.products.productIds]}"/>
        </td>
        %{--</tr>--}%
    <tr class="table-row">
        <td class="table-cell" colspan="2">
            <ehcache:render template="common/productCarousel"
                      key="${productTypeId}"
                      model="${[title: message(code: 'product.mostVisited.list', args: ['']), productList: mostVisitedProducts]}"/>
        </td>
    </tr>
    <tr class="table-row">
        <td colspan="2" class="table-cell">
            <% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
            <g:set var="lastVisitedProducts"
                   value="${productService.findLastVisitedProducts(cookie(name: 'lastVisitedProducts'))}"/>
            <g:if test="${lastVisitedProducts && !lastVisitedProducts.isEmpty()}">
                <ehcache:render template="/site/common/productCarousel"
                          model="${[title: message(code: 'product.lastVisited.list'), productList: lastVisitedProducts, mode: 'large']}"/>
            </g:if>
        </td>
    </tr>
    <tr class="table-row">
        <td class="table-cell" colspan="2">
            <ehcache:render template="news/window" model="${[productTypeId: productTypeId]}" key="${productTypeId}"/>
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
%{--</cache:block>--}%
</body>
</html>