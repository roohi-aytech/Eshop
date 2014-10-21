<%@ page import="eshop.ProductType" %>
%{--<g:set var="pt" value="${ProductType.get(node.key)}"/>--}%
<li class="depth_${productTypes.find{it.id == node.key.toLong()}?.depth} ${node.children?.size()?'hasChildren':''}">
    <g:link uri="/browse/${productTypes.find{it.id == node.key.toLong()}?.seoFriendlyName}">${productTypes.find{it.id == node.key.toLong()}?.name}</g:link>
    <g:if test="${node.children?.size()}">
        <ul>
            <g:each in="${node.children.flatten()}">
                <g:render template="/layouts/${grailsApplication.config.eShop.instance}/menu_productType" model="${[node: it, productTypes: productTypes]}"/>
            </g:each>
        </ul>
    </g:if>
</li>