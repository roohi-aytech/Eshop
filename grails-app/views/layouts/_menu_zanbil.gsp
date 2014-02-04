<%@ page import="grails.converters.JSON; eshop.MenuConfig; eshop.ProductType" %>
<% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
<g:set var="rootProductTypes" value="${productService.findRootProductTypes()}"/>

<ul class="btn-group pull-right">
    <g:each in="${rootProductTypes}" var="rpt">
        <g:set var="pt" value="${ProductType.get(rpt.id)}"/>
        <li>
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span>${rpt.name}</span></a>
            <g:set var="menuConfig" value="${MenuConfig.findByProductType(pt)}"/>
            <g:set var="productTypes" value="${ProductType.findAllByDeletedNotEqual(true)}"/>
            <div class="top-menu dropdown-menu content" id="top-menu${pt.id}">
                <div class="inner" style="background-image: url(${createLink(controller:'image', params:[id:pt.id, type:'productTypeMenu'])});">
                    <table>
                        <tr>
                            <g:set var="columnsCount" value="${0}"/>
                            <g:each in="${1..6}">
                                <g:set var="rootNode" value="${JSON.parse(menuConfig["column${it}"])}"/>
                                <g:if test="${rootNode.children.flatten().size() > 0}">
                                    <td>
                                        <ul>
                                            <g:each in="${rootNode.children.flatten()}">
                                                <g:render template="/layouts/menu_productType_zanbil"
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
            </script>
        </li>
    </g:each>
</ul>