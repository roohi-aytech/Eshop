<li class="${productType.children ? 'dropdown-submenu' :''}">
    <a href="#"
       onclick="$('#hidCategory').val('p${productType.id}');$('#searchCategory').html('${productType.name}')">${productType.name}</a>

    <g:if test="${productType.children}">
        <ul class="dropdown-menu">
            <g:each in="${productType.children}" var="pt">
                <g:render template="/layouts/dropdown_productType_zanbil" model="${[productType: pt]}"/>
            </g:each>
        </ul>
    </g:if>
</li>