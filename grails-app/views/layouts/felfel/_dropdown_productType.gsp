<li class="${productType.children ? 'dropdown-submenu' :''}">
    <a href="#"
       onclick="$('#hidCategory').val('p${productType.id}');$('#searchCategory').html('${productType.name}')">${productType.name}</a>

    <g:if test="${productType.children}">
        <ul class="dropdown-menu">
            <g:each in="${productType.children}" var="pt">
                <ehcache:render template="/layouts/${grailsApplication.config.eShop.instance}/dropdown_productType" model="${[productType: pt]}"/>
            </g:each>
        </ul>
    </g:if>
</li>