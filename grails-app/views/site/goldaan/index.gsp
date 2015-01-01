<%@ page import="eshop.Product" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title><g:message code="site.mainPage.title-goldaan"/></title>
    <!-- E7zma1ATwR6TvWerhh0l7txRVh0 -->
    <meta name="description" content="${message(code: 'site.mainPage.description')}">
    <meta name="keywords" content="${message(code: 'site.mainPage.keywords-goldaan')}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="">


    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    %{--<!--[if lt IE 9]>--}%
    <!--<script src="http://html5shim.googlecode.com/svn/trunk/html5" type="text/javascript"/>-->
    %{--<![endif]-->--}%
    <script language="JavaScript">

    </script>
    %{--<!-- Start Alexa Certify Javascript -->--}%
    %{--<script type="text/javascript">--}%
    %{--_atrk_opts = { atrk_acct:"y2lmi1a8s700WQ", domain:"zanbil.ir",dynamic: true};--}%
    %{--(function() { var as = document.createElement('script'); as.type = 'text/javascript'; as.async = true; as.src = "https://d31qbv1cthcecs.cloudfront.net/atrk.js"; var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(as, s); })();--}%
    %{--</script>--}%
    %{--<noscript><img src="https://d5nxst8fruw4z.cloudfront.net/atrk.gif?account=y2lmi1a8s700WQ" style="display:none" height="1" width="1" alt="" /></noscript>--}%
    %{--<!-- End Alexa Certify Javascript -->--}%

</head>

<body>
<table class="layout-container table-simulated">
    <tr class="table-row">
        <td colspan="2">
            <ehcache:render template="common/slideshowMain_goldaan"/>
        </td>
    </tr>
    <tr class="table-row">
        <td colspan="2">
            <div class="mostvisited-nav">
                <g:each in="${mostVisitedProducts}" var="product">
                    <g:render template="goldaan/templates/productThumbnail"
                              model="${[product: product, size: '200x200']}"/>
                </g:each>
            </div>
            <div class="mostvisited-nav">
                <eshop:randomProduct>

                    <g:render template="goldaan/templates/productThumbnail"
                              model="${[product: product, size: '200x200']}"/>
                </eshop:randomProduct>
            </div>
        </td>
    </tr>
    %{--<tr class="table-row">--}%
    %{--<td colspan="2">--}%
    %{--<table class="table-simulated">--}%
    %{--<tr>--}%
    %{--<td class="specialSales-cell">--}%
    %{--<ehcache:render template="common/slideshowSpecialSales"--}%
    %{--model="[specialSaleSlides: specialSaleSlides]"/>--}%
    %{--</td>--}%
    %{--<td class="namad-cell">--}%
    %{--<ehcache:render template="banners/enamad"/>--}%
    %{--</td>--}%
    %{--</tr>--}%
    %{--</table>--}%
    %{--</td>--}%
    %{--</tr>--}%
    <tr class="table-row">
        <td class="table-cell">
            <div class="banners-container">
                <div class="banners-hover">
                    <ehcache:render template="banners/rightsideBanners"/>
                    <ehcache:render template="banners/leftsideBanners"/>
                </div>
            </div>
        </td>
    </tr>

    <tr class="table-row">
        <td class="table-cell">
            <div class="stay-connected">
                <div class="sign-up">
                    <g:link controller="customer" action="register" class="signup-a"><g:message
                            code="signup-in-goldaan"/></g:link>
                    <div class="sign-up-help"><g:message code="signup-in-goldaan-help"/></div>
                </div>

                <div class="stconnected">
                    <div>
                        <g:message code="stay-connected"/>
                    </div>
                    <br/>

                    <div>
                        <div class="social-links">

                            <div><a href="http://www.facebook.com/sharer.php?u=${createLink(uri: "/", absolute: true)}"
                                    target="_blank"><img src="${resource(dir: 'images/social', file: 'facebook.png')}"/>
                            </a>
                            </div>

                            <div><a href="http://twitter.com/share?url=${createLink(uri: "/", absolute: true)}&text=${message(code: 'name')}"
                                    target="_blank"><img src="${resource(dir: 'images/social', file: 'twitter.png')}"/>
                            </a>
                            </div>
                            %{--<div><a href="mailto:?${product.manualTitle ? product.pageTitle : title}&Body=I%20saw%20this%20and%20thought%20of%20you!%20 ${createLink(uri: "/product/${params.id}", absolute: true)}"><img--}%
                            %{--src="${resource(dir: 'images/goldaan', file: 'email.png')}"/></a> </div>--}%

                            %{--<div><a href="https://plus.google.com/share?url=${createLink(uri: "/", absolute: true)}"--}%
                                    %{--target="_blank"><img src="${resource(dir: 'images/social', file: 'google.png')}"/>--}%
                            %{--</a>--}%
                            %{--</div>--}%
                            <div>
                            <a href="https://plus.google.com/101996537594125028951" rel="publisher"><img src="${resource(dir: 'images/social', file: 'google.png')}"/></a>
                            </div>
                            <div><a href="https://instagram.com/goldaan.ir"
                                    target="_blank"><img
                                        src="${resource(dir: 'images/social', file: 'instagram.png')}"/>
                            </a></div>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
    %{--<tr class="table-row">--}%
    %{--<td class="table-cell" colspan="2">--}%
    %{--<g:render template="common/productCarousel"--}%
    %{--key="${productTypeId}"--}%
    %{--model="${[title: message(code: 'product.mostVisited.list', args: ['']), productList: mostVisitedProducts]}"/>--}%
    %{--</td>--}%
    %{--</tr>--}%
    %{--<tr class="table-row">--}%
    %{--<td colspan="2" class="table-cell">--}%
    %{--<% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>--}%
    %{--<g:set var="lastVisitedProducts"--}%
    %{--value="${productService.findLastVisitedProducts(cookie(name: 'lastVisitedProducts'))}"/>--}%
    %{--<g:if test="${lastVisitedProducts && !lastVisitedProducts.isEmpty()}">--}%
    %{--<g:render template="/site/common/productCarousel"--}%
    %{--model="${[title: message(code: 'product.lastVisited.list'), productList: lastVisitedProducts, mode: 'large']}"/>--}%
    %{--</g:if>--}%
    %{--</td>--}%
    %{--</tr>--}%
    %{--<tr class="table-row">--}%
    %{--<td class="table-cell" colspan="2">--}%
    %{--<g:render template="news/window" model="${[productTypeId: productTypeId]}"/>--}%
    %{--</td>--}%
    %{--</tr>--}%
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