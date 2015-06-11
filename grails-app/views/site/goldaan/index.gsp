<%@ page import="eshop.Product" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title><g:message code="site.mainPage.title-goldaan"/></title>
    <!-- E7zma1ATwR6TvWerhh0l7txRVh0 -->
    <meta name="description" content="${message(code: 'site.mainPage.description-goldaan')}">
    <meta name="keywords" content="${message(code: 'site.mainPage.keywords-goldaan')}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="">
    <meta property="og:url"                content="http://www.goldaan.ir/" />
    <meta property="og:type"               content="website" />
    <meta property="og:title"              content="<g:message code="site.mainPage.title-goldaan"/>" />
    <meta property="og:description"        content="${message(code: 'site.mainPage.description-goldaan')}" />
    <meta property="og:image"              content="${resource(dir: 'images/goldaan',file: 'logo-bg.png')}" />
    <g:each in="${slides}" var="slide">
        <meta property="og:image"          content="${createLink(controller: "image", action: "index")}/${slide.id}?type=mainSlide" />
    </g:each>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    %{--<!--[if lt IE 9]>--}%
    <!--<script src="http://html5shim.googlecode.com/svn/trunk/html5" type="text/javascript"/>-->
    %{--<![endif]-->--}%

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
            <div id="body-container-slider" style="width: 950px;display: inline-block">
            </div>
            <ehcache:render template="common/slideshowMain_goldaan"/>
            <g:render template="/layouts/goldaan/boxTemplate" model="[header:message(code:'easy-buy'),size:300]">
                <div class="btn-slider">
                    <eshop:productTypeLink id="${grailsApplication.config.flowersId}">
                        <img src="<g:resource dir="images/goldaan" file="flower.png" />">
                        <div><g:message code="buy-flower" /></div>
                    </eshop:productTypeLink>
                </div>
                <div class="btn-slider">
                    <eshop:productTypeLink id="${grailsApplication.config.pastriesId}">
                        <img src="<g:resource dir="images/goldaan" file="pastry.png" />">
                        <div><g:message code="buy-pastry" /></div>
                    </eshop:productTypeLink>
                </div>
                <div class="btn-slider">
                    <eshop:glSpecialOfferLink>
                        <img src="<g:resource dir="images/goldaan" file="sale.png" />">
                        <div><g:message code="weekly-offer" /></div>
                    </eshop:glSpecialOfferLink>
                </div>
                <div class="btn-slider">
                    <g:link controller="site" action="filter" params="[f:'rf0',sort:'modelId',dir:-1]">
                        <img src="<g:resource dir="images/goldaan" file="gift.png" />">
                        <div><g:message code="all-products" /></div>
                    </g:link>
                </div>
            </g:render>
        </td>
    </tr>
    <tr class="table-row ">
        <td colspan="2" class="padtop10">
            <g:render template="/layouts/goldaan/boxTemplate" model="[header:message(code:'etminandarkharid'),size:189]">
                <ehcache:render template="/site/banners/enamad"/>
            </g:render>
            <sec:ifLoggedIn>
                <g:render template="/layouts/goldaan/boxTemplate" model="[header:message(code:'logout'),size:189]">
                    <a rel="nofollow" href="<g:createLink controller="logout" action="index" />">
                        <div class="center">
                            <img src="<g:resource dir="images/goldaan" file="logout.png" />">
                        </div>
                    </a>
                </g:render>
                <g:render template="/layouts/goldaan/boxTemplate" model="[header:message(code:'profile'),size:189]">
                    <a rel="nofollow" href="<g:createLink controller="customer" action="panel" />">
                        <div class="center">
                            <img src="<g:resource dir="images/goldaan" file="home.png" />">
                        </div>
                    </a>
                </g:render>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <g:render template="/layouts/goldaan/boxTemplate" model="[header:message(code:'ozviat'),size:189]">
                    <a rel="nofollow" href="<g:createLink controller="customer" action="register" />">
                        <div class="center">
                            <img src="<g:resource dir="images/goldaan" file="register.png" />">
                        </div>
                    </a>
                </g:render>
                <g:render template="/layouts/goldaan/boxTemplate" model="[header:message(code:'vorood'),size:189]">
                    <a rel="nofollow" href="<g:createLink controller="login" action="auth" />">
                        <div class="center">
                            <img src="<g:resource dir="images/goldaan" file="login.png" />">
                        </div>
                    </a>
                </g:render>
            </sec:ifNotLoggedIn>
            <g:render template="/layouts/goldaan/boxTemplate" model="[header:message(code:'iphone'),size:189]">
                <a rel="nofollow" href="https://itunes.apple.com/us/app/id944634618">
                    <div class="center">
                        <img src="<g:resource dir="images/goldaan" file="apple.jpg" />">
                    </div>
                </a>
            </g:render>
            <g:render template="/layouts/goldaan/boxTemplate" model="[header:message(code:'android'),size:189]">
                <a rel="nofollow" href="https://play.google.com/store/apps/details?id=ir.agah.eshop.goldaan">
                    <div class="center">
                        <img src="<g:resource dir="images/goldaan" file="googleplay.jpg" />">
                    </div>
                </a>
                <a rel="nofollow" href="http://cafebazaar.ir/app/ir.agah.eshop.goldaan/">
                    <div class="center">
                        <img src="<g:resource dir="images/goldaan" file="bazar.png" />">
                    </div>
                </a>
            </g:render>
            <g:render template="/layouts/goldaan/boxTemplate" model="[header:message(code:'social-network'),size:189]">
                <div class="social-top" title="Facebook">
                    <a href="http://www.facebook.com/Goldaan.ir" target="_blank">
                        <img src="${resource(dir: 'images/goldaan', file: 'facebook.png')}"/>
                    </a>
                </div>

                <div class="social-top" title="Twitter">
                    <a href="http://twitter.com/goldaanir" target="_blank">
                        <img src="${resource(dir: 'images/goldaan', file: 'twitter.png')}"/>
                    </a>
                </div>
                <div class="social-top" title="LinkedIn">
                    <a href="https://www.linkedin.com/company/goldaan" target="_blank">
                        <img src="${resource(dir: 'images/goldaan', file: 'linkedin.png')}"/></a>
                    </a>
                </div>
                <div class="social-top" title="Instagram">
                    <a href="https://instagram.com/goldaan.ir" target="_blank">
                        <img src="${resource(dir: 'images/goldaan', file: 'instagram.png')}"/></a>
                </div>
                <div class="social-top" title="${message(code:'goldaanmagazin')}">
                    <a href="#" target="_blank">
                        <img src="${resource(dir: 'images/goldaan', file: 'goldaanmagazin.png')}"/></a>
                    </a>
                </div>
                <div class="social-top" title="Google+">
                    <a href="https://plus.google.com/+GoldaanIr" target="_blank">
                        <img src="${resource(dir: 'images/goldaan', file: 'googleplus.png')}"/>
                    </a>
                </div>
                <script language="JavaScript">
                    $('.social-top').each(function(){
                        $(this).qtip({
                            content: $(this).attr('title'),
                            position: {
                                my: 'top right',
                                at: 'bottom center'
                            }
                    })});
                </script>
            </g:render>
        </td>
    </tr>
    <tr class="table-row ">
        <td colspan="2" class="padtop15 h300">
            <link  href="${resource(dir: 'css', file: 'dock.css')}" rel="stylesheet" type="text/css"/>
            <div class="dock">
            <ul>
                <li>
                    <eshop:productTypeLink id="${grailsApplication.config.flowersId}">
                        <img src='<g:resource dir="images/goldaan" file="gol.png" />'/>
                        <div><h4><g:message code="flowers" /></h4></div>
                    </eshop:productTypeLink>
                </li>
                <li>
                    <eshop:productTypeLink id="${grailsApplication.config.pastriesId}">
                        <img src="<g:resource dir="images/goldaan" file="cake.jpg" />">
                        <div><h4><g:message code="pastries" /></h4></div>
                    </eshop:productTypeLink>
                </li>
                <li>
                    <eshop:productTypeLink id="${grailsApplication.config.plantsId}">
                        <img src="<g:resource dir="images/goldaan" file="giah.png" />">
                        <div><h4><g:message code="plants" /></h4></div>
                    </eshop:productTypeLink>
                </li>
                <li>
                    <eshop:productTypeLink id="${grailsApplication.config.giftsId}">
                        <img src="<g:resource dir="images/goldaan" file="hadie.png" />">
                        <div><h4><g:message code="gifts" /></h4></div>
                    </eshop:productTypeLink>
                </li>
            </ul>
            </div>
        </td>
    </tr>
    <tr class="table-row">
        <td colspan="2">
            <div class="magazin-posts">
                <div><img src="<g:resource dir="images/goldaan" file="golmag1.png" />" ></div>
                <div style="width: 632px;"><g:message code="magazin-posts-here" /><div style="text-align: left;display: block"><span><g:message code="commingSoon" />...</span></div></div>
                <div><img src="<g:resource dir="images/goldaan" file="golmag2.png" />" ></div>
            </div>
        </td>
    </tr>
    <tr class="table-row">
        <td colspan="2">
            <div class="mostvisited-nav">
                <eshop:glFirstPageProducts productTypeId="${grailsApplication.config.flowersId}">
                    <g:render template="goldaan/templates/productThumbnail"
                              model="${[product: product, size: '200x200']}"/>
                </eshop:glFirstPageProducts>
            </div>
            <div class="mostvisited-nav">
                <eshop:glFirstPageProducts productTypeId="${grailsApplication.config.pastriesId}">
                    <g:render template="goldaan/templates/productThumbnail"
                              model="${[product: product, size: '200x200']}"/>
                </eshop:glFirstPageProducts>
            </div>
            <div class="mostvisited-nav">
                <eshop:glFirstPageProducts productTypeId="${grailsApplication.config.plantsId}">
                    <g:render template="goldaan/templates/productThumbnail"
                              model="${[product: product, size: '200x200']}"/>
                </eshop:glFirstPageProducts>
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
                    <g:link uri="#">
                        <img src="<g:resource dir="images/goldaan" file="mag-txt.png" />">
                        %{--<g:message code="goldaanmagazin"/>--}%
                    </g:link>
                    <div class="sign-up-help"><g:message code="magazine-goldaan-help"/></div>
                </div>

                <div class="stconnected">
                    <div>
                        <g:message code="stay-connected"/>
                    </div>
                    <br/>

                    <div>
                        <div class="social-links">

                            <span><a href="http://www.facebook.com/sharer.php?u=${createLink(uri: "/", absolute: true)}"
                                    target="_blank"><img src="${resource(dir: 'images/goldaan', file: 'facebook.png')}"/>
                            </a>
                            </span>

                            <span><a href="http://twitter.com/share?url=${createLink(uri: "/", absolute: true)}&text=${message(code: 'name')}"
                                    target="_blank"><img src="${resource(dir: 'images/goldaan', file: 'twitter.png')}"/>
                            </a>
                            </span>
                            %{--<div><a href="mailto:?${product.manualTitle ? product.pageTitle : title}&Body=I%20saw%20this%20and%20thought%20of%20you!%20 ${createLink(uri: "/product/${params.id}", absolute: true)}"><img--}%
                            %{--src="${resource(dir: 'images/goldaan', file: 'email.png')}"/></a> </div>--}%

                            %{--<div><a href="https://plus.google.com/share?url=${createLink(uri: "/", absolute: true)}"--}%
                                    %{--target="_blank"><img src="${resource(dir: 'images/social', file: 'google.png')}"/>--}%
                            %{--</a>--}%
                            %{--</div>--}%
                            <span>
                            <a href="https://plus.google.com/101996537594125028951" rel="publisher"><img src="${resource(dir: 'images/goldaan', file: 'googleplus.png')}"/></a>
                            </span>
                            <span><a href="https://instagram.com/goldaan.ir"
                                    target="_blank"><img
                                        src="${resource(dir: 'images/goldaan', file: 'instagram.png')}"/>
                            </a></span>
                        </div>
                    </div>
                </div>
                <div class="cooperation">
                    <div>
                        <g:message code="cooperation"/>
                    </div>
                    <div class="sign-up-help">
                        <g:message code="cooperation-txt"/>
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