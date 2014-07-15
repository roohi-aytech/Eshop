<%@ page import="grails.converters.JSON; eshop.MenuConfig; eshop.ProductType" %>
<% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
<g:set var="rootProductTypes" value="${productService.findRootProductTypes()}"/>
<% def browseService = grailsApplication.classLoader.loadClass('eshop.BrowseService').newInstance() %>

<ul class="btn-group">
    <g:each in="${rootProductTypes}" var="rpt">
        <g:set var="pt" value="${ProductType.get(rpt.id)}"/>
        <li class="root">
            <a class="dropdown-toggle rootLink" data-toggle="dropdown"
               href="${createLink(uri: "/browse/${pt.seoFriendlyName}")}"><span>${rpt.name}</span></a>
            <g:set var="menuConfig" value="${MenuConfig.findByProductType(pt) ?: new eshop.MenuConfig()}"/>
            <g:set var="productTypes" value="${ProductType.findAllByDeletedNotEqual(true)}"/>
            <div class="top-menu dropdown-menu content" id="top-menu${pt.id}">
                <div class="inner">
                    <div class="heading"><g:message code="menu.header.title"
                                                    args="[pt.name, createLink(uri: '/browse/' + pt.seoFriendlyName)]"/></div>

                    <div class="links_container">
                        <ul class="cat_hover_banner">
                            <li class="cat_slogan_banner"><img
                                    src="${createLink(controller: 'image', params: [id: pt.id, type: 'productTypeMenu', role: 'e1'])}">
                            </li>
                            <li>
                                <div class="free_shipping_hover"><a target="_blank"
                                                                    href="${createLink(uri: '/site/paymentAndDelivery')}"><img
                                            width="30" height="19" border="0" alt=""
                                            src="${resource(dir: 'images/felfel', file: 'free_shipping_icon.png')}">
                                </a>

                                    <p><a target="_blank"
                                          href="${createLink(uri: '/site/paymentAndDelivery')}"><g:message
                                                code="menu.shipping.title"/></a><span
                                            class="subtitle"><g:message
                                                code="menu.startPrice"/> ${eshop.productTypeMinPrice(productTypeId: pt.id)} <g:message
                                                code="rial"/>
                                    </span></p>
                                </div>

                                <div class="free_shipping_hover"><a target="_blank"
                                                                    href="http://blog.felfel.ir/"><img width="112"
                                                                                                       height="16"
                                                                                                       border="0"
                                                                                                       alt=""
                                                                                                       src="${resource(dir: 'images/felfel', file: 'bon_homie.png')}">
                                </a>

                                    <p><span class="subtitle"><a target="_blank"
                                                                 href="http://blog.felfel.ir/"><g:message
                                                code="menu.blog.link"/></a>
                                    </span></p>
                                </div>
                            </li>
                        </ul>
                        <g:set var="columnsCount" value="${0}"/>

                        <g:each in="${1..3}" var="rptCounter">
                            <g:if test="${menuConfig["column${rptCounter}"]}">
                                <g:set var="rootNode" value="${JSON.parse(menuConfig["column${rptCounter}"])}"/>
                                <g:if test="${rootNode.children.flatten().size() > 0}">
                                    <ul class="${rptCounter > 1 ? 'border-right' : ''}">
                                        <g:each in="${rootNode.children.flatten()}">
                                            <g:render
                                                    template="/layouts/${grailsApplication.config.eShop.instance}/menu_productType"
                                                    model="${[node: it, productTypes: productTypes]}"/>
                                        </g:each>
                                        <g:if test="${rptCounter == 3}">
                                            <li>
                                                <div class="cat_slogan_banner">
                                                    <img src="${createLink(controller: 'image', params: [id: pt.id, type: 'productTypeMenu', role: 'e2'])}">
                                                </div>
                                            </li>
                                        </g:if>
                                    </ul>
                                    <g:set var="columnsCount" value="${columnsCount + 1}"/>
                                </g:if>
                            </g:if>
                        </g:each>
                        <ul class="shop_by_brands">
                            <li><img
                                    src="${createLink(controller: 'image', params: [id: pt.id, type: 'productTypeMenu', role: 'e3'])}">
                            </li>
                            <li class="">
                                <div class="shop_by_brands">
                                    <div class="title_div"><g:message code="menu.shopByBrand.title"/></div>
                                    <eshop:productTypeTopBrands productTypeId="${pt.id}"
                                                                max="${menuConfig.maxBrandsCount}"/>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </li>
    </g:each>
    <li id="span"></li>
</ul>
<script language="javascript" type="text/javascript">
    var disable_mouse_leave = false;
    $(document).ready(function () {
        $('.header .navigation li.root a.rootLink').click(function () {
            window.location.href = $(this).attr('href');
            return false;
        });
        $('.header .navigation li.root').hoverIntent(
                {
                    interval: 100,
                    sensitivity: 7,
                    timeout: 800,
                    over: function () {
                        var openCount = $('.header .navigation li.root.open').length;
                        var menuItem = $(this);
                        if (openCount > 0) {

                            $('.header .navigation li.root').find('div.top-menu').fadeOut(500);
                            menuItem.addClass('open').find('div.top-menu').fadeIn(500);
                        }
                        else {
                            $('.header .navigation li.root').removeClass('open').find('div.top-menu').hide();
                            menuItem.addClass('open').find('div.top-menu').css('opacity', 0).animate({
                                "height": "show",
                                "marginTop": "show",
                                "marginBottom": "show",
                                "paddingTop": "show",
                                "paddingBottom": "show",
                                "opacity": 1
                            }, 500);
                        }
                    },
                    out: function () {
                        $(this).removeClass('open').find('div.top-menu').hide();
                    }});
    });
</script>