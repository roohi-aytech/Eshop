
%{--<div id="navigator_root">--}%
    %{--<a href="${createLink(uri: '/')}site/browse/${message(code: "applicances")}" id="navigator_appliance"><g:message--}%
            %{--code="applicances"></g:message></a>--}%
    %{--<a href="${createLink(uri: '/')}site/browse/${message(code: "digital")}" id="navigator_digital"><g:message--}%
            %{--code="digital"></g:message></a>--}%
%{--</div>--}%
<ul class="nav nav-list">
    <g:if test="${productType.children}">
        <li class="nav-header"><g:message code="site.selectSubcategory"
                                          default="Select SubProductType"></g:message></li>
    </g:if>
    <g:each in="${subProductTypeLinks}" var="subProductTypeLink">
        <li><a href="${subProductTypeLink.href}">${subProductTypeLink.name}</a></li>
    </g:each>
    <li class="divider"></li>

%{--Brands Filters--}%
    <g:if test="${filters?.brands}">
        <li class="nav-header sidebarBrandGroup"><g:message code="site.selectBrand"
                                                            default="Select Brand"></g:message></li>
        <g:each in="${filters.brands}" var="brand">
            <li class="checkable">
                <eshop:filterStartBrand productType="${productType}" brandId="${brand._id?.id}"
                                        brandName="${brand._id?.name}"></eshop:filterStartBrand>
            </li>
        </g:each>
        <li class="divider"></li>
    </g:if>

%{--Attribute Filters--}%
    <g:if test="${filters?.attributes}">
        <g:each in="${filters.attributes}" var="attribute">
            <li class="nav-header sidebarAttributeGroup">${attribute.value.name}</li>
            <g:each in="${attribute.value.countsByValue.count{it} > 5? attribute.value.countsByValue[0..4]:attribute.value.countsByValue}" var="attributeValueCount">
                <li class="checkable">
                    <eshop:filterStart productType="${productType}" attribute="${attribute.key}"
                                       value="${attributeValueCount._id}"></eshop:filterStart>
                </li>
            </g:each>
        </g:each>
        <li class="divider"></li>
    </g:if>
</ul>