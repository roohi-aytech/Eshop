<%@ page import="grails.converters.JSON; eshop.MenuConfig; eshop.ProductType" %>
<% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
<g:set var="rootProductTypes" value="${productService.findRootProductTypes()}"/>
<g:set var="productTypes" value="${ProductType.findAllByDeletedNotEqual(true)}"/>

<ul class="btn-group pull-right menu-full">
    <g:each in="${rootProductTypes}" var="rpt">
        <g:set var="pt" value="${ProductType.get(rpt.id)}"/>
        <li class="root">
            <a class="dropdown-toggle" data-toggle="dropdown" href="${createLink(uri:"/browse/${pt.seoFriendlyName}")}"><span>${rpt.name}</span></a>
            <g:set var="menuConfig" value="${MenuConfig.findByProductType(pt)}"/>
            <div class="top-menu dropdown-menu content" id="top-menu${pt.id}">
                <div class="inner"
                     style="background-image: url(${createLink(controller: 'image', params: [id: pt.id, type: 'productTypeMenu'])});">
                    <table>
                        <tr>
                            <g:set var="columnsCount" value="${0}"/>
                            <g:each in="${1..6}">
                                <g:set var="rootNode" value="${JSON.parse(menuConfig["column${it}"])}"/>
                                <g:if test="${rootNode.children.flatten().size() > 0}">
                                    <td>
                                        <ul>
                                            <g:each in="${rootNode.children.flatten()}">
                                                <g:render template="/layouts/${grailsApplication.config.eShop.instance}/menu_productType"
                                                          model="${[node: it, productTypes: productTypes]}"/>
                                            </g:each>
                                        </ul>
                                    </td>
                                    <g:set var="columnsCount" value="${columnsCount + 1}"/>
                                </g:if>
                            </g:each>
                        </tr>
                    </table>
                </div>
            </div>
            <script type="text/javascript" language="javascript">
                $('.top-menu#top-menu${pt.id} .inner td').css('width', '${100F/columnsCount}%');
//                $(document).ready(function(){
                    $('li.root a').click(function(){
                        window.location.href = $(this).attr('href');
                    });
//                });
            </script>
        </li>
    </g:each>
</ul>
<script language="javascript" type="text/javascript">
    $('.header-menu-row li.root').hover(function () {
        var hoveredItem = this;
        $('.header-menu-row li.root').each(function () {
            if (this != hoveredItem)
                $(this).removeClass('open');
        });
    });
</script>